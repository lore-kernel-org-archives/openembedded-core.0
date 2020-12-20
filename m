Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.24453.1608473714068775212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0344438C1364
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 5.0.1 SUCCEEDED
Message-ID: <MADEUP.165272526034C605.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145961
Content-Type: multipart/mixed; boundary="===============6231654972463815867=="

--===============6231654972463815867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-scm* to *5.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-4.1.2-5.0.1.patch
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

--===============6231654972463815867==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-4.1.2-5.0.1.patch"

From cf2eb30be71a1903a4bdf2934d5bb8fad78fd00b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 00:38:21 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 4.1.2 -> 5.0.1

---
 ...setuptools-scm_4.1.2.bb => python3-setuptools-scm_5.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_4.1.2.bb => python3-setuptools-scm_5.0.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
index 5b83b55385..406404ec69 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb
@@ -2,8 +2,7 @@ SUMMARY = "the blessed package to manage your versions by scm tags"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "e6c9fad17c90516d640868eb833d5150"
-SRC_URI[sha256sum] = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090a7faa8"
+SRC_URI[sha256sum] = "c85b6b46d0edd40d2301038cdea96bb6adc14d62ef943e75afb08b3e7bcf142a"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
-- 
2.20.1


--===============6231654972463815867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 41 skipped, 0 masked, 0 errors.
Removing 106 recipes from the core2-32 sysroot...done.
Removing 111 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-acb488d2a649d5d256740cf4108c0b808301a37d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb488d2a649d5d256740cf4108c0b808301a37d"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 487 Found 463 Missed 24 Current 199 (95% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 686 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 207 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 268 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 269 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 281 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 290 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 292 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 293 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 297 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 306 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 310 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_246.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 318 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 325 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 326 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 327 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 328 of 686 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: Running setscene task 329 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 337 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 340 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 358 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-246.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 380 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 382 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 699 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_fetch)
NOTE: Running task 714 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_fetch)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 715 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 716 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_fetch)
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running setscene task 419 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 955 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_unpack)
NOTE: Running task 957 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_unpack)
NOTE: Running setscene task 423 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 425 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 965 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_unpack)
NOTE: Running task 966 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Started
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 979 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 981 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_patch)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 994 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 999 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1025 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1026 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic)
NOTE: Running task 1027 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1028 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic unihash changed to f2813a5784e1566ba242f4b5998a59e7dcfc8d0c40b1ddb1b055a5a52bb723f8
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 486 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1075 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 505 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1099 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1100 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1117 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 531 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1138 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1152 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1173 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.8.18+gitAUTOINC+7883b60d32_3c5d210805-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1200 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 615 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 617 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 621 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 622 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 624 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 635 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 636 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 637 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 639 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1269 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ac9535620c869a5ab0014bf3b6f9b8138e6f7b60a06f668c27308a6b7faf6f5c
NOTE: Running task 1282 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 686 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1922 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1934 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1935 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1936 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2154 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2155 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: Running task 2156 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_configure)
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2157 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2158 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_compile)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 2159 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_compile)
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2160 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 2161 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_compile)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2162 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2163 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2164 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_install)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 2165 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_install)
NOTE: recipe python3-py-1.9.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2166 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Succeeded
NOTE: Running task 2167 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package)
NOTE: Running task 2168 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2169 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package)
NOTE: recipe python3-py-1.9.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Succeeded
NOTE: Running task 2171 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Succeeded
NOTE: Running task 2172 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2173 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2174 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Started
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2175 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2177 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package_write_rpm)
NOTE: Running task 2178 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_write_rpm)
NOTE: Running task 2179 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_qa)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2180 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2180 tasks of which 2122 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6231654972463815867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 48 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-acb488d2a649d5d256740cf4108c0b808301a37d"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb488d2a649d5d256740cf4108c0b808301a37d"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 26 Missed 24 Current 625 (52% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1087 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1501 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_fetch)
NOTE: Running task 1553 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1554 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_fetch)
NOTE: Running task 1555 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Started
NOTE: Running task 1912 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_unpack)
NOTE: Running task 1913 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1914 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_unpack)
NOTE: Running task 1915 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1916 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1917 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_unpack)
NOTE: Running task 1918 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1919 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2051 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_patch)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2052 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 2053 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2055 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2056 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2057 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2058 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 2059 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2061 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4afa4bf6d6af0f9b0ec6cc54ada6a7b4e7df888546efb580903da42cd99138dd
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic unihash changed to f2813a5784e1566ba242f4b5998a59e7dcfc8d0c40b1ddb1b055a5a52bb723f8
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2103 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2104 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_configure)
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2105 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_configure)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2106 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Started
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2107 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 2108 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Started
NOTE: Running task 2109 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_compile)
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2111 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Started
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2112 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1e18228b8ee309f68af63c67d03f1749bb3f69fe65279cea47e056c09bcfd14e
NOTE: Setscene tasks completed
NOTE: Running task 2119 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_install)
NOTE: Running task 2140 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2143 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2144 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_install)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2145 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Succeeded
NOTE: Running task 2146 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package)
NOTE: Running task 2147 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2148 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package)
NOTE: recipe python3-py-1.9.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Succeeded
NOTE: Running task 2149 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2150 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Succeeded
NOTE: Running task 2151 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2153 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2154 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Succeeded
NOTE: Running task 2155 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_packagedata)
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2156 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package_write_rpm)
NOTE: Running task 2157 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_write_rpm)
NOTE: Running task 2158 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_qa)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2159 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2159 tasks of which 2106 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6231654972463815867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-acb488d2a649d5d256740cf4108c0b808301a37d"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb488d2a649d5d256740cf4108c0b808301a37d"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 26 Missed 24 Current 625 (52% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1087 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1501 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_fetch)
NOTE: Running task 1553 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_fetch)
NOTE: Running task 1554 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1555 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Started
NOTE: Running task 1844 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_unpack)
NOTE: Running task 1845 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1865 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_unpack)
NOTE: Running task 1866 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1867 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_unpack)
NOTE: Running task 1868 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1869 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1870 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2051 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_patch)
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2052 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 2053 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2055 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2056 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2057 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2058 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 2059 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2061 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 66ffbf0739ea4a70f7fc262363902d5eed0c8052d475b1a42659dcacb986d5de
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic unihash changed to f2813a5784e1566ba242f4b5998a59e7dcfc8d0c40b1ddb1b055a5a52bb723f8
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2103 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_configure)
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2104 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_configure)
NOTE: Running task 2105 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Started
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2106 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2107 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2108 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2109 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_compile)
NOTE: Running task 2110 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2111 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_compile)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2112 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c23f7cf00e40a11df88ab6ad9600ca1a11c71db53b6ce62b3aebf6c2f935e59e
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2119 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2132 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_install)
NOTE: Running task 2141 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2144 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_install)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2145 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Succeeded
NOTE: Running task 2146 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package)
NOTE: Running task 2147 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2148 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package)
NOTE: recipe python3-py-1.9.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2149 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Succeeded
NOTE: Running task 2150 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Succeeded
NOTE: Running task 2151 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_packagedata)
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2153 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Succeeded
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2154 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Succeeded
NOTE: Running task 2155 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2156 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package_write_rpm)
NOTE: Running task 2157 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_write_rpm)
NOTE: Running task 2158 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_qa)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2159 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2159 tasks of which 2106 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6231654972463815867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-py/python3-py: PKGSIZE changed from 552353 to 552417 (+0%)
packages/core2-32-poky-linux/python3-setuptools-scm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-4.1.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools_scm/setuptools_scm-5.0.1.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-scm: PV changed from "4.1.2" to "5.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm: PKGV changed from 4.1.2 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PV changed from "4.1.2" to "5.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dbg: PKGV changed from 4.1.2 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PV changed from "4.1.2" to "5.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-dev: PKGV changed from 4.1.2 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PV changed from "4.1.2" to "5.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-doc: PKGV changed from 4.1.2 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PV changed from "4.1.2" to "5.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-locale: PKGV changed from 4.1.2 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PV changed from "4.1.2" to "5.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-src: PKGV changed from 4.1.2 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PV changed from "4.1.2" to "5.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm-staticdev: PKGV changed from 4.1.2 [default] to 5.0.1 [default]
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PV changed from "4.1.2" to "5.0.1"
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGSIZE changed from 115355 to 121854 (+6%)
packages/core2-32-poky-linux/python3-setuptools-scm/python3-setuptools-scm: PKGV changed from 4.1.2 [default] to 5.0.1 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-4.1.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-4.1.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info

