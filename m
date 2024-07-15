Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44E4C54739
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1292.1721071145192688341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Z7hv58E+;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0B5Yblys;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d58d59-3aa09458-3a3e-4526-820e-0aaf31e0f1e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+uFUFYS98B0Kbeh8IavGZqu7GevnUpeFjkEMjemwTAk=;
	b=Z7hv58E+zcZoG50508xV0yxYQa+E7+0cBbm/cxdU7vuv4kCt4OMjNCvHQXRDkmXW
	6ATUQU7fRcRt0LzJRvPh6FiJUAWAgvIv2fYEg+Pa+Fu//Lr4QIhEDZ1pfIZOA861FJN
	bHRLBD6ylhfm2bEsyvtmxGr9Xq2Ny+Eize5DZOnw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+uFUFYS98B0Kbeh8IavGZqu7GevnUpeFjkEMjemwTAk=;
	b=0B5YblyspYZ5MinQ18X3YECl99IeSPjp2CSb0eFodbq+wnujdFmeFKR66w8fsyke
	8WWql5QgaFq2x8I9R0Ca6u9Dw/ADCHvVldvXbze+areh7lDbf2EED3m5DRO9GoFfX/q
	rOEJ5y7IDOq3IeSS541dS0Sp3ZaAw7JTsbhbVDhg=
Content-Type: multipart/mixed; boundary="===============8363420607703427662=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.9 FAILED
Message-ID: <01010190b7d58d59-3aa09458-3a3e-4526-820e-0aaf31e0f1e4-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201945

--===============8363420607703427662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ofono* to *2.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.8-2.9.patch
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
From 11d6cc53863da6c5cc79731a9d47c46ab870eb6c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 07:47:02 +0000
Subject: [PATCH] ofono: upgrade 2.8 -> 2.9

---
 meta/recipes-connectivity/ofono/{ofono_2.8.bb => ofono_2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.8.bb => ofono_2.9.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.8.bb b/meta/recipes-connectivity/ofono/ofono_2.9.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.8.bb
rename to meta/recipes-connectivity/ofono/ofono_2.9.bb
index 809485d421..26cb9bb7ff 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.8.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
+SRC_URI[sha256sum] = "9d2612925a23a7fb668f297a044b5ea136215cc399ecc3f127135c8f2a9845f9"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.44.0


--===============8363420607703427662==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.8-2.9.patch"

RnJvbSAxMWQ2Y2M1Mzg2M2RhNmM1Y2M3OTczMWE5ZDQ3YzQ2YWI4NzBlYjZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMDc6NDc6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAyLjggLT4gMi45CgotLS0KIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b2Zvbm8ve29mb25vXzIuOC5iYiA9PiBvZm9ub18yLjkuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9vZm9uby97b2Zvbm9fMi44LmJiID0+IG9mb25vXzIuOS5iYn0gKDk1JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuOC5iYiBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi45LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zv
bm9fMi44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25v
XzIuOS5iYgppbmRleCA4MDk0ODVkNDIxLi4yNmNiOWJiN2ZmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuOS5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJ
ID0gIlwKICAgICAke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L25ldHdvcmsvJHtCUE59LyR7QlB9
LnRhci54eiBcCiAgICAgZmlsZTovL29mb25vIFwKICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJi
NWFlZjQ1NWIzYTM3NGNlNDNiYWQ0M2MyYWRlOWQwNDMwZDljMGQyODk1MjM4NWM0NGFjN2QwZGM5
MzNiYmI4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlkMjYxMjkyNWEyM2E3ZmI2NjhmMjk3YTA0
NGI1ZWExMzYyMTVjYzM5OWVjYzNmMTI3MTM1YzhmMmE5ODQ1ZjkiCiAKIGluaGVyaXQgYXV0b3Rv
b2xzIHBrZ2NvbmZpZyB1cGRhdGUtcmMuZCBzeXN0ZW1kIGdvYmplY3QtaW50cm9zcGVjdGlvbi1k
YXRhCiAKLS0gCjIuNDQuMAoK

--===============8363420607703427662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-633c6b79184113aa8ee04b2df5705f681dd3f198"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:633c6b79184113aa8ee04b2df5705f681dd3f198"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 557 Local 543 Mirrors 0 Missed 14 Current 519 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2408 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_recipe_qa)
NOTE: recipe ofono-2.9-r0: task do_recipe_qa: Started
NOTE: recipe ofono-2.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2921 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_fetch)
NOTE: recipe ofono-2.9-r0: task do_fetch: Started
NOTE: recipe ofono-2.9-r0: task do_fetch: Succeeded
NOTE: Running task 2922 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_unpack)
NOTE: Running task 2923 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.9-r0: task do_unpack: Started
NOTE: recipe ofono-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2924 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_patch)
NOTE: Running task 2925 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.9-r0: task do_patch: Started
NOTE: recipe ofono-2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2926 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2927 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_populate_lic)
NOTE: recipe ofono-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.9-r0: task do_populate_lic: Started
NOTE: recipe ofono-2.9-r0: task do_populate_lic: Succeeded
NOTE: recipe ofono-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2928 of 2940 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_configure)
NOTE: recipe ofono-2.9-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.66.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/
 systemd_256.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wo
 rker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'mobile-broadband-provider-info', 'openssl', 'base-files', 'base-passwd', 'dbus', 'ell', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd-systemctl-native', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-cross', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'quilt-native', 'vala', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'wayland-protocols', 'wayland', 'libice', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxkbcommon', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'acl', 'attr', 'bash-completion', 'gdbm', 'icu', 'libcap-ng', 'libcap', 'libffi', 
 'libical', 'libpcre2', 'libseccomp', 'shared-mime-info', 'sqlite3', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.16.5
