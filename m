Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88E4CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11322.1755263219041506620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nSxMvxNE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FKYlYokE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010198add7327d-7bade317-057b-44a3-a6f9-0cbbca6e5696-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VZuma/pYebZa4liYaVR5AnuxOTVNvKET+GdveoZVG2E=;
	b=nSxMvxNEsFxSbuwE/1lPwVHbqnEZfHeYcQECY4EyASMtjHVXfWdx3+QBclOJS5LN
	MU6h542lSRWTerCLqP8vkY2J7YDX8zWyWo1iWkO1iqVZJBz0QzA+xZIHJ6+KOKJ21Lo
	fC9xo9NfFl8h+3RzTBgFb/6TwXCd6fEPeuJHv6HU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VZuma/pYebZa4liYaVR5AnuxOTVNvKET+GdveoZVG2E=;
	b=FKYlYokENt3PkCJqeso1RdLVwgw/5DxRZmRodeh/Wi4A3fS/7yiZSlq9vo4Z5n3Z
	AhL/EPwTPGKbMstkxcJzqY3+FOlQaAfMHCiEltwflvawyBX9xfdpFXrJDnUtURL3s9I
	MIgAu49Jz072kD0CjOexPHMxOx0emZ1o4yflKTvo=
Content-Type: multipart/mixed; boundary="===============2224816124263372622=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xf86-input-mouse: upgrading to 2.0.0 FAILED
Message-ID: <01010198add7327d-7bade317-057b-44a3-a6f9-0cbbca6e5696-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:06:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221888

--===============2224816124263372622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xf86-input-mouse* to *2.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-xf86-input-mouse-upgrade-1.9.5-2.0.0.patch
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

-- >8 --
From dbe56bbb060092d0a58e2e8b98abf0d9f864e8a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 07:10:57 +0000
Subject: [PATCH] xf86-input-mouse: upgrade 1.9.5 -> 2.0.0

---
 .../{xf86-input-mouse_1.9.5.bb => xf86-input-mouse_2.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.5.bb => xf86-input-mouse_2.0.0.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb
index 92e54d9701..7b10a2a487 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb
@@ -10,5 +10,5 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d213a69053dffe9bcab94abf60013d33"
 
-SRC_URI[sha256sum] = "4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968"
+SRC_URI[sha256sum] = "7b1f9d06111d49d257778da46e264a69851f3c7e2f5034fc2c25c7f03876f989"
 XORG_DRIVER_COMPRESSOR = ".tar.xz"
-- 
2.47.1


--===============2224816124263372622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (934 cached, 10 parsed). 1941 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-040695a87b6c4c49e34d7b4c80de9b37303c910a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:040695a87b6c4c49e34d7b4c80de9b37303c910a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 533 Local 520 Mirrors 0 Missed 13 Current 677 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2989 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_recipe_qa)
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_recipe_qa: Started
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3321 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_fetch)
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_fetch: Started
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 3322 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_unpack)
NOTE: Running task 3323 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_unpack: Started
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 3324 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_patch)
NOTE: Running task 3325 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_patch: Started
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3326 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3327 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_populate_lic)
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_populate_lic: Started
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3328 of 3340 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_configure)
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-xserver/xserver-xorg
 _21.1.18.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'binutils', 'clang', 'libclc', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'libtirpc', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'libdrm', 'freetype', 'libepoxy', 'mesa', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'encodings', 'font-util', 'libfontenc', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcvt', 'libx
 damage', 'libxdmcp', 'libxext', 'libxfixes', 'libxfont2', 'libxkbcommon', 'libxkbfile', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'xserver-xorg', 'kmod', 'linux-libc-headers', 'libpng', 'acl', 'attr', 'bash-completion', 'curl', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'nettle', 'shared-mime-info', 'sqlite3', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Removing existing aclocal.m4
