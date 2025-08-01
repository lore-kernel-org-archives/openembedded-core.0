Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9104ACA0EC7
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.88808.1754057268481398641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=d9btQjgk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WbDmAEvt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019865f5d98a-daeb615e-1426-4bdf-8893-a0d34969c3c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WZWrR827ENxTWSxYF6qkQUvyCNih5KgPhN7kOvpIwGs=;
	b=d9btQjgkLjEoK5dNiX5Ijpfi+EGj2miPc6FPEViGksBUqudhNPuWd1DTHMbfaE9r
	tGJew2sCvswoX9zvl60TaWHS5EvIfAKjeyW7eG+pO62cPoWyAu5sIsz+k/v82keY/qq
	F62nDoc8hku23D2rqfs5XJL0e+yOJBu8A/KloBLg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WZWrR827ENxTWSxYF6qkQUvyCNih5KgPhN7kOvpIwGs=;
	b=WbDmAEvtTH5EkfPY9qK2iSraxzYNDwqaV+oILVsQVhYAkfFHA1zYEH8gdyYqdgeE
	CVvDQ2LR26A3xvbR+PDfMTraOiJZ9WAMs7rzpCRlWwqglL9OiZJbjUhYVNYU8R3Sir3
	PRzXSg9Gaj9XvIeyx9zVQ2i1k/vF8MDQ+LdA+oKU=
Content-Type: multipart/mixed; boundary="===============7489445217976318673=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.18 FAILED
Message-ID: <0101019865f5d98a-daeb615e-1426-4bdf-8893-a0d34969c3c8-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221263

--===============7489445217976318673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ofono* to *2.18* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.17-2.18.patch
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
From da7088707a8349dc47e54884b443204fc497decf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 08:43:15 +0000
Subject: [PATCH] ofono: upgrade 2.17 -> 2.18

---
 .../recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.17.bb b/meta/recipes-connectivity/ofono/ofono_2.18.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.17.bb
rename to meta/recipes-connectivity/ofono/ofono_2.18.bb
index 36bbe9439a..e2666b3e7e 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.17.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.18.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "70bb50997d3a7657edf133355677f8e04b2158bcb031118a67b296107f6ea73e"
+SRC_URI[sha256sum] = "f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f79c9f18a1c85dd00"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.47.1


--===============7489445217976318673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1933 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (941 cached, 1 parsed). 1933 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-84ebfc0a0c9edef127eda3d0f4e587919bb10093"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:84ebfc0a0c9edef127eda3d0f4e587919bb10093"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 420 Local 406 Mirrors 0 Missed 14 Current 620 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 779 of 1040 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_create_spdx_setscene)
NOTE: Running setscene task 824 of 1040 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_create_spdx_setscene)
NOTE: recipe ell-0.78-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.78-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 931 of 1040 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1686 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_recipe_qa)
NOTE: Setscene tasks completed
NOTE: recipe ofono-2.18-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.18-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2822 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_fetch)
NOTE: recipe ofono-2.18-r0: task do_fetch: Started
NOTE: recipe ofono-2.18-r0: task do_fetch: Succeeded
NOTE: Running task 2832 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_unpack)
NOTE: Running task 2833 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.18-r0: task do_unpack: Started
NOTE: recipe ofono-2.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.18-r0: task do_unpack: Succeeded
NOTE: Running task 2834 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_patch)
NOTE: Running task 2835 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.18-r0: task do_patch: Started
NOTE: recipe ofono-2.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.18-r0: task do_patch: Succeeded
NOTE: Running task 2836 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 2837 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_populate_lic)
NOTE: recipe ofono-2.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.18-r0: task do_populate_lic: Started
NOTE: recipe ofono-2.18-r0: task do_populate_lic: Succeeded
NOTE: recipe ofono-2.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2838 of 2850 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_configure)
NOTE: recipe ofono-2.18-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.78.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native_257.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd
 /systemd_257.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/
 build/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'mobile-broadband-provider-info', 'openssl', 'base-files', 'base-passwd', 'dbus', 'ell', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3-setuptools', 'python3', 'quilt-native', 'vala', 'bzip2', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'wayland-protocols', 'wayland', 'libice', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxkbcommon', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libffi
 ', 'libical', 'libpcre2', 'libseccomp', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-jinja2-native', 'python3-markupsafe-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libcap-ng-native', 'libcap-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Removing existing aclocal.m4
