Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.39492.1605551303737446197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 50D9F38C13AA
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] quota: upgrading to 4.06 FAILED
Message-ID: <MADEUP.16481067B067CB02.25243@lists.openembedded.org>
X-Groupsio-MsgNum: 144659
Content-Type: multipart/mixed; boundary="===============4776215770227270418=="

--===============4776215770227270418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *quota* to *4.06* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-quota-upgrade-4.05-4.06.patch
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

--===============4776215770227270418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/quota/quota-doc: PKGSIZE changed from 275080 to 64291 (-77%)

--===============4776215770227270418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1397 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (789 cached, 2 parsed). 1372 targets, 46 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-32 sysroot...done.
Removing 109 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6b35c949227c81f926748f89b8440b0e3082f6ce"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 544 Found 531 Missed 13 Current 195 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 739 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.181-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 259 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 260 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 261 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 274 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 279 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 281 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 282 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 293 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 300 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: Running setscene task 305 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.181-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 310 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 311 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 312 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 317 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 321 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 323 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 739 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 338 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 341 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 350 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_populate_sysroot_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 383 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 384 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 402 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.181-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 432 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 685 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_fetch)
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 738 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.181-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.5.0-r0: task do_fetch: Started
NOTE: Running setscene task 450 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 912 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_unpack)
NOTE: recipe quota-4.06-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe quota-4.06-r0: task do_fetch: Succeeded
NOTE: Running setscene task 457 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running task 971 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_unpack)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe quota-4.06-r0: task do_unpack: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 467 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_packagedata_setscene)
NOTE: recipe libnl-1_3.5.0-r0: task do_unpack: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1017 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_patch)
NOTE: recipe quota-4.06-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_patch)
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe quota-4.06-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1053 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.06-r0: task do_patch: Succeeded
NOTE: Running task 1071 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_deploy_source_date_epoch)
NOTE: Running task 1072 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_populate_lic)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe quota-4.06-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.06-r0: task do_populate_lic: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe quota-4.06-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_populate_lic unihash changed to 740bce7fb1717b8607c4f9da7254f668506c7ee8cd41bcce3c55e4b3c2bec2ab
NOTE: Running setscene task 537 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe quota-4.06-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 596 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 610 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 614 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 621 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 623 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 626 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 646 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 647 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 648 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 663 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 682 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 698 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 701 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 712 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1957 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2291 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_configure)
NOTE: recipe libnl-1_3.5.0-r0: task do_configure: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2292 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_compile)
NOTE: recipe libnl-1_3.5.0-r0: task do_compile: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_install)
NOTE: recipe libnl-1_3.5.0-r0: task do_install: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_install: Succeeded
NOTE: Running task 2294 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_package)
NOTE: Running task 2295 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.5.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2296 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.06-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.06-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_configure)
NOTE: recipe quota-4.06-r0: task do_configure: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.5.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2299 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.5.0.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.06-r0: task do_configure: Succeeded
NOTE: Running task 2300 of 2307 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_compile)
NOTE: recipe quota-4.06-r0: task do_compile: Started
ERROR: quota-4.06-r0 do_compile: oe_runmake failed
ERROR: quota-4.06-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/temp/run.do_compile.6501' failed with exit code 1:
make  all-recursive
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
Making all in po
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06/po'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06/po'
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quota.o quota.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaops.o quotaops.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio.o quotaio.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_v1.o quotaio_v1.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_v2.o quotaio_v2.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_tree.o quotaio_tree.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_rpc.o quotaio_rpc.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_xfs.o quotaio_xfs.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_meta.o quotaio_meta.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_generic.o quotaio_generic.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o bylabel.o bylabel.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o common.o common.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotasys.o quotasys.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o pot.o pot.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=      
                 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota.o `test -f 'rquota.c' || echo './'`rquota.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=      
                 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_client.o `test -f 'rquota_client.c' || echo './'`rquota_client.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=      
                 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_clnt.o `test -f 'rquota_clnt.c' || echo './'`rquota_clnt.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotasync.o quotasync.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck.o `test -f 'quotacheck.c' || echo './'`quotacheck.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v1.o `test -f 'quotacheck_v1.c' || echo './'`quotacheck_v1.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v2.o `test -f 'quotacheck_v2.c' || echo './'`quotacheck_v2.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotaops.o `test -f 'quotaops.c' || echo './'`quotaops.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaon.o quotaon.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaon_xfs.o quotaon_xfs.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o repquota.o repquota.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o warnquota.o warnquota.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotastats.o quotastats.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o xqmstats.o xqmstats.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o edquota.o edquota.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o setquota.o setquota.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o convertquota.o convertquota.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o rquota_server.o rquota_server.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o rquota_svc.o rquota_svc.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o svc_socket.o svc_socket.c
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/libnl3 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/
 work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quota_nld-quota_nld.o `test -f 'quota_nld.c' || echo './'`quota_nld.c
