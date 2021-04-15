Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.1289.1618510599557339342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8DC2838C11FD
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.68.0 FAILED
Message-ID: <MADEUP.16761AD0BAA5B4E2.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150488
Content-Type: multipart/mixed; boundary="===============1755671647799359623=="

--===============1755671647799359623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.68.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.66.0-2.68.0.patch
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

--===============1755671647799359623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b9d6cdf5304265533ba719ac5963a000167cdaec"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 154 Local 146 Network 0 Missed 8 Current 534 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1352 of 2189 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_fetch)
NOTE: Running task 1505 of 2189 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_write_config)
NOTE: recipe glib-networking-2.68.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1789 of 2189 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_unpack)
NOTE: Running task 1790 of 2189 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.68.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.68.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.68.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2175 of 2189 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_patch)
NOTE: recipe glib-networking-2.68.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 2189 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2177 of 2189 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_populate_lic)
NOTE: recipe glib-networking-2.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.68.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2178 of 2189 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_configure)
NOTE: recipe glib-networking-2.68.0-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-networking-2.68.0-r0: task do_configure: Started
ERROR: glib-networking-2.68.0-r0 do_configure: meson failed
ERROR: glib-networking-2.68.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291' failed with exit code 1:
The Meson build system
Version: 0.57.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/glib-networking-2.68.0
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/build
Build type: cross build
Project name: glib-networking
Project version: 2.68.0
C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot ld.bfd 2.36.1.20210209
C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C linker for the build machine: gcc ld.bfd 2.30-79
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86
Host machine cpu: i686
Target machine cpu family: x86
Target machine cpu: i686
Compiler for C supports arguments -Werror=declaration-after-statement: YES 
Compiler for C supports arguments -Werror=implicit-function-declaration: YES 
Compiler for C supports link arguments -Wl,--version-script,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/glib-networking-2.68.0/glib-networking.map: YES 
Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
Dependency glib-2.0 found: NO found 2.66.7 but need: '>= 2.67.0'
Found CMake: NO
Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency glib-2.0

../glib-networking-2.68.0/meson.build:51:0: ERROR: Neither a subproject directory nor a glib.wrap file was found.

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291:186 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 186
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 166
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 152
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 190

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 160
	#3: do_configure, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/log.do_configure.495291
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.57.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.
 7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['patch-native', 'gnutls', 'meson-native', 'gcc-runtime', 'gcc-cross-i686', 'xz-native', 'ninja-native', 'glib-2.0', 'quilt-native', 'glibc', 'python3-native', 'pkgconfig-native', 'pseudo-native', 'gettext-native', 'attr-native', 'libtool-native', 'automake-native', 'autoconf-native', 'nettle', 'gmp', 'libunistring', 'libidn2', 'texinfo-dummy-native', 'gettext-minimal-native', 'python3-setuptools-native', 'linux-libc-headers', 'libgcc', 'binutils-cross-i686', 'gnu-config-native', 'zlib-native', 'flex-native', 'libmpc-native', 'mpfr-native', 'gmp-native', 're2c-native', 'libffi', 'zlib', 'dbus', 'bash-completion', 'libpcre', 'util-linux', 'readline-native', 'openssl-native', 'libtirpc-native', 'libnsl2-native', 'libffi-native', 'bzip2-native', 'sqlite3-native', 'gdbm-native', 'util-linux-native', 'm4-native', 'update-rc.d', 'base-files', 'shadow-sysroot', 'shadow-native', 'base-passwd', 'systemd', 'shadow', 'initscripts', 'expat', 'libsm'
 , 'libx11', 'autoconf-archive', 'bzip2', 'libpam', 'opkg-utils', 'ncurses', 'libcap-ng', 'libxcrypt', 'util-linux-libuuid', 'ncurses-native', 'libcap-ng-native', 'libpcre2-native', 'util-linux-libuuid-native', 'xz', 'acl', 'libcap', 'kmod', 'libxkbcommon', 'attr', 'libice', 'xtrans', 'util-macros', 'xorgproto', 'libxcb', 'cracklib', 'flex', 'wayland', 'wayland-protocols', 'xkeyboard-config', 'libxdmcp', 'libxau', 'xcb-proto', 'libpthread-stubs', 'libxml2', 'python3', 'libnsl2', 'libtirpc', 'gdbm', 'readline', 'openssl', 'sqlite3']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgnome_proxy=disabled -Dgnutls=enabled -Dlibproxy=disabled -Dopenssl=disabled -Dinstalled_tests=true...
| The Meson build system
| Version: 0.57.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/glib-networking-2.68.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/build
| Build type: cross build
| Project name: glib-networking
| Project version: 2.68.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot ld.bfd 2.36.1.20210209
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-79
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports link arguments -Wl,--version-script,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/glib-networking-2.68.0/glib-networking.map: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Dependency glib-2.0 found: NO found 2.66.7 but need: '>= 2.67.0'
| Found CMake: NO
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../glib-networking-2.68.0/meson.build:51:0: ERROR: Neither a subproject directory nor a glib.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291:186 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 186
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 190
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291' failed with exit code 1:
| The Meson build system
| Version: 0.57.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/glib-networking-2.68.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/build
| Build type: cross build
| Project name: glib-networking
| Project version: 2.68.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot ld.bfd 2.36.1.20210209
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-79
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports link arguments -Wl,--version-script,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/glib-networking-2.68.0/glib-networking.map: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Dependency glib-2.0 found: NO found 2.66.7 but need: '>= 2.67.0'
| Found CMake: NO
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../glib-networking-2.68.0/meson.build:51:0: ERROR: Neither a subproject directory nor a glib.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291:186 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 186
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 166
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.68.0-r0/temp/run.do_configure.495291, line 190
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 160
| 	#3: do_configure, autogenerated, line 2
NOTE: recipe glib-networking-2.68.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2178 tasks of which 2170 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============1755671647799359623==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.66.0-2.68.0.patch"

From 42e9127eb3890e5870288e784a11bc30af33e494 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 03:12:54 +0000
Subject: [PATCH] glib-networking: upgrade 2.66.0 -> 2.68.0

---
 .../{glib-networking_2.66.0.bb => glib-networking_2.68.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.66.0.bb => glib-networking_2.68.0.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.68.0.bb
index 230932daf0..ee339fe19c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.66.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.68.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "c5d7be2437fdd196eebfb70c4517b96d3ba7ec13bd496318b8f02dea383e0099"
+SRC_URI[archive.sha256sum] = "0b235e85ad26b3c0d12255d0963c460e5a639c4722f78e2a03e969e224b29f6e"
 
 PACKAGECONFIG ??= "gnutls ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.27.0


--===============1755671647799359623==--