| Copyright (C) 2021 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.16
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/share/aclocal-1.16" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/ofono-2.9/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/share/aclocal/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/ofono-2.9/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/share/aclocal/ --force -I build-aux
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
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot/usr/share/aclocal/ --automake-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/share/aclocal-1.16 -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/ofono-2.9/build-aux/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/share/aclocal/ --force -I build-aux
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/bin/autoconf --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/ofono-2.9/build-aux/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/bin/autoheader --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/ofono-2.9/build-aux/ --include=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/share/aclocal/ --force
| autoreconf: running: automake --add-missing --copy --force-missing
| configure.ac:23: installing 'build-aux/compile'
| configure.ac:8: installing 'build-aux/missing'
| Makefile.am: installing 'build-aux/depcomp'
| autoreconf: 'build-aux/install-sh' is updated
| autoreconf: 'build-aux/config.sub' is updated
| autoreconf: 'build-aux/config.guess' is updated
| autoreconf: Leaving directory '.'
| NOTE: Running ../ofono-2.9/configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking  --enable-test --enable-external-ell --disable-static  --enable-bluetooth --with-systemdunitdir=/usr/lib/systemd/system/
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/endian-little
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common-glibc
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/x86_64-linux
| configure: loading site script /home/pokybuild/yocto-worker/auh/build/meta/site/common
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
| checking for pkg-config... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot-native/usr/bin/pkg-config
| configure: WARNING: using cross tools not prefixed with host triplet
| checking pkg-config is at least version 0.9.0... yes
| checking whether make supports the include directive... yes (GNU style)
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot option to enable C11 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot understands -c and -o together... yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot... none
| checking for C/C++ restrict keyword... __restrict__
| checking for x86_64-poky-linux-gcc... (cached) x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot
| checking whether the compiler supports GNU C... (cached) yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot accepts -g... (cached) yes
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot option to enable C11 features... (cached) none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot understands -c and -o together... (cached) yes
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot... (cached) none
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot accepts -fPIE... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot accepts -fsanitize=address... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot accepts -fsanitize=leak... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot accepts -fsanitize=undefined... yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| checking how to print strings... printf
| checking for a sed that does not truncate output... (cached) sed
| checking for grep that handles long lines and -e... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep
| checking for egrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking for fgrep... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -F
| checking for ld used by x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot... x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot
| checking if the linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot  ) is GNU ld... yes
| checking for BSD- or MS-compatible name lister (nm)... x86_64-poky-linux-gcc-nm
| checking the name lister (x86_64-poky-linux-gcc-nm) interface... BSD nm
| checking whether ln -s works... yes
| checking the maximum length of command line arguments... 1572864
| checking how to convert x86_64-pc-linux-gnu file names to x86_64-poky-linux-gnu format... func_convert_file_noop
| checking how to convert x86_64-pc-linux-gnu file names to toolchain format... func_convert_file_noop
| checking for x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot   option to reload object files... -r
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
| checking command to parse x86_64-poky-linux-gcc-nm output from x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot object... ok
| checking for sysroot... /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot
| checking for a working dd... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd
| checking how to truncate binary pipes... /home/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/dd bs=4096 count=1
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
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot supports -fno-rtti -fno-exceptions... no
| checking for x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot option to produce PIC... -fPIC -DPIC
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot PIC flag -fPIC -DPIC works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot static flag -static works... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot supports -c -o file.o... yes
| checking if x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot supports -c -o file.o... (cached) yes
| checking whether the x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot linker (x86_64-poky-linux-ld --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/recipe-sysroot   -m elf_x86_64) supports shared libraries... yes
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
| checking for ell >= 0.67... no
| configure: error: Embedded Linux library >= 0.67 is required
| NOTE: The following config.log files may provide further information.
| NOTE: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/build/config.log
| ERROR: configure failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/run.do_configure.3145646:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/run.do_configure.3145646, line 285
| 	#2: oe_runconf, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/run.do_configure.3145646, line 261
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/run.do_configure.3145646, line 231
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/run.do_configure.3145646, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/run.do_configure.3145646, line 289
NOTE: recipe ofono-2.9-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2928 tasks of which 2919 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715074639.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715074639.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ofono-2.9-r0 do_configure: configure failed
ERROR: ofono-2.9-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/run.do_configure.3145646', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ofono/2.9/temp/log.do_configure.3145646
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.9.bb:do_configure) failed with exit code '1'

--===============8363420607703427662==--

