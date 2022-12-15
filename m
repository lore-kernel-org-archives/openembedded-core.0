Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEF3C6379F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.144505.1671136351882171312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iEnEXans;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010185177d18be-f294d0a3-3716-4e76-a596-0f8f51ace0fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=otfuqzN8CbgUoLEXwqgcq7gYU+QQs7AtMphUO1kSF2s=;
	b=iEnEXansN2gJ7waz7727YDpZVNIyio8n8VfCn5Q6WZzf3YtV+B8EkcTEIrmOR059
	ewWqCDOs+3oSpHFCfADSMDshMLpBUxSlw86HsRgIBIVbDZB2oBfUZ3JCps0a/7Usd3V
	EpIOd7TBsWJ8Xtn8Ql8bb3XQeoWb1FD/JgZ28UQw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=otfuqzN8CbgUoLEXwqgcq7gYU+QQs7AtMphUO1kSF2s=;
	b=Vb1lFBeqYFqSt+m+zUpwvMXpZF3JN37n4b7UQbcCE0vTpakDVXuAgdPuk+OUbq1b
	un8O7yAWCRcuOw9G4bn+x5LGXENOa8ItBjw+fI4Zx0KuwW96NlNOzTzdGUmTN7rU40h
	LkdhigDME2po1hzm0+tFzyeneHF00o4VfCDTNokc=
Content-Type: multipart/mixed; boundary="===============5956759692864869769=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 43.0 FAILED
Message-ID: <01010185177d18be-f294d0a3-3716-4e76-a596-0f8f51ace0fa-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174672

--===============5956759692864869769==
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
--===============5956759692864869769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:398ad46ed52d643257b7ab82588a63fef65705e9"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 224 Local 217 Mirrors 0 Missed 7 Current 642 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2632 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_fetch)
NOTE: Running task 2941 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_write_config)
NOTE: recipe epiphany-43.0-r0: task do_fetch: Started
NOTE: recipe epiphany-43.0-r0: task do_fetch: Succeeded
NOTE: Running task 3054 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_unpack)
NOTE: Running task 3055 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-43.0-r0: task do_write_config: Started
NOTE: recipe epiphany-43.0-r0: task do_unpack: Started
NOTE: recipe epiphany-43.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-43.0-r0: task do_unpack: Succeeded
NOTE: Running task 3056 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_patch)
NOTE: recipe epiphany-43.0-r0: task do_patch: Started
NOTE: recipe epiphany-43.0-r0: task do_patch: Succeeded
NOTE: Running task 3057 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3058 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_populate_lic)
NOTE: recipe epiphany-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-43.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-43.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3059 of 3067 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure)
NOTE: recipe epiphany-43.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot'
 , '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysr
 oot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.64.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/p
 oky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr', 'gsettings-desktop-schemas', 'json-glib', 'libdazzle', 'libhandy', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gettext-minimal-native', 'texinfo-dummy-native', 'libtool-native', 'attr-native', 'zlib-native', 'linux-libc-headers', 're2c-native', 'gmp', 'python3-picobuild-native', 'python3-installer-native', 'python3-wheel-native', 'python3-setuptools-native', 'gobject-introspection', 'glib-2.0', 'gtk+3', 'p11-kit', 'hicolor-icon-theme', 'libgcrypt', 'vala', 'shared-mime-info', 'gdk-pixbuf', 'libgcc', 'sqlite3-native', 'ncurses-native', 'openssl-native', 'readline-native', 'gdbm-native', 'libnsl2-native', 'libffi-native', 'util-linux-libuuid-native', 'libtirpc-nat
 ive', 'bzip2-native', 'sqlite3', 'libpsl', 'nghttp2', 'libxml2', 'acl', 'attr', 'zstd', 'zlib', 'opkg-utils', 'xz', 'bzip2', 'wayland', 'gstreamer1.0-plugins-base', 'libsecret', 'systemd', 'wpebackend-fdo', 'libtasn1', 'libwebp', 'libxslt', 'libx11', 'libxcomposite', 'harfbuzz', 'libwpe', 'enchant2', 'libxdamage', 'libxrender', 'libjpeg-turbo', 'mesa', 'cairo', 'libnotify', 'gstreamer1.0', 'libxt', 'at-spi2-core', 'binutils-cross-i686', 'mpfr-native', 'gnu-config-native', 'libmpc-native', 'gmp-native', 'flex-native', 'zstd-native', 'util-linux-native', 'libpcre2-native', 'python3-flit-core-native', 'autoconf-archive', 'libffi', 'python3', 'util-linux', 'libpcre2', 'bash-completion', 'libxcursor', 'libpng', 'libepoxy', 'libxi', 'pango', 'libxkbcommon', 'libxrandr', 'libxfixes', 'wayland-protocols', 'fontconfig', 'libxext', 'libcap', 'libgpg-error', 'perl-native', 'icu', 'expat', 'libtheora', 'libvorbis', 'libxv', 'alsa-lib', 'libogg', 'libdrm', 'orc', 'iso-codes', 'libsm', 'libseccom
 p', 'shadow', 'base-files', 'shadow-sysroot', 'kmod', 'base-passwd', 'libpam', 'update-rc.d', 'initscripts', 'shadow-native', 'xorgproto', 'libxcb', 'xtrans', 'util-macros', 'freetype', 'aspell', 'libxshmfence', 'xrandr', 'vulkan-loader', 'vulkan-headers', 'libxxf86vm', 'pixman', 'dbus', 'libxdmcp', 'libxtst', 'm4-native', 'libcap-ng-native', 'unzip-native', 'openssl', 'util-linux-libuuid', 'libtirpc', 'gdbm', 'ncurses', 'readline', 'libxcrypt', 'libnsl2', 'libcap-ng', 'fribidi', 'libxft', 'xkeyboard-config', 'make-native', 'libpciaccess', 'libpthread-stubs', 'libice', 'cracklib', 'flex', 'libxau', 'xcb-proto']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false -Dlibportal=disabled -Dsoup2=disabled...