--===============6231654972463815867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-scm (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-4.1.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.9/site-packages/setuptools_scm-4.1.2-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/setuptools_scm-5.0.1-py3.9.egg-info

--===============6231654972463815867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (0 cached, 807 parsed). 1416 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-acb488d2a649d5d256740cf4108c0b808301a37d"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb488d2a649d5d256740cf4108c0b808301a37d"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 26 Missed 24 Current 625 (52% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1087 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1501 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_fetch)
NOTE: Running task 1553 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_fetch)
NOTE: Running task 1554 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1555 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running task 1890 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_unpack)
NOTE: Running task 1891 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1905 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_unpack)
NOTE: Running task 1906 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1907 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_unpack)
NOTE: Running task 1908 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1909 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1988 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_patch)
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2052 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 2053 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2055 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2056 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2057 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2058 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2059 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bafeab211f96dcc2837ea65d9a9c6a333eccd590b0b8e09cccb3f79a13753554
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2086 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2103 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic unihash changed to f2813a5784e1566ba242f4b5998a59e7dcfc8d0c40b1ddb1b055a5a52bb723f8
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2104 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2105 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2106 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2107 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_configure)
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2108 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_compile)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2111 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_compile)
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3ebd7986c834cbc527b39a873a77f5cc1ffb99642290f5adb5f91062e33f1954
NOTE: Setscene tasks completed
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2138 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: Running task 2139 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_install)
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2142 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2143 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2144 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_install)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Succeeded
NOTE: Running task 2145 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package)
NOTE: Running task 2146 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2147 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2148 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Succeeded
NOTE: Running task 2149 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2150 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Succeeded
NOTE: Running task 2151 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2153 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2154 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Succeeded
NOTE: Running task 2155 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2156 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package_write_rpm)
NOTE: Running task 2157 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_write_rpm)
NOTE: Running task 2158 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_qa)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2159 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2159 tasks of which 2106 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6231654972463815867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1418 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1416 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-acb488d2a649d5d256740cf4108c0b808301a37d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:acb488d2a649d5d256740cf4108c0b808301a37d"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 26 Missed 24 Current 625 (52% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1087 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1501 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_fetch)
NOTE: Running task 1553 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_fetch)
NOTE: Running task 1554 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1555 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Started
NOTE: Running task 1846 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_unpack)
NOTE: Running task 1847 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1848 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_unpack)
NOTE: Running task 1849 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1850 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_unpack)
NOTE: Running task 1851 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1852 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1853 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1934 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_patch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Started
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2052 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 2053 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2055 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2056 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 2057 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2058 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2059 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2060 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2061 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a0fc48f856059ca7065fbf60cb17fa4a7fe9d06056f047e8ab270a0d74051002
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2103 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_lic unihash changed to f2813a5784e1566ba242f4b5998a59e7dcfc8d0c40b1ddb1b055a5a52bb723f8
NOTE: Running task 2104 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_configure)
NOTE: recipe python3-py-1.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2105 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_configure)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2106 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2107 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 2108 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2109 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_compile)
NOTE: recipe python3-py-1.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2111 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Started
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 11a36dd3e6523ca99b8465d468c380af9aea480f36275496f5948f18128795a3
NOTE: Setscene tasks completed
NOTE: Running task 2138 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2142 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_install)
NOTE: recipe python3-py-1.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2143 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2144 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_install)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2145 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_install: Succeeded
NOTE: Running task 2146 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package)
NOTE: Running task 2147 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-py-1.9.0-r0: task do_install: Succeeded
NOTE: Running task 2148 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package)
NOTE: recipe python3-py-1.9.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-51.0.0-r0: task do_install: Succeeded
NOTE: Running task 2149 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2150 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package: Succeeded
NOTE: Running task 2151 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.9.0-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_packagedata)
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2153 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_packagedata: Succeeded
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-src went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dbg went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-staticdev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-dev went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-doc went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py-locale went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
ERROR: python3-py-1.9.0-r0 do_packagedata: QA Issue: Package version for package python3-py went backwards which would break package feeds (from 0:1.10.0-r0 to 0:1.9.0-r0) [version-going-backwards]
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2154 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.9.0.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package: Succeeded
NOTE: Running task 2155 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2156 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb:do_package_write_rpm)
NOTE: Running task 2157 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_write_rpm)
NOTE: Running task 2158 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_package_qa)
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-scm-5.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-51.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2159 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_5.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2159 tasks of which 2106 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6231654972463815867==--
