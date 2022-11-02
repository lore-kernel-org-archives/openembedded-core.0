Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D9AC6377C
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.857.1667349632317853745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=krF/QICG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c85d4b-e649bda0-5703-454a-8c21-834970658c09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0GQmcfFBJElyHRrsJSATFgGPyVYHvGKP2xTDyOpomUw=;
	b=krF/QICG7m79ehzErMvWlGRgT8r0axvQxx0hdkiiC84MluF12yUdeAIg7OC8zFtA
	lEdl0MEPJYltWjk+DybYhtcnF01X68WDLwb0RRvT3kIpRDaH4VqZpc4aYlAkPq52R83
	WBrqPmnvkdTT1un/Sc5TPe1TWjztY3UpQJqwKsvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0GQmcfFBJElyHRrsJSATFgGPyVYHvGKP2xTDyOpomUw=;
	b=YgH5PqTuTlIwApCs0lFHuILJBOUjvxAGhMKEYWylb0vp8GxEYEj/sEl8NNUbXrIe
	FkiGwdSbPHR0RI25Z42opNrmbKjP/biCYm9PzlJcUev1SeYKdr5qme4tdQ/J24Z4F8C
	f4tIbYjPzt6ziCuSGU3n8w1cAC/snArvMQvxLKBg=
Content-Type: multipart/mixed; boundary="===============2266025582180458832=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 43.0 FAILED
Message-ID: <0101018435c85d4b-e649bda0-5703-454a-8c21-834970658c09-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172457

--===============2266025582180458832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *43.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-42.4-43.0.patch
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
--===============2266025582180458832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d74a7563e99db797b92a4c738a046bc5d36a03b7"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 205 Local 198 Mirrors 0 Missed 7 Current 670 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2676 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_fetch)
NOTE: Running task 2984 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_write_config)
NOTE: recipe epiphany-43.0-r0: task do_fetch: Started
NOTE: recipe epiphany-43.0-r0: task do_fetch: Succeeded
NOTE: Running task 3097 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_unpack)
NOTE: Running task 3098 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-43.0-r0: task do_write_config: Started
NOTE: recipe epiphany-43.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_unpack: Started
NOTE: recipe epiphany-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-43.0-r0: task do_unpack: Succeeded
NOTE: Running task 3099 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_patch)
NOTE: recipe epiphany-43.0-r0: task do_patch: Started
NOTE: recipe epiphany-43.0-r0: task do_patch: Succeeded
NOTE: Running task 3100 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3101 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_populate_lic)
NOTE: recipe epiphany-43.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3102 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure)
NOTE: recipe epiphany-43.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot'
 , '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.6.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate
 _sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/buil
 d/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr', 'gsettings-desktop-schemas', 'json-glib', 'libdazzle', 'libhandy', 'webkitgtk', 'libsoup-2.4', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 're2c-native', 'vala', 'glib-2.0', 'gobject-introspection', 'gtk+3', 'linux-libc-headers', 'libgcc', 'readline-native', 'libtool-native', 'gdbm-native', 'libffi-native', 'ncurses-native', 'util-linux-libuuid-native', 'bzip2-native', 'sqlite3-native', 'libtirpc-native', 'zlib-native', 'libnsl2-native', 'openssl-native', 'gettext-minimal-native', 'libpcre-native', 'util-linux-native', 'acl', 'bzip2', 'attr', 'zstd', 'zlib', 'xz', 'opkg-utils', 'texinfo-dummy-native', 'attr-native', 'binutils-cross-i686', 'libmpc-native', 'gnu-config-native', 'flex-nati
 ve', 'gmp-native', 'mpfr-native', 'zstd-native', 'gmp', 'wpebackend-fdo', 'harfbuzz', 'libx11', 'wayland', 'libwebp', 'gstreamer1.0-plugins-base', 'cairo', 'mesa', 'libxdamage', 'libwpe', 'libxslt', 'libtasn1', 'libsecret', 'systemd', 'atk', 'libxrender', 'libnotify', 'gstreamer1.0', 'libxt', 'enchant2', 'libjpeg-turbo', 'libxcomposite', 'python3-installer-native', 'python3-picobuild-native', 'python3-wheel-native', 'python3-setuptools-native', 'libpsl', 'sqlite3', 'libxml2', 'libgcrypt', 'gdk-pixbuf', 'hicolor-icon-theme', 'p11-kit', 'shared-mime-info', 'libpcre', 'bash-completion', 'libffi', 'util-linux', 'python3', 'autoconf-archive', 'libxi', 'libxcursor', 'libxfixes', 'libepoxy', 'fontconfig', 'libxkbcommon', 'libxext', 'at-spi2-atk', 'libxrandr', 'libpng', 'pango', 'wayland-protocols', 'perl-native', 'libcap-ng-native', 'libpcre2-native', 'm4-native', 'freetype', 'icu', 'util-macros', 'xorgproto', 'xtrans', 'libxcb', 'expat', 'orc', 'libogg', 'libsm', 'libxv', 'libtheora', 'li
 bvorbis', 'iso-codes', 'libdrm', 'alsa-lib', 'pixman', 'vulkan-headers', 'vulkan-loader', 'libxshmfence', 'libxxf86vm', 'xrandr', 'base-files', 'update-rc.d', 'initscripts', 'shadow-native', 'kmod', 'libcap', 'libpam', 'shadow', 'libseccomp', 'shadow-sysroot', 'base-passwd', 'dbus', 'libxdmcp', 'aspell', 'python3-flit-core-native', 'libgpg-error', 'ncurses', 'libxcrypt', 'libcap-ng', 'util-linux-libuuid', 'openssl', 'gdbm', 'libnsl2', 'libtirpc', 'readline', 'xkeyboard-config', 'at-spi2-core', 'libxft', 'fribidi', 'make-native', 'libxau', 'xcb-proto', 'libpthread-stubs', 'libice', 'libpciaccess', 'cracklib', 'flex', 'unzip-native', 'libxtst']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false -Dlibportal=disabled -Dsoup2=enabled...