| The Meson build system
| Version: 0.64.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/epiphany-43.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/build
| Build type: cross build
| 
| ../epiphany-43.0/meson.build:1:0: ERROR: Unknown options: "libportal, soup2"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.1409329:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.1409329, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.1409329, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.1409329, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.1409329, line 187
NOTE: recipe epiphany-43.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3059 tasks of which 3051 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-43.0-r0 do_configure: meson failed
ERROR: epiphany-43.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.1409329', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/log.do_configure.1409329
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure) failed with exit code '1'

--===============5956759692864869769==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-42.4-43.0.patch"

RnJvbSBlOTUwZjJlNmViNjhmYmFjYzViZjJjMDZjMzgzOTk4ZDRkYjE4ODc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTQ6NDM6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0Mi40IC0+IDQzLjAKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80Mi40LmJiID0+IGVwaXBoYW55XzQzLjAuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80Mi40LmJiID0+IGVwaXBoYW55XzQzLjAuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55
XzQyLjQuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDMuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNDIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzQzLjAuYmIKaW5kZXggYWZhYWVmYzQ2Zi4uZDQ1ZmUxM2YyNCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQyLjQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQzLjAuYmIKQEAgLTI4LDcgKzI4LDcg
QEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmlt
X3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMzcwOTM4YWQyOTIwZWViMjhiYzI0MzU5
NDQ3NzZiN2JhNTVhMGUyZWRlNjU4MzZmNzk4MThjZmI3ZThmMDg2MCIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gImI2NmQ0OTlmOWVlNzI2OTZkODNjZjg0NDEyNTM3NzE4MWE5NTQ1NTRh
NGJiMzc4NWI3MzI5MzM4MGFjMGMyMjciCiAKIFBBQ0tBR0VDT05GSUdfU09VUCA/PSAic291cDMi
CiBQQUNLQUdFQ09ORklHID8/PSAiJHtQQUNLQUdFQ09ORklHX1NPVVB9IgotLSAKMi4zNy4zCgo=

--===============5956759692864869769==--