In file included from quota.h:4,
                 from quota_tree.h:5,
                 from quotaio_tree.c:19:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotaio_v1.c:16:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotaio_xfs.c:17:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotasys.h:13,
                 from quotaio_meta.c:17:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotaio_rpc.c:13:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaon.h:7,
                 from quotaon.c:17:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotasys.h:13,
                 from quotaio.c:24:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaon.h:7,
                 from quotaon_xfs.c:14:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotasys.h:13,
                 from quotasync.c:13:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio_v2.h:11,
                 from quotaio_v2.c:19:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotasys.h:13,
                 from repquota.c:24:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quota.c:28:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from convertquota.c:22:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotacheck_v2.c:19:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotaio_generic.c:18:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotasys.h:13,
                 from quotasys.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotastats.c:30:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotacheck_v1.c:16:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
quota.c: In function 'main':
quota.c:388:16: warning: implicit declaration of function 'reallocarray' [-Wimplicit-function-declaration]
  388 |      fsnames = reallocarray(fsnames, fscount, sizeof(char *));
      |                ^~~~~~~~~~~~
quota.c:388:14: warning: assignment to 'char **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  388 |      fsnames = reallocarray(fsnames, fscount, sizeof(char *));
      |              ^
In file included from quota.h:4,
                 from quotasys.h:13,
                 from rquota_svc.c:51:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotaops.h:4,
                 from edquota.c:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotasys.h:13,
                 from warnquota.c:48:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from rquota_client.c:44:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotaops.h:4,
                 from rquota_server.c:31:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotaops.h:4,
                 from quotaops.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from rquota_client.h:10,
                 from setquota.c:24:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotacheck.c:39:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
quotaops.c: In function 'getprivs':
quotaops.c:143:1: warning: label 'out_err' defined but not used [-Wunused-label]
  143 | out_err:
      | ^~~~~~~
In file included from quota.h:4,
                 from quotaio.h:15,
                 from quotaops.h:4,
                 from quotaops.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
quotaops.c: In function 'getprivs':
quotaops.c:143:1: warning: label 'out_err' defined but not used [-Wunused-label]
  143 | out_err:
      | ^~~~~~~
In file included from quota.h:4,
                 from quotasys.h:13,
                 from quota_nld.c:41:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
    1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
      |  ^~~~~~~
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o xqmstats xqmstats.o common.o pot.o  
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotastats quotastats.o common.o pot.o  
rm -f librpcclient.a
i686-poky-linux-musl-gcc-ar cru librpcclient.a librpcclient_a-rquota.o librpcclient_a-rquota_client.o librpcclient_a-rquota_clnt.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
i686-poky-linux-musl-gcc-ranlib librpcclient.a
rm -f libquota.a
i686-poky-linux-musl-gcc-ar cru libquota.a quotaio.o quotaio_v1.o quotaio_v2.o quotaio_tree.o quotaio_rpc.o quotaio_xfs.o quotaio_meta.o quotaio_generic.o bylabel.o common.o quotasys.o pot.o librpcclient.a
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
i686-poky-linux-musl-gcc-ranlib libquota.a
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.0
 6-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotacheck quotacheck-quotacheck.o quotacheck-quotacheck_v1.o quotacheck-quotacheck_v2.o quotacheck-quotaops.o libquota.a -lext2fs -lcom_err  librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotaon quotaon.o quotaon_xfs.o libquota.a  librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quota quota.o quotaops.o libquota.a  librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o repquota repquota.o libquota.a  librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotasync quotasync.o libquota.a  librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o edquota edquota.o quotaops.o libquota.a  librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o warnquota warnquota.o libquota.a   librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o setquota setquota.o quotaops.o libquota.a  librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o convertquota convertquota.o libquota.a  librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=
 /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o rpc.rquotad rquota_server.o rquota_svc.o svc_socket.o libquota.a  -lwrap librpcclient.a -ltirpc 
