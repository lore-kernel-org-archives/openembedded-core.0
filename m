Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.6913.1622200976294890327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5B56138C1370
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jinja2: upgrading to 3.0.1 SUCCEEDED
Message-ID: <MADEUP.168337317EA21E27.3006@lists.openembedded.org>
X-Groupsio-MsgNum: 152350
Content-Type: multipart/mixed; boundary="===============4656165279637899661=="

--===============4656165279637899661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jinja2* to *3.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jinja2-upgrade-3.0.0-3.0.1.patch
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

--===============4656165279637899661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 41 skipped, 0 masked, 0 errors.
Removing 123 recipes from the core2-32 sysroot...done.
Removing 128 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 626 Local 604 Network 0 Missed 22 Current 199 (96% match, 97% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 274 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-21.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-56.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 291 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-zipp-3.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-21.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-56.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 323 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 326 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-21.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-56.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 328 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 329 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 330 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 332 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.4.1.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 335 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 336 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 354 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 355 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 357 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 358 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 359 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-21.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-56.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 398 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 407 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 416 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 418 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 419 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 420 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 421 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 422 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 423 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 424 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 425 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 426 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 427 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 428 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 429 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 430 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 432 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 433 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 434 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 435 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 436 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 437 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 438 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-zipp-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 446 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 450 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 451 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 456 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 462 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 467 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 470 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 655 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_fetch)
NOTE: Running task 662 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_fetch)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 770 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 501 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 512 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 920 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_unpack)
NOTE: Running task 921 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_unpack)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1025 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_unpack)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1041 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_patch)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 516 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1051 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1077 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1078 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1079 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1080 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic unihash changed to 9e8850b0199d12ffc128bc5d937bd44c85d2b86d2a03bfbbc7cc4f66e4bb99e5
NOTE: Running setscene task 563 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 636 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1176 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running task 1185 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: Running task 1195 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1236 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1260 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1269 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1324 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1334 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 716 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 734 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 737 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 748 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 749 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 751 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 752 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 761 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1375 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 775 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 003c92f014369e85d1ad14dc5d1d0ac751b330863894e4dc43b3bd2a493a89ed
NOTE: Running task 1392 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 796 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 801 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 820 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 823 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 825 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2026 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2060 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2242 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2545 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2546 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2547 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Started
NOTE: Running task 2548 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2549 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2550 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2551 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2552 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2553 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_install)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2554 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2555 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2556 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2557 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 2558 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Succeeded
NOTE: Running task 2559 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 2560 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2561 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package)
NOTE: Running task 2562 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2563 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 2564 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Started
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2565 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2566 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package_write_rpm)
NOTE: Running task 2567 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Succeeded
NOTE: Running task 2568 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 2569 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2570 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 2571 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_write_rpm)
NOTE: Running task 2572 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to 097140bec16ec200febe02fcbc69cfcbb7a0ec8ceb0725356d56650c14f7f845
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm unihash changed to c99d8406ef6bb76b4fe96b105180d548ef7f980b575ab291efb870f5af48d6f4
NOTE: Running noexec task 2573 of 2573 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2573 tasks of which 2518 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4656165279637899661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jinja2: SRC_URI changed from "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-3.0.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-3.0.1.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-jinja2: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2: PV changed from "3.0.0" to "3.0.1"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dbg: PV changed from "3.0.0" to "3.0.1"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-dev: PV changed from "3.0.0" to "3.0.1"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-doc: PV changed from "3.0.0" to "3.0.1"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-locale: PV changed from "3.0.0" to "3.0.1"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: PKGSIZE changed from 258202 to 257993 (-0%)
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-ptest: PV changed from "3.0.0" to "3.0.1"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-src: PV changed from "3.0.0" to "3.0.1"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2-staticdev: PV changed from "3.0.0" to "3.0.1"
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGV changed from 3.0.0 [default] to 3.0.1 [default]
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PKGSIZE changed from 921143 to 923244 (+0%)
packages/core2-32-poky-linux/python3-jinja2/python3-jinja2: PV changed from "3.0.0" to "3.0.1"
Changes to packages/core2-32-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Jinja2-3.0.1-py3.9.egg-info

--===============4656165279637899661==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jinja2-upgrade-3.0.0-3.0.1.patch"

