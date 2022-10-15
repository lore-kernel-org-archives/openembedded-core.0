Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF39BC47090
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.24355.1665871393730512591
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WXyldCrv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010183ddac389b-38b16f71-07aa-4b49-ad4e-31bd3d7dd597-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u5IChebdl7puC345GZ7/YTE+RVrGqogUPomW6lPy3u8=;
	b=WXyldCrvKNs0ls7T5Egs37TUsYn4jUcXYsvNfqEm/isqlz0yvc4FQ4lDCCOawpDe
	ktCcHyUrJJilY6G9n4TuZ4Kp6zknDR3SXoGGSMvzlQOkZAz7CQ6TnQVB7Mt4+ZwrtkL
	Qd/hWMMI6aYAjAc8zznIfL8YqdCB2DL41USxXd78=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u5IChebdl7puC345GZ7/YTE+RVrGqogUPomW6lPy3u8=;
	b=emMaf4WrGoES3JWPbC2wS18AtkgDGRLdGc4nhETiBxhd4nJx5/9H4UPXihE5AGEW
	YWrjU6BgFZypPI8a8Us6U7EttaPSJ0N6eYxLlZ1tEHUox8LhmE5WjLo/7mISJwEm8tx
	umQPDhqRPl8vkAdyuTzjdM5JU3/6Ww35c8d7SykY=
Content-Type: multipart/mixed; boundary="===============4294743095047633420=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 43.0 FAILED
Message-ID: <01010183ddac389b-38b16f71-07aa-4b49-ad4e-31bd3d7dd597-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171826

--===============4294743095047633420==
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
--===============4294743095047633420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:60deb5bdd1cb2b35f76cae4fb5b4994affe1bd09"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 215 Local 208 Mirrors 0 Missed 7 Current 660 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2676 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_fetch)
NOTE: Running task 2984 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_write_config)
NOTE: recipe epiphany-43.0-r0: task do_fetch: Started
NOTE: recipe epiphany-43.0-r0: task do_fetch: Succeeded
NOTE: Running task 3097 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_unpack)
NOTE: Running task 3098 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-43.0-r0: task do_write_config: Started
NOTE: recipe epiphany-43.0-r0: task do_unpack: Started
NOTE: recipe epiphany-43.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-43.0-r0: task do_unpack: Succeeded
NOTE: Running task 3099 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_patch)
NOTE: recipe epiphany-43.0-r0: task do_patch: Started
NOTE: recipe epiphany-43.0-r0: task do_patch: Succeeded
NOTE: Running task 3100 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3101 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_populate_lic)
NOTE: recipe epiphany-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-43.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3102 of 3110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure)
NOTE: recipe epiphany-43.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.40.0.bb:do_populate_sysroot'
 , '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_42.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.6.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate
 _sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/buil
 d/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr', 'gsettings-desktop-schemas', 'json-glib', 'libdazzle', 'libhandy', 'webkitgtk', 'libsoup-2.4', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gettext-minimal-native', 'texinfo-dummy-native', 'libtool-native', 'bzip2', 'attr', 'acl', 'zlib', 'xz', 'opkg-utils', 'zstd', 'python3-picobuild-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-installer-native', 'gobject-introspection', 'vala', 'gtk+3', 'glib-2.0', 'zlib-native', 'gmp', 'attr-native', 're2c-native', 'libmpc-native', 'gnu-config-native', 'binutils-cross-i686', 'gmp-native', 'linux-libc-headers', 'mpfr-native', 'flex-native', 'zstd-native', 'libgcc', 'p11-kit', 'hicolor-icon-theme', 'libgcrypt', 'shared-mime-in
 fo', 'gdk-pixbuf', 'libpsl', 'sqlite3', 'libxml2', 'libnsl2-native', 'readline-native', 'sqlite3-native', 'openssl-native', 'libffi-native', 'util-linux-libuuid-native', 'ncurses-native', 'libtirpc-native', 'gdbm-native', 'bzip2-native', 'util-linux-native', 'libpcre-native', 'libwebp', 'libxdamage', 'gstreamer1.0', 'libnotify', 'libx11', 'mesa', 'enchant2', 'wayland', 'libxcomposite', 'harfbuzz', 'libtasn1', 'libxrender', 'libxslt', 'gstreamer1.0-plugins-base', 'libsecret', 'libwpe', 'systemd', 'cairo', 'wpebackend-fdo', 'libjpeg-turbo', 'libxt', 'atk', 'python3-flit-core-native', 'python3', 'autoconf-archive', 'libffi', 'libxrandr', 'libxkbcommon', 'libxext', 'libpng', 'wayland-protocols', 'libxcursor', 'pango', 'libxfixes', 'fontconfig', 'libepoxy', 'at-spi2-atk', 'libxi', 'bash-completion', 'libpcre', 'util-linux', 'm4-native', 'libcap', 'libgpg-error', 'icu', 'perl-native', 'libpcre2-native', 'libcap-ng-native', 'util-macros', 'xorgproto', 'dbus', 'libxcb', 'xtrans', 'expat', '
 libxshmfence', 'libdrm', 'vulkan-headers', 'libxxf86vm', 'vulkan-loader', 'xrandr', 'aspell', 'freetype', 'iso-codes', 'libtheora', 'libogg', 'libxv', 'orc', 'libvorbis', 'libsm', 'alsa-lib', 'libseccomp', 'kmod', 'base-files', 'shadow-native', 'update-rc.d', 'initscripts', 'libpam', 'shadow-sysroot', 'shadow', 'base-passwd', 'pixman', 'libxdmcp', 'unzip-native', 'libtirpc', 'libnsl2', 'ncurses', 'openssl', 'gdbm', 'util-linux-libuuid', 'readline', 'libxcrypt', 'xkeyboard-config', 'fribidi', 'libxft', 'at-spi2-core', 'libcap-ng', 'make-native', 'libpthread-stubs', 'xcb-proto', 'libxau', 'libpciaccess', 'libice', 'cracklib', 'flex', 'libxtst']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false -Dlibportal=disabled -Dsoup2=enabled...