i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/libnl3 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu
 x-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quota_nld quota_nld-quota_nld.o libquota.a  librpcclient.a -ltirpc -ldbus-1 -lnl-genl-3 -lnl-3 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ld: quota.o: in function `main':
/usr/src/debug/quota/4.06-r0/quota-4.06/quota.c:388: undefined reference to `reallocarray'
collect2: error: ld returned 1 exit status
make[2]: *** [Makefile:923: quota] Error 1
make[2]: *** Waiting for unfinished jobs....
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
make[1]: *** [Makefile:1381: all-recursive] Error 1
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
make: *** [Makefile:763: all] Error 2
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/temp/log.do_compile.6501
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-musl', 'i686-linux-musl', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
| Making all in po
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06/po'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06/po'
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quota.o quota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaops.o quotaops.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio.o quotaio.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_v1.o quotaio_v1.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_v2.o quotaio_v2.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_tree.o quotaio_tree.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_rpc.o quotaio_rpc.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_xfs.o quotaio_xfs.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_meta.o quotaio_meta.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_generic.o quotaio_generic.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o bylabel.o bylabel.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o common.o common.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotasys.o quotasys.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o pot.o pot.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=    
                   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota.o `test -f 'rquota.c' || echo './'`rquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=    
                   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_client.o `test -f 'rquota_client.c' || echo './'`rquota_client.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=    
                   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_clnt.o `test -f 'rquota_clnt.c' || echo './'`rquota_clnt.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotasync.o quotasync.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck.o `test -f 'quotacheck.c' || echo './'`quotacheck.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v1.o `test -f 'quotacheck_v1.c' || echo './'`quotacheck_v1.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v2.o `test -f 'quotacheck_v2.c' || echo './'`quotacheck_v2.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotaops.o `test -f 'quotaops.c' || echo './'`quotaops.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaon.o quotaon.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaon_xfs.o quotaon_xfs.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o repquota.o repquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o warnquota.o warnquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotastats.o quotastats.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o xqmstats.o xqmstats.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o edquota.o edquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o setquota.o setquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o convertquota.o convertquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o rquota_server.o rquota_server.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o rquota_svc.o rquota_svc.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o svc_socket.o svc_socket.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/libnl3 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quota_nld-quota_nld.o `test -f 'quota_nld.c' || echo './'`quota_nld.c
