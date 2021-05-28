Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.6797.1622200976431227461
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 69A3138C1382
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gi-docgen: upgrading to 2021.6 SUCCEEDED
Message-ID: <MADEUP.168337318582E5FC.665@lists.openembedded.org>
X-Groupsio-MsgNum: 152357
Content-Type: multipart/mixed; boundary="===============5624945058965411851=="

--===============5624945058965411851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gi-docgen* to *2021.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gi-docgen-upgrade-2021.5-2021.6.patch
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

--===============5624945058965411851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (0 cached, 822 parsed). 1456 targets, 41 skipped, 0 masked, 0 errors.
Removing 131 recipes from the core2-32 sysroot...done.
Removing 135 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-301cd99a0246d9d34d336a90a84475511e4cd351"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:301cd99a0246d9d34d336a90a84475511e4cd351"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 642 Local 610 Network 0 Missed 32 Current 203 (95% match, 96% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 204 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 210 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-21.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 266 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-setuptools-56.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-zipp-3.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-attrs-21.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 279 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 281 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 284 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.2.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 290 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 293 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 294 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 295 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-56.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 297 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-21.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 298 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-setuptools-56.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 302 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 304 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 331 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 336 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 337 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 338 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 341 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 342 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.0.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 350 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 353 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 355 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 358 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 359 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 361 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 362 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 363 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 364 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 366 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 367 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 368 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 369 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 372 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 373 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 374 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: Running setscene task 379 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 382 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 383 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-21.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 386 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 390 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 392 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 395 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 397 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 400 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 405 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 406 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 407 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 411 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 412 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 413 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-4.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 416 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 417 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 423 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 428 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 433 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 434 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-56.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.49-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 679 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 441 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 745 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 442 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: Running task 763 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_fetch)
NOTE: Running task 764 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_fetch)
NOTE: Running task 765 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: Running task 775 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 447 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 449 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 934 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: Running task 936 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_unpack)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 937 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: recipe nettle-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 938 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_unpack)
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 939 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: recipe libgcrypt-1.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 456 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 458 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 960 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: Running task 961 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 962 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 964 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_patch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: Running task 972 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Started
NOTE: Running task 998 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1011 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 487 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1016 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1017 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1018 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1027 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1028 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1050 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 39b7f58cb6c855902cd10d09b516d1be1926e8042e17d91a57a6fa94bde0ec48
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.49.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.38+gitAUTOINC+d38abd9180_231125d238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1242 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libcap-2.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running task 1243 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1250 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 671 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1288 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1309 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1318 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1344 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running setscene task 750 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1354 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-3.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 770 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 772 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 774 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 781 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 795 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1411 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 003c92f014369e85d1ad14dc5d1d0ac751b330863894e4dc43b3bd2a493a89ed
NOTE: Running task 1420 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 823 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 825 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 829 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 832 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 839 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 842 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 843 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 845 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2081 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2242 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2273 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2274 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2275 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2325 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2587 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2588 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2589 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_configure)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2590 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_configure)
NOTE: Running task 2591 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2592 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2593 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Succeeded
NOTE: Running task 2594 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2595 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_compile)
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2596 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_compile)
NOTE: Running task 2597 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2598 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2599 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2600 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Succeeded
NOTE: Running task 2601 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2602 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2603 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2604 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2605 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_install)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2606 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2607 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 2608 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Succeeded
NOTE: Running task 2609 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: Running task 2610 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Succeeded
NOTE: Running task 2611 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package)
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2612 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2613 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2614 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 2615 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Succeeded
NOTE: Running task 2616 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Succeeded
NOTE: Running task 2617 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_packagedata)
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2618 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2619 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Succeeded
NOTE: Running task 2620 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2621 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2622 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Succeeded
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-src went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dbg went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-ptest went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-staticdev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-doc went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-locale went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2 went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2623 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Succeeded
NOTE: Running task 2624 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2625 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package_write_rpm)
NOTE: Running task 2626 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_write_rpm)
NOTE: Running task 2627 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_qa)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2628 of 2628 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2628 tasks of which 2545 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============5624945058965411851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gi-docgen/gi-docgen-dbg: PKGV changed from 2021.5 [default] to 2021.6 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-dbg: PV changed from "2021.5" to "2021.6"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-dev: PKGV changed from 2021.5 [default] to 2021.6 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-dev: PV changed from "2021.5" to "2021.6"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-doc: PKGV changed from 2021.5 [default] to 2021.6 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-doc: PV changed from "2021.5" to "2021.6"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-locale: PKGV changed from 2021.5 [default] to 2021.6 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-locale: PV changed from "2021.5" to "2021.6"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-src: PKGV changed from 2021.5 [default] to 2021.6 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-src: PV changed from "2021.5" to "2021.6"
packages/core2-32-poky-linux/gi-docgen/gi-docgen-staticdev: PKGV changed from 2021.5 [default] to 2021.6 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen-staticdev: PV changed from "2021.5" to "2021.6"
packages/core2-32-poky-linux/gi-docgen/gi-docgen: PKGSIZE changed from 1836693 to 1849931 (+1%)
packages/core2-32-poky-linux/gi-docgen/gi-docgen: PKGV changed from 2021.5 [default] to 2021.6 [default]
packages/core2-32-poky-linux/gi-docgen/gi-docgen: PV changed from "2021.5" to "2021.6"
packages/core2-32-poky-linux/gi-docgen: PKGV changed from 2021.5 [default] to 2021.6 [default]
packages/core2-32-poky-linux/gi-docgen: PV changed from "2021.5" to "2021.6"
Changes to packages/core2-32-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.9/site-packages/gi_docgen-2021.5-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/gi_docgen-2021.6-py3.9.egg-info

