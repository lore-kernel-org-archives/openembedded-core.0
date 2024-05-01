Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B00C3DA42
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1111.1714579214878288848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UPTT4L8h;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=akeyMCsV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f34e28fac-04b7e1ee-76aa-4c29-9aa5-416380bf0adf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w28sYmqyofL5ca3up23iJNSQAQ8Ugxl+4rEtC+IJLwY=;
	b=UPTT4L8hEyk0Jhw+bX4xvWluoEu4zFpEEB6DnR6Ae+KbXMZJSA7kogAarYRm9OF9
	vZ0FXrd34tfJJIUDInDiz0CKBpO6BCHXjzO8gqKEubnM4GllzaTonE8+icK1ArOdknj
	XWTQiJHOpdvf0v5r7e+kUbEQhqB7AD8LFI3q4Qeo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579214;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w28sYmqyofL5ca3up23iJNSQAQ8Ugxl+4rEtC+IJLwY=;
	b=akeyMCsVEFf6VjCmwri6Vcjro3jrfNZ/nsnpSjsaJg8MVTf9hzQlJj9effW+KJc9
	UkdBB+ivMmRk3p0S/3nQUe00ipnBjGJm9suKtFR+StwzYMtM4kVB0UnhU/5PLsF50Cj
	c2ld4QuMyHyl6dfsqEAu18lxj940P8UzPPnVywyA=
Content-Type: multipart/mixed; boundary="===============6026135631549563409=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.6 FAILED
Message-ID: <0101018f34e28fac-04b7e1ee-76aa-4c29-9aa5-416380bf0adf-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198791

--===============6026135631549563409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ofono* to *2.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.4-2.6.patch
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
From 30f721b21dc80d32340e3fb78e2d176269511a2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 05:12:22 +0000
Subject: [PATCH] ofono: upgrade 2.4 -> 2.6

---
 ...-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch | 5 +----
 ...bim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch | 4 ++--
 .../ofono/{ofono_2.4.bb => ofono_2.6.bb}                     | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.4.bb => ofono_2.6.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
index 8a5a300adc..976df2bb77 100644
--- a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
+++ b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
@@ -1,4 +1,4 @@
-From 22b52db4842611ac31a356f023fc09595384e2ad Mon Sep 17 00:00:00 2001
+From 8cc9a9c3afeaed243670923f8601bef484d13e0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 May 2019 18:11:22 -0700
 Subject: [PATCH] mbim: add an optional TEMP_FAILURE_RETRY macro copy