| The Meson build system
| Version: 0.63.3
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/epiphany-43.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/build
| Build type: cross build
| 
| ../epiphany-43.0/meson.build:1:0: ERROR: Unknown options: "libportal, soup2"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.3145189:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.3145189, line 175
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.3145189, line 164
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.3145189, line 150
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.3145189, line 188
NOTE: recipe epiphany-43.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3102 tasks of which 3094 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: epiphany-43.0-r0 do_configure: meson failed
ERROR: epiphany-43.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.3145189', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/log.do_configure.3145189
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure) failed with exit code '1'

--===============2266025582180458832==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-42.4-43.0.patch"

RnJvbSA2NzY3YjhmZDZmNmNkNDNlNGRlZjkyYWEzM2ExYmQyOWRhMGVhN2NmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNDoxNzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQyLjQgLT4gNDMuMAoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQyLjQuYmIgPT4gZXBpcGhhbnlfNDMuMC5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkve2VwaXBoYW55XzQyLjQuYmIgPT4gZXBpcGhhbnlfNDMuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlf
NDIuNC5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80My4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFu
eS9lcGlwaGFueV80Mi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZXBpcGhhbnlfNDMuMC5iYgppbmRleCA5ZWZkMjgwMGRhLi5jZjBlMGNjN2RlIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDIuNC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDMuMC5iYgpAQCAtMjgsNyArMjgsNyBA
QCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1f
dmVyc2lvbigiJHtQVn0iLCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIzNzA5MzhhZDI5MjBlZWIyOGJjMjQzNTk0
NDc3NmI3YmE1NWEwZTJlZGU2NTgzNmY3OTgxOGNmYjdlOGYwODYwIgorU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiYjY2ZDQ5OWY5ZWU3MjY5NmQ4M2NmODQ0MTI1Mzc3MTgxYTk1NDU1NGE0
YmIzNzg1YjczMjkzMzgwYWMwYzIyNyIKIAogUEFDS0FHRUNPTkZJR19TT1VQID89ICJzb3VwMiIK
IFBBQ0tBR0VDT05GSUcgPz89ICIke1BBQ0tBR0VDT05GSUdfU09VUH0iCi0tIAoyLjMxLjEKCg==

--===============2266025582180458832==--