From c344cf6f9d6cc003f8d645cd7afcf511752262ba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 08:28:15 +0000
Subject: [PATCH] python3-jinja2: upgrade 3.0.0 -> 3.0.1

---
 .../python/{python3-jinja2_3.0.0.bb => python3-jinja2_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.0.0.bb => python3-jinja2_3.0.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb b/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.0.1.bb
index 5ae8d49b53..b37a043ccb 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "ea8d7dd814ce9df6de6a761ec7f1cac98afe305b8cdc4aaae4e114b8d8ce24c5"
+SRC_URI[sha256sum] = "703f484b47a6af502e743c9122595cc812b0271f661722403114f71a79d0f5a4"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.27.0


--===============4656165279637899661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 7 Network 0 Missed 21 Current 786 (25% match, 97% complete)
Removing 2 stale sstate objects for arch armv7vet2hf-neon...done.
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1495 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_fetch)
NOTE: Running task 1522 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_fetch)
NOTE: Running task 1779 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1934 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_unpack)
NOTE: Running task 1935 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1936 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_unpack)
NOTE: Running task 1937 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2074 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_unpack)
NOTE: Running task 2075 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_patch)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2301 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2412 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2413 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2414 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2415 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2416 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2417 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic unihash changed to 9e8850b0199d12ffc128bc5d937bd44c85d2b86d2a03bfbbc7cc4f66e4bb99e5
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2418 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure)
NOTE: Running task 2419 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2420 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c595f0a663b4b4145931aa921820e54ee4039dbe83b5859baf3e073783af767b
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2485 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2486 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2487 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2488 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2489 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 12d7a2ece7d5b4db4b0aab64a6f7075029a42a683d2a71033b32fe1f0196787b
NOTE: Setscene tasks completed
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2528 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: Running task 2529 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2534 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2535 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2536 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 2537 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Succeeded
NOTE: Running task 2538 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 2539 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2540 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package)
NOTE: Running task 2541 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2542 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 2543 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Started
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2544 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package_write_rpm)
NOTE: Running task 2545 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2546 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Succeeded
NOTE: Running task 2547 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 2548 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to 377fa46feef182374b58fe4f1702c741d9c78138c5356fce20f4fdb10e0b0590
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2549 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 2550 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_write_rpm)
NOTE: Running task 2551 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm unihash changed to 4499244a603a012a352fa1bc725054184b91bee426706ceae223111dcb0c1fdb
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2552 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2552 tasks of which 2502 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4656165279637899661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-jinja2 (sysroot):
  /usr/lib/python3.9/site-packages/Jinja2-3.0.0-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Jinja2-3.0.1-py3.9.egg-info