--===============5624945058965411851==
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
DISTRO_VERSION       = "3.3+snapshot-301cd99a0246d9d34d336a90a84475511e4cd351"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:301cd99a0246d9d34d336a90a84475511e4cd351"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 3 Network 0 Missed 31 Current 800 (8% match, 96% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1522 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: Running task 1735 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 1792 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_fetch)
NOTE: Running task 1793 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_fetch)
NOTE: Running task 1794 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: Running task 1856 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1934 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 1935 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Succeeded
NOTE: Running task 2072 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: Running task 2073 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: Running task 2074 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_unpack)
NOTE: Running task 2075 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_unpack)
NOTE: Running task 2076 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: Running task 2081 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2082 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2083 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: Running task 2084 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2167 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2168 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: Running task 2329 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2366 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_patch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2400 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2449 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2450 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2451 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2452 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2453 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2454 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2455 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: Running task 2456 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2457 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2458 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2459 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 39b7f58cb6c855902cd10d09b516d1be1926e8042e17d91a57a6fa94bde0ec48
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c595f0a663b4b4145931aa921820e54ee4039dbe83b5859baf3e073783af767b
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2501 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2502 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: Running task 2516 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2517 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_configure)
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2518 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_configure)
NOTE: Running task 2519 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2530 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: Running task 2531 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2532 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_compile)
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2533 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2534 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_compile)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2535 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2536 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2537 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Succeeded
NOTE: Running task 2538 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: Running task 2539 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2540 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 12d7a2ece7d5b4db4b0aab64a6f7075029a42a683d2a71033b32fe1f0196787b
NOTE: Setscene tasks completed
NOTE: Running task 2579 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2583 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_install)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: Running task 2584 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Started
NOTE: Running task 2585 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2586 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 2587 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Succeeded
NOTE: Running task 2588 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: Running task 2589 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Succeeded
NOTE: Running task 2590 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package)
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2591 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2592 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2593 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 2594 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Succeeded
NOTE: Running task 2595 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_packagedata)
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Succeeded
NOTE: Running task 2596 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Succeeded
NOTE: Running task 2597 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2598 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2599 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2600 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2601 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-src went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dbg went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-ptest went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-staticdev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-doc went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-locale went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2 went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2602 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2603 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2604 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package_write_rpm)
NOTE: Running task 2605 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_write_rpm)
NOTE: Running task 2606 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_qa)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2607 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2607 tasks of which 2529 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============5624945058965411851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/gi-docgen (sysroot):
  /usr/lib/python3.9/site-packages/gi_docgen-2021.5-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/gi_docgen-2021.6-py3.9.egg-info