@@ -31,6 +31,3 @@ index e159235..51693ea 100644
  enum mbim_control_message {
  	MBIM_OPEN_MSG = 0x1,
  	MBIM_CLOSE_MSG = 0x2,
--- 
-2.21.0
-
diff --git a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
index 3655b3fd66..c1a2040893 100644
--- a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
+++ b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
@@ -1,4 +1,4 @@
-From 76e4054801350ebd4a44057379431a33d460ad0f Mon Sep 17 00:00:00 2001
+From 0c24d2161fb150cc4a38a9b4c15370b16498c415 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 21 Apr 2021 11:01:34 +0000
 Subject: [PATCH] mbim: Fix build with ell-0.39 by restoring unlikely macro
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-private.h
-index 51693eae..d917312c 100644
+index 51693ea..d917312 100644
 --- a/drivers/mbimmodem/mbim-private.h
 +++ b/drivers/mbimmodem/mbim-private.h
 @@ -30,6 +30,10 @@
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.6.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.4.bb
rename to meta/recipes-connectivity/ofono/ofono_2.6.bb
index dae5cc3c25..7e080ee51a 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.6.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
+SRC_URI[sha256sum] = "dc03fa054db684500f06fa67a23eed955cfd43de3133370ae87ea167a1a173b1"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.44.0


--===============6026135631549563409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-75f8afb9334808cf3cbfb101b680036c667f9430"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:75f8afb9334808cf3cbfb101b680036c667f9430"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 419 Local 405 Mirrors 0 Missed 14 Current 625 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2312 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_recipe_qa)
NOTE: recipe ofono-2.6-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2826 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_fetch)
NOTE: recipe ofono-2.6-r0: task do_fetch: Started
NOTE: recipe ofono-2.6-r0: task do_fetch: Succeeded
NOTE: Running task 2827 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_unpack)
NOTE: Running task 2828 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.6-r0: task do_unpack: Started
NOTE: recipe ofono-2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.6-r0: task do_unpack: Succeeded
NOTE: Running task 2829 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_patch)
NOTE: Running task 2830 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.6-r0: task do_patch: Started
NOTE: recipe ofono-2.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.6-r0: task do_patch: Succeeded
NOTE: Running task 2831 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2832 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_populate_lic)
NOTE: recipe ofono-2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.6-r0: task do_populate_lic: Started
NOTE: recipe ofono-2.6-r0: task do_populate_lic: Succeeded
NOTE: recipe ofono-2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2833 of 2845 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_configure)
NOTE: recipe ofono-2.6-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.64.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/
 systemd_255.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-
 worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'mobile-broadband-provider-info', 'openssl', 'base-files', 'base-passwd', 'dbus', 'ell', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'quilt-native', 'vala', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'wayland-protocols', 'wayland', 'libice', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxkbcommon', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libffi', 
 'libical', 'libpcre2', 'libseccomp', 'sqlite3', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| NOTE: Removing bundled ell from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/ofono-2.6/ell to prevent including it
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/ofono-2.6/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/ofono-2.6/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/share/aclocal/ --force -I build-aux
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
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/ofono-2.6/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/share/aclocal/ --force -I build-aux
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/ofono-2.6/build-aux/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/ofono-2.6/build-aux/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:23: installing 'build-aux/compile'
| configure.ac:8: installing 'build-aux/missing'
| Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/install-sh' is updated
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../ofono-2.6/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot  --enable-test --enable-external-ell --disable-static  --enable-bluetooth --with-systemdunitdir=/usr/lib/systemd/system/
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot/usr/share/x86_64-poky-linux_config_site.d/ncurses_config
| checking for a BSD-compatible install... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking how to create a pax tar archive... gnutar
| checking whether make supports nested variables... (cached) yes
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking for x86_64-poky-linux-pkg-config... no
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot accepts -fsanitize=undefined... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot   option to reload object files... -r
| checking for x86_64-poky-linux-file... no
| checking for file... file
| checking for x86_64-poky-linux-objdump... x86_64-poky-linux-objdump
| checking how to recognize dependent libraries... pass_all
| checking for x86_64-poky-linux-dlltool... no
| checking for dlltool... no
| checking how to associate runtime and link libraries... printf %s\n
| checking for x86_64-poky-linux-ar... x86_64-poky-linux-gcc-ar
| checking for archiver @FILE support... @
| checking for x86_64-poky-linux-strip... (cached) x86_64-poky-linux-strip
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
| checking for x86_64-poky-linux-mt... no
| checking for mt... no
| checking if : is a manifest tool... no
| checking for stdio.h... (cached) yes
| checking for stdlib.h... (cached) yes
| checking for string.h... (cached) yes
| checking for inttypes.h... (cached) yes
| checking for stdint.h... (cached) yes
| checking for strings.h... (cached) yes
| checking for sys/stat.h... (cached) yes
| checking for sys/types.h... (cached) yes
| checking for unistd.h... (cached) yes
| checking for dlfcn.h... yes
| checking for objdir... .libs
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
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
| checking for ell >= 0.65... no
| configure: error: Embedded Linux library >= 0.65 is required
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/temp/run.do_configure.3357086:287 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/temp/run.do_configure.3357086, line 287
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/temp/run.do_configure.3357086, line 263
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/temp/run.do_configure.3357086, line 233
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/temp/run.do_configure.3357086, line 153
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/temp/run.do_configure.3357086, line 291
NOTE: recipe ofono-2.6-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2833 tasks of which 2824 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501051154.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501051154.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ofono-2.6-r0 do_configure: configure failed
ERROR: ofono-2.6-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/temp/run.do_configure.3357086', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.6/temp/log.do_configure.3357086
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.6.bb:do_configure) failed with exit code '1'

--===============6026135631549563409==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.4-2.6.patch"