--===============4656165279637899661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 58 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 7 Network 0 Missed 21 Current 786 (25% match, 97% complete)
Removing 4 stale sstate objects for arch qemumips...done.
Removing 2 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1495 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_fetch)
NOTE: Running task 1522 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_fetch)
NOTE: Running task 1779 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_unpack)
NOTE: Running task 1886 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1900 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_unpack)
NOTE: Running task 1901 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2058 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_unpack)
NOTE: Running task 2059 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2221 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_patch)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2251 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2412 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2413 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2414 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2415 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2416 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2417 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic unihash changed to 9e8850b0199d12ffc128bc5d937bd44c85d2b86d2a03bfbbc7cc4f66e4bb99e5
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2418 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure)
NOTE: Running task 2419 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2420 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f20e56863f279864f793c196186fd913736ed0b7b4957799428efc8fc1d21d8d
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2485 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2487 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2488 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2489 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2490 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 68fb4675c705c63d14a6e5ec82c070bcf09e2a0e26b586284168e481d961f3dc
NOTE: Setscene tasks completed
NOTE: Running task 2529 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2534 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2535 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2536 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 2537 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Succeeded
NOTE: Running task 2538 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 2539 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2540 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package)
NOTE: Running task 2541 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2542 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 2543 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Succeeded
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2544 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package_write_rpm)
NOTE: Running task 2545 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2546 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Succeeded
NOTE: Running task 2547 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 2548 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to f11a08e3cb285a71a7b9d0b8c5f7e0b0e6d65d7a096c6067ef7e8dd7877ed844
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2549 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 2550 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_write_rpm)
NOTE: Running task 2551 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm unihash changed to 1020aaf3c66f9d2cc82e57c0496eb86b84a8a0e078dbcd397026a928e4113c09
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2552 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2552 tasks of which 2502 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4656165279637899661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 66 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 7 Network 0 Missed 21 Current 786 (25% match, 97% complete)
Removing 2 stale sstate objects for arch ppc7400...done.
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1495 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_fetch)
NOTE: Running task 1522 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_fetch)
NOTE: Running task 1779 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1838 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_unpack)
NOTE: Running task 1839 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1840 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_unpack)
NOTE: Running task 1841 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2004 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_unpack)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Started
NOTE: Running task 2049 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2102 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_patch)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2128 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2297 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2412 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2413 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2414 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2415 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2416 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2417 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic unihash changed to 9e8850b0199d12ffc128bc5d937bd44c85d2b86d2a03bfbbc7cc4f66e4bb99e5
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2418 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2419 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2420 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_configure)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b80ca9cb6f12efc434285e0cbdc29240bcddec8e6bb23ad97d256c99ba75ad9c
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2485 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2486 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_compile)
NOTE: Running task 2487 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2488 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile)
NOTE: Running task 2489 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5886c3877a166989898858b3c759cb4f873c991d347b81a7653b3acf48423ffc
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2502 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_install)
NOTE: Running task 2529 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2534 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2535 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2536 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 2537 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Succeeded
NOTE: Running task 2538 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 2539 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2540 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package)
NOTE: Running task 2541 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Started
NOTE: Running task 2542 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 2543 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Started
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2544 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2545 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package_write_rpm)
NOTE: Running task 2546 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Succeeded
NOTE: Running task 2547 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 2548 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to e4488a5ce214d5c29acac0234a10bc0ddfcf4aaecc37ef598ba6fb850ea6dfbe
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2549 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 2550 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_write_rpm)
NOTE: Running task 2551 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm unihash changed to 69f16042bd3078d159b92d9d7cac9bf0c31a4dcf2f1b46bc8578de73ef3bc9d4
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2552 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2552 tasks of which 2502 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4656165279637899661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1458 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (821 cached, 1 parsed). 1456 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3d3dfd2880ec0c73c0f5c0a2a29649d00d888554"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 7 Network 0 Missed 21 Current 786 (25% match, 97% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1495 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_fetch)
NOTE: Running task 1522 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_fetch)
NOTE: Running task 1780 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1858 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_unpack)
NOTE: Running task 1859 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1860 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_unpack)
NOTE: Running task 1861 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2014 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_unpack)
NOTE: Running task 2051 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2136 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_patch)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2168 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2312 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2412 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2413 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2414 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2415 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2416 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2417 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_lic unihash changed to 9e8850b0199d12ffc128bc5d937bd44c85d2b86d2a03bfbbc7cc4f66e4bb99e5
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2418 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure)
NOTE: Running task 2419 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2420 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 62f6431f19fede238466e190955b5b9d556d5896ebde028532bf0150e9f43d12
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2485 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2487 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2488 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Started
NOTE: Running task 2489 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2490 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4536779b7dca0a5c3d8e03313918f0c89e1a8005eaa6177b0bfb304d882f478c
NOTE: Setscene tasks completed
NOTE: Running task 2529 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2534 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2535 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2536 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 2537 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install: Succeeded
NOTE: Running task 2538 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 2539 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2540 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package)
NOTE: Running task 2541 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2542 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 2543 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Started
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.0.1-r0 do_packagedata: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:4.3.0-r0 to 0:4.0.1-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2544 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2545 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package_write_rpm)
NOTE: Running task 2546 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package: Succeeded
NOTE: Running task 2547 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 2548 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to 518097e87eb834d64fa523922aa4b38dee3f735c0663580edf28c175dbbe1a90
NOTE: recipe python3-jinja2-3.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2549 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 2550 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_write_rpm)
NOTE: Running task 2551 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm unihash changed to ab77d5397274e334eee70e20f97c4576db50709a43bfc346f85d9e9a6d4a4fc5
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2552 of 2552 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2552 tasks of which 2502 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============4656165279637899661==--