--===============5624945058965411851==
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
DISTRO_VERSION       = "3.3+snapshot-301cd99a0246d9d34d336a90a84475511e4cd351"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:301cd99a0246d9d34d336a90a84475511e4cd351"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 3 Network 0 Missed 31 Current 800 (8% match, 96% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1522 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: Running task 1735 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 1792 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_fetch)
NOTE: Running task 1793 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_fetch)
NOTE: Running task 1794 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: Running task 1856 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1896 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 1897 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 2084 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_unpack)
NOTE: Running task 2085 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_unpack)
NOTE: Running task 2086 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: Running task 2087 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Succeeded
NOTE: Running task 2088 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: Running task 2089 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2090 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: Running task 2091 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: Running task 2092 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2149 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: Running task 2168 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: Running task 2262 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2307 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_patch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2328 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Succeeded
NOTE: Running task 2449 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2450 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_patch)
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2451 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2452 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2453 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2454 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2455 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2456 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2457 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2458 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2459 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 39b7f58cb6c855902cd10d09b516d1be1926e8042e17d91a57a6fa94bde0ec48
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2460 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_configure)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2461 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: Running task 2462 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: Running task 2463 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_configure)
NOTE: Running task 2464 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: Running task 2465 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f20e56863f279864f793c196186fd913736ed0b7b4957799428efc8fc1d21d8d
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_compile)
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Succeeded
NOTE: Running task 2530 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2531 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2532 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2533 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: Running task 2534 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2535 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2536 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2537 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2538 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_install)
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Succeeded
NOTE: Running task 2539 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2540 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: Running task 2541 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_install)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2542 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 68fb4675c705c63d14a6e5ec82c070bcf09e2a0e26b586284168e481d961f3dc
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Started
NOTE: Running task 2581 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2585 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2586 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 2587 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Succeeded
NOTE: Running task 2588 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: Running task 2589 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Succeeded
NOTE: Running task 2590 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2591 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2592 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Succeeded
NOTE: Running task 2593 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2594 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 2595 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Succeeded
NOTE: Running task 2596 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2597 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Succeeded
NOTE: Running task 2598 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Started
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-src went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dbg went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-ptest went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-staticdev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-doc went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-locale went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2 went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
NOTE: Running task 2599 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package_write_rpm)
NOTE: Running task 2600 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2601 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2602 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Succeeded
NOTE: Running task 2603 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2604 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package_write_rpm)
NOTE: Running task 2605 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_write_rpm)
NOTE: Running task 2606 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_qa)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2607 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2607 tasks of which 2529 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============5624945058965411851==
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
DISTRO_VERSION       = "3.3+snapshot-301cd99a0246d9d34d336a90a84475511e4cd351"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:301cd99a0246d9d34d336a90a84475511e4cd351"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 3 Network 0 Missed 31 Current 800 (8% match, 96% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1100 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1522 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: Running task 1735 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: Running task 1792 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_fetch)
NOTE: Running task 1793 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_fetch)
NOTE: Running task 1794 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1856 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: Running task 1866 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 1867 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Succeeded
NOTE: Running task 2015 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: Running task 2020 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: Running task 2021 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_unpack)
NOTE: Running task 2022 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_unpack)
NOTE: Running task 2023 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2072 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: Running task 2082 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2083 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2084 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Started
NOTE: Running task 2168 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2226 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2264 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 2281 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_patch)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: Running task 2358 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2450 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2451 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2452 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2453 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2454 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2455 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2456 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2457 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2458 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2459 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b80ca9cb6f12efc434285e0cbdc29240bcddec8e6bb23ad97d256c99ba75ad9c
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 39b7f58cb6c855902cd10d09b516d1be1926e8042e17d91a57a6fa94bde0ec48
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2523 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2524 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_configure)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2525 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: Running task 2526 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_configure)
NOTE: Running task 2527 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: Running task 2528 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2529 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Succeeded
NOTE: Running task 2530 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Succeeded
NOTE: Running task 2531 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_compile)
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2532 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_compile)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2533 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2534 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: Running task 2535 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2536 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2537 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 2538 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5886c3877a166989898858b3c759cb4f873c991d347b81a7653b3acf48423ffc
NOTE: Setscene tasks completed
NOTE: Running task 2577 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2580 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_install)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running task 2581 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Succeeded
NOTE: Running task 2583 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_install)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2584 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2585 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2586 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 2587 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Succeeded
NOTE: Running task 2588 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: Running task 2589 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Succeeded
NOTE: Running task 2590 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package)
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2591 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2592 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2593 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 2594 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Succeeded
NOTE: Running task 2595 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_packagedata)
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Succeeded
NOTE: Running task 2596 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Succeeded
NOTE: Running task 2597 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2598 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2599 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2600 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2601 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-src went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dbg went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-ptest went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-staticdev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-doc went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-locale went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2 went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2602 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Succeeded
NOTE: Running task 2603 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2604 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package_write_rpm)
NOTE: Running task 2605 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_write_rpm)
NOTE: Running task 2606 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_qa)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2607 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2607 tasks of which 2529 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============5624945058965411851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1456 entries from dependency cache.
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
DISTRO_VERSION       = "3.3+snapshot-301cd99a0246d9d34d336a90a84475511e4cd351"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:301cd99a0246d9d34d336a90a84475511e4cd351"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 80 Local 49 Network 0 Missed 31 Current 754 (61% match, 96% complete)
Removing 12 stale sstate objects for arch core2-64...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 756 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 757 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 758 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 760 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 762 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 766 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 792 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 795 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 796 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 797 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 799 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 800 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-setuptools-56.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-56.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 802 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_56.2.0.bb:do_packagedata_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 803 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 804 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 805 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-56.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 806 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 807 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 808 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
ERROR: python3-setuptools-56.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:57.0.0-r0 to 0:56.2.0-r0) [version-going-backwards]
ERROR: python3-setuptools-56.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:57.0.0-r0 to 0:56.2.0-r0) [version-going-backwards]
ERROR: python3-setuptools-56.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:57.0.0-r0 to 0:56.2.0-r0) [version-going-backwards]
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
ERROR: python3-setuptools-56.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:57.0.0-r0 to 0:56.2.0-r0) [version-going-backwards]
ERROR: python3-setuptools-56.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:57.0.0-r0 to 0:56.2.0-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
ERROR: python3-setuptools-56.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:57.0.0-r0 to 0:56.2.0-r0) [version-going-backwards]
ERROR: python3-setuptools-56.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:57.0.0-r0 to 0:56.2.0-r0) [version-going-backwards]
ERROR: python3-setuptools-56.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:57.0.0-r0 to 0:56.2.0-r0) [version-going-backwards]
NOTE: recipe python3-setuptools-56.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1420 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_fetch)
NOTE: recipe xorgproto-2021.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Started
NOTE: Running task 1667 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_fetch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1723 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_unpack)
NOTE: Running task 1724 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1726 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_fetch)
NOTE: Running task 1727 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_fetch)
NOTE: Running task 1728 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_fetch)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1788 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_fetch)
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gi-docgen-2021.6-r0: task do_fetch: Succeeded
NOTE: Running task 1884 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_unpack)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1947 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_unpack)
NOTE: Running task 1948 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_unpack)
NOTE: Running task 1949 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_unpack)
NOTE: Running task 1956 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1972 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_unpack)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1986 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_patch)
NOTE: Running task 2016 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Started
NOTE: Running task 2017 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2018 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 2091 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_patch)
NOTE: Running task 2100 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_patch)
NOTE: Running task 2117 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_patch)
NOTE: recipe gi-docgen-2021.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2128 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_patch)
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 2380 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_patch)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2381 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2391 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gi-docgen-2021.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_patch: Succeeded
NOTE: Running task 2392 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2394 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2395 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2396 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_configure)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2398 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_compile)
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_lic: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_lic unihash changed to 39b7f58cb6c855902cd10d09b516d1be1926e8042e17d91a57a6fa94bde0ec48
NOTE: Running task 2399 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_configure)
NOTE: recipe python3-pygments-2.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2400 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure)
NOTE: Running task 2401 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_configure)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2410 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_configure: Succeeded
NOTE: Running setscene task 827 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2420 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_configure_ptest_base)
NOTE: Running task 2421 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_compile)
NOTE: Running task 2422 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_configure)
NOTE: Running task 2423 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_configure)
NOTE: Running task 2424 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_compile)
NOTE: Running task 2425 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_configure: Succeeded
NOTE: recipe python3-markdown-3.3.4-r0: task do_configure: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typogrify-2.0.7-r0: task do_compile: Succeeded
NOTE: Running setscene task 830 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2431 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile)
NOTE: Running task 2432 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_install)
NOTE: Running task 2433 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_compile)
NOTE: Running task 2434 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_compile)
NOTE: Running task 2435 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_install)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2436 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package)
NOTE: recipe python3-markdown-3.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2438 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_install)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2472 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install)
NOTE: recipe python3-pygments-2.9.0-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2473 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2474 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2475 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package)
NOTE: Running task 2478 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_populate_sysroot)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 62f6431f19fede238466e190955b5b9d556d5896ebde028532bf0150e9f43d12
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2497 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-markdown-3.3.4-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package)
NOTE: recipe gi-docgen-2021.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install: Succeeded
NOTE: Running task 2499 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2536 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4536779b7dca0a5c3d8e03313918f0c89e1a8005eaa6177b0bfb304d882f478c
NOTE: Setscene tasks completed
NOTE: Running task 2589 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2593 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_packagedata)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package: Succeeded
NOTE: Running task 2594 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_package: Succeeded
NOTE: Running task 2595 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_packagedata)
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package: Succeeded
NOTE: Running task 2596 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_packagedata)
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Started
NOTE: recipe python3-smartypants-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2597 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-typogrify-2.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2598 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb:do_package_write_rpm)
NOTE: recipe gi-docgen-2021.6-r0: task do_packagedata: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_install: Succeeded
NOTE: Running task 2599 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package: Succeeded
NOTE: Running task 2600 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_packagedata)
NOTE: recipe python3-markdown-3.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2601 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markdown_3.3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Started
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-src went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dbg went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
NOTE: recipe python3-typogrify-2.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-smartypants-2.0.0-r0: task do_package_write_rpm: Succeeded
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-ptest went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-staticdev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-dev went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-doc went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2-locale went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
ERROR: python3-jinja2-3.0.0-r0 do_packagedata: QA Issue: Package version for package python3-jinja2 went backwards which would break package feeds (from 0:3.0.1-r0 to 0:3.0.0-r0) [version-going-backwards]
NOTE: recipe python3-jinja2-3.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2602 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markdown-3.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package: Succeeded
NOTE: Running task 2603 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.9.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2604 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.9.0.bb:do_package_write_rpm)
NOTE: Running task 2605 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_write_rpm)
NOTE: Running task 2606 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_package_qa)
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Started
NOTE: recipe gi-docgen-2021.6-r0: task do_package_qa: Succeeded
NOTE: recipe gi-docgen-2021.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.9.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2607 of 2607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2607 tasks of which 2529 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 16 ERROR messages shown, returning a non-zero exit code.

--===============5624945058965411851==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gi-docgen-upgrade-2021.5-2021.6.patch"

From 267be25ad36dc09731bafee1c1c81dcbac716b96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 08:45:47 +0000
Subject: [PATCH] gi-docgen: upgrade 2021.5 -> 2021.6

---
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
index 4d779a9bdd..b6721dc4e0 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://gi-docgen.py;beginline=1;endline=5;md5=2dc0f1f0120247
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/gi-docgen.git;protocol=https;branch=main"
 
-PV = "2021.5"
-SRCREV = "7dee859321573f9c843ef7fb136f11142cb6ddf8"
+PV = "2021.6"
+SRCREV = "cb76996ba9ef7a1634ab9bde30c77c3bbb47c8db"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============5624945058965411851==--