RnJvbSAzMGY3MjFiMjFkYzgwZDMyMzQwZTNmYjc4ZTJkMTc2MjY5NTExYTJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwNToxMjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9m
b25vOiB1cGdyYWRlIDIuNCAtPiAyLjYKCi0tLQogLi4uLW1iaW0tYWRkLWFuLW9wdGlvbmFsLVRF
TVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoIHwgNSArLS0tLQogLi4uYmltLUZpeC1i
dWlsZC13aXRoLWVsbC0wLjM5LWJ5LXJlc3RvcmluZy11bmxpa2VseS1tLnBhdGNoIHwgNCArKy0t
CiAuLi4vb2Zvbm8ve29mb25vXzIuNC5iYiA9PiBvZm9ub18yLjYuYmJ9ICAgICAgICAgICAgICAg
ICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL3tvZm9ub18yLjQu
YmIgPT4gb2Zvbm9fMi42LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxV
UkVfUkVUUlktbWFjcm8tY29weS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxVUkVfUkVUUlktbWFj
cm8tY29weS5wYXRjaAppbmRleCA4YTVhMzAwYWRjLi45NzZkZjJiYjc3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vLzAwMDEtbWJpbS1hZGQtYW4tb3B0
aW9uYWwtVEVNUF9GQUlMVVJFX1JFVFJZLW1hY3JvLWNvcHkucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby8wMDAxLW1iaW0tYWRkLWFuLW9wdGlvbmFsLVRF
TVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAy
MmI1MmRiNDg0MjYxMWFjMzFhMzU2ZjAyM2ZjMDk1OTUzODRlMmFkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA4Y2M5YTljM2FmZWFlZDI0MzY3MDkyM2Y4NjAxYmVmNDg0ZDEzZTBjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IFRodSwgMjMgTWF5IDIwMTkgMTg6MTE6MjIgLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gbWJpbTogYWRkIGFuIG9wdGlvbmFsIFRFTVBfRkFJTFVSRV9SRVRSWSBtYWNybyBjb3B5CkBA
IC0zMSw2ICszMSwzIEBAIGluZGV4IGUxNTkyMzUuLjUxNjkzZWEgMTAwNjQ0CiAgZW51bSBtYmlt
X2NvbnRyb2xfbWVzc2FnZSB7CiAgCU1CSU1fT1BFTl9NU0cgPSAweDEsCiAgCU1CSU1fQ0xPU0Vf
TVNHID0gMHgyLAotLS0gCi0yLjIxLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vZm9uby9vZm9uby8wMDAyLW1iaW0tRml4LWJ1aWxkLXdpdGgtZWxsLTAuMzktYnkt
cmVzdG9yaW5nLXVubGlrZWx5LW0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vLzAwMDItbWJpbS1GaXgtYnVpbGQtd2l0aC1lbGwtMC4zOS1ieS1yZXN0b3Jpbmct
dW5saWtlbHktbS5wYXRjaAppbmRleCAzNjU1YjNmZDY2Li5jMWEyMDQwODkzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vLzAwMDItbWJpbS1GaXgtYnVp
bGQtd2l0aC1lbGwtMC4zOS1ieS1yZXN0b3JpbmctdW5saWtlbHktbS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vLzAwMDItbWJpbS1GaXgtYnVpbGQtd2l0
aC1lbGwtMC4zOS1ieS1yZXN0b3JpbmctdW5saWtlbHktbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNzZlNDA1NDgwMTM1MGViZDRhNDQwNTczNzk0MzFhMzNkNDYwYWQwZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGMyNGQyMTYxZmIxNTBjYzRhMzhhOWI0YzE1MzcwYjE2NDk4
YzQxNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcnRpbiBKYW5zYSA8TWFydGlu
LkphbnNhQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjEgQXByIDIwMjEgMTE6MDE6MzQgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbWJpbTogRml4IGJ1aWxkIHdpdGggZWxsLTAuMzkgYnkgcmVzdG9y
aW5nIHVubGlrZWx5IG1hY3JvCkBAIC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IE1hcnRp
biBKYW5zYSA8TWFydGluLkphbnNhQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9kcml2ZXJzL21iaW1tb2RlbS9tYmltLXByaXZhdGUu
aCBiL2RyaXZlcnMvbWJpbW1vZGVtL21iaW0tcHJpdmF0ZS5oCi1pbmRleCA1MTY5M2VhZS4uZDkx
NzMxMmMgMTAwNjQ0CitpbmRleCA1MTY5M2VhLi5kOTE3MzEyIDEwMDY0NAogLS0tIGEvZHJpdmVy
cy9tYmltbW9kZW0vbWJpbS1wcml2YXRlLmgKICsrKyBiL2RyaXZlcnMvbWJpbW1vZGVtL21iaW0t
cHJpdmF0ZS5oCiBAQCAtMzAsNiArMzAsMTAgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi40LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vZm9uby9vZm9ub18yLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi42LmJiCmluZGV4IGRhZTVjYzNjMjUu
LjdlMDgwZWU1MWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8v
b2Zvbm9fMi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9f
Mi42LmJiCkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiXAogICAgIGZpbGU6Ly8wMDAxLW1i
aW0tYWRkLWFuLW9wdGlvbmFsLVRFTVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoIFwK
ICAgICBmaWxlOi8vMDAwMi1tYmltLUZpeC1idWlsZC13aXRoLWVsbC0wLjM5LWJ5LXJlc3Rvcmlu
Zy11bmxpa2VseS1tLnBhdGNoIFwKICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MzU4MGFkYzFh
ZmQxODkwZGM1MTZlZmIwNjlkZTBjNWNkZmVmMDE0NDE1MjU2ZGRmYjI4YWIxNzJkZjJkMTFkIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImRjMDNmYTA1NGRiNjg0NTAwZjA2ZmE2N2EyM2VlZDk1NWNm
ZDQzZGUzMTMzMzcwYWU4N2VhMTY3YTFhMTczYjEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZyB1cGRhdGUtcmMuZCBzeXN0ZW1kIGdvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRhCiAKLS0g
CjIuNDQuMAoK

--===============6026135631549563409==--