| The Meson build system
| Version: 0.63.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/epiphany-43.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/build
| Build type: cross build
| 
| ../epiphany-43.0/meson.build:1:0: ERROR: Unknown options: "libportal, soup2"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2889033:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2889033, line 175
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2889033, line 164
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2889033, line 150
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2889033, line 188
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
ERROR: epiphany-43.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2889033', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/log.do_configure.2889033
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure) failed with exit code '1'

--===============4294743095047633420==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-42.4-43.0.patch"

RnJvbSA4Yzg0ZWZiM2RiODMzNjI1ODhkNjA3NDgwZGQyMzhjMWEwOTdhOWYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTQ6NTg6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0Mi40IC0+IDQzLjAKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80Mi40LmJiID0+IGVwaXBoYW55XzQzLjAuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80Mi40LmJiID0+IGVwaXBoYW55XzQzLjAuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55
XzQyLjQuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDMuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNDIuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzQzLjAuYmIKaW5kZXggOWVmZDI4MDBkYS4uY2YwZTBjYzdkZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQyLjQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQzLjAuYmIKQEAgLTI4LDcgKzI4LDcg
QEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmlt
X3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMzcwOTM4YWQyOTIwZWViMjhiYzI0MzU5
NDQ3NzZiN2JhNTVhMGUyZWRlNjU4MzZmNzk4MThjZmI3ZThmMDg2MCIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gImI2NmQ0OTlmOWVlNzI2OTZkODNjZjg0NDEyNTM3NzE4MWE5NTQ1NTRh
NGJiMzc4NWI3MzI5MzM4MGFjMGMyMjciCiAKIFBBQ0tBR0VDT05GSUdfU09VUCA/PSAic291cDIi
CiBQQUNLQUdFQ09ORklHID8/PSAiJHtQQUNLQUdFQ09ORklHX1NPVVB9IgotLSAKMi4zMS4xCgo=

--===============4294743095047633420==--