| NOTE: Executing ACLOCAL="aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot/usr/share/aclocal/ --force -I build-aux
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'build-aux'.
| libtoolize: copying file 'build-aux/ltmain.sh'
| libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'build-aux'.
| libtoolize: copying file 'build-aux/libtool.m4'
| libtoolize: copying file 'build-aux/ltoptions.m4'
| libtoolize: copying file 'build-aux/ltsugar.m4'
| libtoolize: copying file 'build-aux/ltversion.m4'
| libtoolize: copying file 'build-aux/lt~obsolete.m4'
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot/usr/share/aclocal/ --force -I build-aux
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot-native/usr/bin/autoconf --force
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot-native/usr/bin/autoheader --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:25: installing 'build-aux/compile'
| configure.ac:10: installing 'build-aux/missing'
| Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../sources/ofono-2.18/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  --enable-test --enable-external-ell --disable-static  --enable-bluetooth --with-systemdunitdir=/usr/lib/systemd/system/
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/meta/site/common
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking how to create a pax tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot accepts -fsanitize=undefined... yes
| checking for gawk... (cached) gawk
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot   option to reload object files... -r
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
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot object... ok
| checking for sysroot... /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot
| checking for a working dd... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
| checking whether -lc should be explicitly linked in... no
| checking dynamic linker characteristics... GNU/Linux ld.so
| checking how to hardcode library paths into programs... immediate
| checking whether stripping libraries is possible... yes
| checking if libtool supports shared libraries... yes
| checking whether to build shared libraries... yes
| checking whether to build static libraries... no
| checking for _init in -lasan... no
| checking for _init in -llsan... no
| checking for _init in -lubsan... no
| checking for explicit_bzero... yes
| checking for rawmemchr... yes
| checking for signalfd... yes
| checking for dlopen in -ldl... yes
| checking for glib-2.0 >= 2.68... yes
| checking for dbus-1 >= 1.6... yes
| checking for libudev >= 143... yes
| checking for ell >= 0.79... no
| configure: error: Embedded Linux library >= 0.72 is required
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/run.do_configure.1119691:267 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/run.do_configure.1119691, line 267
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/run.do_configure.1119691, line 243
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/run.do_configure.1119691, line 216
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/run.do_configure.1119691, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/run.do_configure.1119691, line 271
NOTE: recipe ofono-2.18-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2838 tasks of which 2829 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801084256.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801084256.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/log.do_configure.1119691
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ofono-2.18-r0 do_configure: configure failed
ERROR: ofono-2.18-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/run.do_configure.1119691' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.18/temp/log.do_configure.1119691
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_configure) failed with exit code '1'

--===============7489445217976318673==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.17-2.18.patch"

RnJvbSBkYTcwODg3MDdhODM0OWRjNDdlNTQ4ODRiNDQzMjA0ZmM0OTdkZWNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwODo0MzoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9m
b25vOiB1cGdyYWRlIDIuMTcgLT4gMi4xOAoKLS0tCiAuLi4vcmVjaXBlcy1jb25uZWN0aXZpdHkv
b2Zvbm8ve29mb25vXzIuMTcuYmIgPT4gb2Zvbm9fMi4xOC5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL3tvZm9ub18yLjE3LmJiID0+IG9mb25vXzIuMTguYmJ9ICg5NSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE3
LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjE4LmJiCnNpbWls
YXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm9fMi4xNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9u
by9vZm9ub18yLjE4LmJiCmluZGV4IDM2YmJlOTQzOWEuLmUyNjY2YjNlN2UgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi4xNy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMTguYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJkYnVzIGdsaWItMi4wIHVkZXYgbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRl
ci1pbmZvIGVsbCIKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9uZXR3b3Jr
LyR7QlBOfS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vb2Zvbm8gXAogICAgICAg
ICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzBiYjUwOTk3ZDNhNzY1N2VkZjEzMzM1NTY3
N2Y4ZTA0YjIxNThiY2IwMzExMThhNjdiMjk2MTA3ZjZlYTczZSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJmNzRjM2JiYTdlYmFjNDg4ZmVkN2JjZmE2MTEzYjBlMzllNzIzZDJlMWEyNGI1M2Y3OWM5
ZjE4YTFjODVkZDAwIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgdXBkYXRlLXJjLmQg
c3lzdGVtZCBnb2JqZWN0LWludHJvc3BlY3Rpb24tZGF0YQogCi0tIAoyLjQ3LjEKCg==

--===============7489445217976318673==--