| In file included from quota.h:4,
|                  from quota_tree.h:5,
|                  from quotaio_tree.c:19:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaio_v1.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaio_xfs.c:17:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quotaio_meta.c:17:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaio_rpc.c:13:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaon.h:7,
|                  from quotaon.c:17:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quotaio.c:24:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaon.h:7,
|                  from quotaon_xfs.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quotasync.c:13:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio_v2.h:11,
|                  from quotaio_v2.c:19:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from repquota.c:24:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quota.c:28:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from convertquota.c:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotacheck_v2.c:19:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaio_generic.c:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quotasys.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotastats.c:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotacheck_v1.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| quota.c: In function 'main':
| quota.c:388:16: warning: implicit declaration of function 'reallocarray' [-Wimplicit-function-declaration]
|   388 |      fsnames = reallocarray(fsnames, fscount, sizeof(char *));
|       |                ^~~~~~~~~~~~
| quota.c:388:14: warning: assignment to 'char **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
|   388 |      fsnames = reallocarray(fsnames, fscount, sizeof(char *));
|       |              ^
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from rquota_svc.c:51:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaops.h:4,
|                  from edquota.c:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from warnquota.c:48:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from rquota_client.c:44:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaops.h:4,
|                  from rquota_server.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaops.h:4,
|                  from quotaops.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from rquota_client.h:10,
|                  from setquota.c:24:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotacheck.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| quotaops.c: In function 'getprivs':
| quotaops.c:143:1: warning: label 'out_err' defined but not used [-Wunused-label]
|   143 | out_err:
|       | ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaops.h:4,
|                  from quotaops.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| quotaops.c: In function 'getprivs':
| quotaops.c:143:1: warning: label 'out_err' defined but not used [-Wunused-label]
|   143 | out_err:
|       | ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quota_nld.c:41:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o xqmstats xqmstats.o common.o pot.o
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotastats quotastats.o common.o pot.o
| rm -f librpcclient.a
| i686-poky-linux-musl-gcc-ar cru librpcclient.a librpcclient_a-rquota.o librpcclient_a-rquota_client.o librpcclient_a-rquota_clnt.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
| i686-poky-linux-musl-gcc-ranlib librpcclient.a
| rm -f libquota.a
| i686-poky-linux-musl-gcc-ar cru libquota.a quotaio.o quotaio_v1.o quotaio_v2.o quotaio_tree.o quotaio_rpc.o quotaio_xfs.o quotaio_meta.o quotaio_generic.o bylabel.o common.o quotasys.o pot.o librpcclient.a
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
| i686-poky-linux-musl-gcc-ranlib libquota.a
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4
 .06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotacheck quotacheck-quotacheck.o quotacheck-quotacheck_v1.o quotacheck-quotacheck_v2.o quotacheck-quotaops.o libquota.a -lext2fs -lcom_err  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotaon quotaon.o quotaon_xfs.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quota quota.o quotaops.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o repquota repquota.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotasync quotasync.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o edquota edquota.o quotaops.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o warnquota warnquota.o libquota.a   librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o setquota setquota.o quotaops.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o convertquota convertquota.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o rpc.rquotad rquota_server.o rquota_svc.o svc_socket.o libquota.a  -lwrap librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/libnl3 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quota_nld quota_nld-quota_nld.o libquota.a  librpcclient.a -ltirpc -ldbus-1 -lnl-genl-3 -lnl-3
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ld: quota.o: in function `main':
| /usr/src/debug/quota/4.06-r0/quota-4.06/quota.c:388: undefined reference to `reallocarray'
| collect2: error: ld returned 1 exit status
| make[2]: *** [Makefile:923: quota] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
| make[1]: *** [Makefile:1381: all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
| make: *** [Makefile:763: all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/temp/run.do_compile.6501' failed with exit code 1:
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
| Making all in po
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06/po'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06/po'
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quota.o quota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaops.o quotaops.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio.o quotaio.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_v1.o quotaio_v1.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_v2.o quotaio_v2.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_tree.o quotaio_tree.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_rpc.o quotaio_rpc.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_xfs.o quotaio_xfs.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_meta.o quotaio_meta.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaio_generic.o quotaio_generic.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o bylabel.o bylabel.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o common.o common.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotasys.o quotasys.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o pot.o pot.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=    
                   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota.o `test -f 'rquota.c' || echo './'`rquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=    
                   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_client.o `test -f 'rquota_client.c' || echo './'`rquota_client.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -Wno-unused -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=    
                   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o librpcclient_a-rquota_clnt.o `test -f 'rquota_clnt.c' || echo './'`rquota_clnt.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotasync.o quotasync.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck.o `test -f 'quotacheck.c' || echo './'`quotacheck.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v1.o `test -f 'quotacheck_v1.c' || echo './'`quotacheck_v1.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotacheck_v2.o `test -f 'quotacheck_v2.c' || echo './'`quotacheck_v2.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotacheck-quotaops.o `test -f 'quotaops.c' || echo './'`quotaops.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaon.o quotaon.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotaon_xfs.o quotaon_xfs.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o repquota.o repquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o warnquota.o warnquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quotastats.o quotastats.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o xqmstats.o xqmstats.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o edquota.o edquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o setquota.o setquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o convertquota.o convertquota.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o rquota_server.o rquota_server.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o rquota_svc.o rquota_svc.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                
       -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o svc_socket.o svc_socket.c
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -DHAVE_CONFIG_H -I.    -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/libnl3 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -c -o quota_nld-quota_nld.o `test -f 'quota_nld.c' || echo './'`quota_nld.c
| In file included from quota.h:4,
|                  from quota_tree.h:5,
|                  from quotaio_tree.c:19:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaio_v1.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaio_xfs.c:17:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quotaio_meta.c:17:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaio_rpc.c:13:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaon.h:7,
|                  from quotaon.c:17:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quotaio.c:24:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaon.h:7,
|                  from quotaon_xfs.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quotasync.c:13:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio_v2.h:11,
|                  from quotaio_v2.c:19:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from repquota.c:24:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quota.c:28:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from convertquota.c:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotacheck_v2.c:19:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaio_generic.c:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quotasys.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotastats.c:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotacheck_v1.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| quota.c: In function 'main':
| quota.c:388:16: warning: implicit declaration of function 'reallocarray' [-Wimplicit-function-declaration]
|   388 |      fsnames = reallocarray(fsnames, fscount, sizeof(char *));
|       |                ^~~~~~~~~~~~
| quota.c:388:14: warning: assignment to 'char **' from 'int' makes pointer from integer without a cast [-Wint-conversion]
|   388 |      fsnames = reallocarray(fsnames, fscount, sizeof(char *));
|       |              ^
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from rquota_svc.c:51:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaops.h:4,
|                  from edquota.c:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from warnquota.c:48:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from rquota_client.c:44:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaops.h:4,
|                  from rquota_server.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaops.h:4,
|                  from quotaops.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from rquota_client.h:10,
|                  from setquota.c:24:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotacheck.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| quotaops.c: In function 'getprivs':
| quotaops.c:143:1: warning: label 'out_err' defined but not used [-Wunused-label]
|   143 | out_err:
|       | ^~~~~~~
| In file included from quota.h:4,
|                  from quotaio.h:15,
|                  from quotaops.h:4,
|                  from quotaops.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| quotaops.c: In function 'getprivs':
| quotaops.c:143:1: warning: label 'out_err' defined but not used [-Wunused-label]
|   143 | out_err:
|       | ^~~~~~~
| In file included from quota.h:4,
|                  from quotasys.h:13,
|                  from quota_nld.c:41:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/sys/cdefs.h:1:2: warning: #warning usage of non-standard #include <sys/cdefs.h> is deprecated [-Wcpp]
|     1 | #warning usage of non-standard #include <sys/cdefs.h> is deprecated
|       |  ^~~~~~~
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o xqmstats xqmstats.o common.o pot.o
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotastats quotastats.o common.o pot.o
| rm -f librpcclient.a
| i686-poky-linux-musl-gcc-ar cru librpcclient.a librpcclient_a-rquota.o librpcclient_a-rquota_client.o librpcclient_a-rquota_clnt.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
| i686-poky-linux-musl-gcc-ranlib librpcclient.a
| rm -f libquota.a
| i686-poky-linux-musl-gcc-ar cru libquota.a quotaio.o quotaio_v1.o quotaio_v2.o quotaio_tree.o quotaio_rpc.o quotaio_xfs.o quotaio_meta.o quotaio_generic.o bylabel.o common.o quotasys.o pot.o librpcclient.a
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
| i686-poky-linux-musl-gcc-ranlib libquota.a
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/ext2fs -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/et -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4
 .06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotacheck quotacheck-quotacheck.o quotacheck-quotacheck_v1.o quotacheck-quotacheck_v2.o quotacheck-quotaops.o libquota.a -lext2fs -lcom_err  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotaon quotaon.o quotaon_xfs.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quota quota.o quotaops.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o repquota repquota.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quotasync quotasync.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o edquota edquota.o quotaops.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o warnquota warnquota.o libquota.a   librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o setquota setquota.o quotaops.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o convertquota convertquota.o libquota.a  librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-ma
 p=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o rpc.rquotad rquota_server.o rquota_svc.o svc_socket.o libquota.a  -lwrap librpcclient.a -ltirpc
| i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot -fPIC -Wall -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/dbus-1.0 -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/lib/dbus-1.0/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/libnl3 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0=/usr/src/debug/quota/4.06-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native=  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot/usr/include/tirpc -pie -Wl,-O1 -Wl,--hash-style=gnu  -Wl,-z,relro,-z,now -ltirpc -o quota_nld quota_nld-quota_nld.o libquota.a  librpcclient.a -ltirpc -ldbus-1 -lnl-genl-3 -lnl-3
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/10.2.0/ld: quota.o: in function `main':
| /usr/src/debug/quota/4.06-r0/quota-4.06/quota.c:388: undefined reference to `reallocarray'
| collect2: error: ld returned 1 exit status
| make[2]: *** [Makefile:923: quota] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
| make[1]: *** [Makefile:1381: all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/quota/4.06-r0/quota-4.06'
| make: *** [Makefile:763: all] Error 2
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe quota-4.06-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2300 tasks of which 2280 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.06.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============4776215770227270418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/quota: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota: SRC_URI changed from "https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.05/quota-4.05.tar.gz file://fcntl.patch" to "https://downloads.sourceforge.net/project/linuxquota/quota-tools/4.06/quota-4.06.tar.gz file://fcntl.patch"
packages/core2-32-poky-linux/quota: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-dbg: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-dbg: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-dbg: PKGSIZE changed from 2772248 to 2792752 (+1%)
packages/core2-32-poky-linux/quota/quota-dev: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-dev: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-doc: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-doc: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-doc: PKGSIZE changed from 275080 to 64291 (-77%)
packages/core2-32-poky-linux/quota/quota-locale-cs: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-locale-cs: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-locale-cs: PKGSIZE changed from 62681 to 61583 (-2%)
packages/core2-32-poky-linux/quota/quota-locale-de: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-locale-de: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-locale-de: PKGSIZE changed from 58040 to 56960 (-2%)
packages/core2-32-poky-linux/quota/quota-locale-fr: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-locale-fr: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-locale-fr: PKGSIZE changed from 27675 to 26822 (-3%)
packages/core2-32-poky-linux/quota/quota-locale-pl: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-locale-pl: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-locale-pl: PKGSIZE changed from 63412 to 62344 (-2%)
packages/core2-32-poky-linux/quota/quota-src: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-src: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota-src: PKGSIZE changed from 417097 to 421216 (+1%)
packages/core2-32-poky-linux/quota/quota-staticdev: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota-staticdev: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota: PKGV changed from 4.05 [default] to 4.06 [default]
packages/core2-32-poky-linux/quota/quota: PV changed from "4.05" to "4.06"
packages/core2-32-poky-linux/quota/quota: PKGSIZE changed from 1135524 to 1136130 (+0%)

--===============4776215770227270418==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-quota-upgrade-4.05-4.06.patch"

From b49f7f7a85a475fe54d47619399693d03eae901e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 15:02:54 +0000
Subject: [PATCH] quota: upgrade 4.05 -> 4.06

---
 meta/recipes-extended/quota/{quota_4.05.bb => quota_4.06.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/quota/{quota_4.05.bb => quota_4.06.bb} (91%)

diff --git a/meta/recipes-extended/quota/quota_4.05.bb b/meta/recipes-extended/quota/quota_4.06.bb
similarity index 91%
rename from meta/recipes-extended/quota/quota_4.05.bb
rename to meta/recipes-extended/quota/quota_4.06.bb
index c5da1e71ed..73fbaed123 100644
--- a/meta/recipes-extended/quota/quota_4.05.bb
+++ b/meta/recipes-extended/quota/quota_4.06.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
            file://fcntl.patch \
           "
-SRC_URI[md5sum] = "1c1dbd2cd3d680ccac661239b067e147"
-SRC_URI[sha256sum] = "ef3b5b5d1014ed1344b46c1826145e20cbef8db967b522403c9a060761cf7ab9"
+SRC_URI[sha256sum] = "2f3e03039f378d4f0d97acdb49daf581dcaad64d2e1ddf129495fd579fbd268d"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.20.1


--===============4776215770227270418==--