| NOTE: Executing ACLOCAL="aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot/usr/share/aclocal/ --force
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, '.'.
| libtoolize: copying file './ltmain.sh'
| libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
| libtoolize: and rerunning libtoolize and aclocal.
| libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot/usr/share/aclocal/ --force
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot-native/usr/bin/autoconf --force
| configure.ac:44: warning: cannot check for file existence when cross compiling
| ../sources/autoconf-2.72/lib/autoconf/general.m4:3008: AC_CHECK_FILE is expanded from...
| aclocal.m4:9592: XORG_MANPAGE_SECTIONS is expanded from...
| aclocal.m4:11300: XORG_DEFAULT_NOCODE_OPTIONS is expanded from...
| aclocal.m4:11316: XORG_DEFAULT_OPTIONS is expanded from...
| configure.ac:44: the top level
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot-native/usr/bin/autoheader --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:32: installing './compile'
| configure.ac:35: installing './missing'
| src/Makefile.am: installing './depcomp'
| autoreconf: './config.sub' is updated
| autoreconf: './config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../sources/xf86-input-mouse-2.0.0/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  --disable-static
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot understands -c and -o together... yes
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for wchar.h... yes
| checking for minix/config.h... no
| checking whether it is safe to define __EXTENSIONS__... yes
| checking whether _XOPEN_SOURCE should be defined... no
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports the include directive... yes (GNU style)
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot... none
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot   option to reload object files... -r
| checking for file... file
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot object... ok
| checking for sysroot... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot
| checking for a working dd... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot options needed to detect all undeclared functions... none needed
| checking whether __clang__ is declared... no
| checking whether __INTEL_COMPILER is declared... no
| checking whether __SUNPRO_C is declared... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=unknown-warning-option... no
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=unused-command-line-argument... no
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wall... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wpointer-arith... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wmissing-declarations... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wformat=2... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wstrict-prototypes... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wmissing-prototypes... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wnested-externs... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wbad-function-cast... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wold-style-definition... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wunused... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wuninitialized... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wshadow... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wmissing-noreturn... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wmissing-format-attribute... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wredundant-decls... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Wlogical-op... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=implicit... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=nonnull... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=init-self... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=main... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=missing-braces... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=sequence-point... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=return-type... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=trigraphs... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=array-bounds... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=write-strings... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=address... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=int-to-pointer-cast... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=pointer-to-int-cast... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -pedantic... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/recipe-sysroot supports -Werror=attributes... yes
| checking for asprintf... yes
| checking for timingsafe_memcmp... no
| checking for xorg-server >= 1.10 xproto >= 7.0.27 inputproto... yes
| configure: error: This is not the mouse driver you are looking for. Use evdev or libinput.
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/run.do_configure.1681558:267 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/run.do_configure.1681558, line 267
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/run.do_configure.1681558, line 243
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/run.do_configure.1681558, line 216
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/run.do_configure.1681558, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/run.do_configure.1681558, line 271
NOTE: recipe xf86-input-mouse-2_2.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3328 tasks of which 3319 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815071037.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815071037.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/log.do_configure.1681558
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: xf86-input-mouse-2_2.0.0-r0 do_configure: configure failed
ERROR: xf86-input-mouse-2_2.0.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/run.do_configure.1681558' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/xf86-input-mouse/2.0.0/temp/log.do_configure.1681558
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-driver/xf86-input-mouse_2.0.0.bb:do_configure) failed with exit code '1'

--===============2224816124263372622==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xf86-input-mouse-upgrade-1.9.5-2.0.0.patch"

RnJvbSBkYmU1NmJiYjA2MDA5MmQwYTU4ZTJlOGI5OGFiZjBkOWY4NjRlOGEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDc6MTA6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
Zjg2LWlucHV0LW1vdXNlOiB1cGdyYWRlIDEuOS41IC0+IDIuMC4wCgotLS0KIC4uLi97eGY4Ni1p
bnB1dC1tb3VzZV8xLjkuNS5iYiA9PiB4Zjg2LWlucHV0LW1vdXNlXzIuMC4wLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci97eGY4Ni1pbnB1dC1tb3VzZV8xLjku
NS5iYiA9PiB4Zjg2LWlucHV0LW1vdXNlXzIuMC4wLmJifSAoODQlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LW1vdXNlXzEuOS41LmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbW91c2VfMi4w
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbW91c2VfMS45LjUuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LW1vdXNlXzIuMC4wLmJiCmlu
ZGV4IDkyZTU0ZDk3MDEuLjdiMTBhMmE0ODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LW1vdXNlXzEuOS41LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LW1vdXNlXzIuMC4wLmJiCkBAIC0x
MCw1ICsxMCw1IEBAIGRyaXZlci4iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PWQyMTNhNjkwNTNkZmZlOWJjYWI5NGFiZjYwMDEzZDMzIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNGZkZThhZTliNDQzNTJlMmEyMDg1ODRjMzY1MjhlZTNlZDEzY2Y1ZmU0NDE3MjA4
YTk3ODVkYWNjZWZkOTk2OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3YjFmOWQwNjExMWQ0OWQy
NTc3NzhkYTQ2ZTI2NGE2OTg1MWYzYzdlMmY1MDM0ZmMyYzI1YzdmMDM4NzZmOTg5IgogWE9SR19E
UklWRVJfQ09NUFJFU1NPUiA9ICIudGFyLnh6IgotLSAKMi40Ny4xCgo=

--===============2224816124263372622==--

