Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42F3C77B76
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.32149.1680384537056653530
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WZ40Lee/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101873eb92f46-c179e9e1-7c26-4b69-98f3-4f7c3e7040f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q9av58twExZS6ssE1Wibm0deQvD3PWgtWeni11UqXCI=;
	b=WZ40Lee/z/VZwvRpQZ/MvMFEUSNHnn+hBYTsBPUbF+TCZXkDaa96JbLO+ixJhTUi
	THmWQsBY8ePCiEaFoUgbB+Hw/X47lWEhm8paHR60VBJgao/eix73qgnKC0tkyozBpcU
	mOnRGQgSK95d/5LNfhjKGC6C8cgHqZiRDBFCzGN0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q9av58twExZS6ssE1Wibm0deQvD3PWgtWeni11UqXCI=;
	b=lLFpVzZdhOSX/sCnoD2HIbY4/nQ3UvE/DZoUDHG6Y861/KFN9FeKQHprRz7zI0g0
	m5ZmRORP7+OYO3rpV9CYuMB9PBO3stU9KxPMcmBGVEquWlkXS6YdNG8eptGC/oqy3f0
	v/bi95MOrDXZZXPkYktAXBguwYAo+nNDCQYB5nKU=
Content-Type: multipart/mixed; boundary="===============9187240566679127187=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.22.1 FAILED
Message-ID: <010101873eb92f46-c179e9e1-7c26-4b69-98f3-4f7c3e7040f0-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179565

--===============9187240566679127187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.22.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.22.0-1.22.1.patch
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
--===============9187240566679127187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1796 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1796 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-4d0543f76ed6e714bb99354881246d3d3b8b21dc"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d0543f76ed6e714bb99354881246d3d3b8b21dc"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 254 Local 247 Mirrors 0 Missed 7 Current 438 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2317 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_fetch)
NOTE: Running task 2418 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_fetch: Succeeded
NOTE: Running task 2430 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_unpack)
NOTE: Running task 2431 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_unpack: Succeeded
NOTE: Running task 2432 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_patch: Succeeded
NOTE: Running task 2433 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2434 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo
 rker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot', '/ho
 me/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/rec
 ipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'systemd', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'libva', 'mesa', 'wayland-protocols', 'wayland', 'libx11', 'libxrandr', 'libxrender', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'wayland-native', 'linux-libc-headers', 'libxfixes', 'libxext', 'libgcc', 'gettext-minimal-native', 'libtool-native', 'glib-2.0-native', 'zlib-native', 're2c-native', 'openssl-native', 'libffi-native', 'libnsl2-native', 'util-linux-libuuid-native', 'bzip2-native', 'sqlite3-native', 'libtirpc-native', 'ncurses-native', 'readline-native', 'gdbm-native', 'libtheora', 'libxv', 'orc', 'alsa-lib', 'libsm', 'zlib', 'gobject-introspection', 'libpng', 'pango', 'libogg', 'libvorbis', 'util-linux', 'iso-codes', 'libjpeg-turbo', 'glib-2.0', 'libxml2', 'libffi', 'expat', 'xorgproto', 'vu
 lkan-loader', 'libxxf86vm', 'libxshmfence', 'vulkan-headers', 'libxdamage', 'xrandr', 'libxml2-native', 'expat-native', 'libpthread-stubs', 'libpciaccess', 'util-macros', 'autoconf-archive', 'libxcb', 'xtrans', 'update-rc.d', 'initscripts', 'base-passwd', 'shadow-native', 'libseccomp', 'libxkbcommon', 'libcap', 'shadow', 'acl', 'shadow-sysroot', 'libpam', 'kmod', 'zstd', 'base-files', 'opkg-utils', 'bash-completion', 'libsndfile1', 'bluez5', 'cairo', 'sbc', 'libwebp', 'bzip2', 'librsvg', 'libusb1', 'openssl', 'curl', 'libgudev', 'attr-native', 'python3-build-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-wheel-native', 'gmp-native', 'gnu-config-native', 'flex-native', 'mpfr-native', 'texinfo-dummy-native', 'libmpc-native', 'zstd-native', 'binutils-cross-i686', 'util-linux-native', 'libpcre2-native', 'gettext-native', 'perl-native', 'libice', 'python3', 'libxft', 'fribidi', 'freetype', 'fontconfig', 'harfbuzz', 'util-linux-libuuid', 'ncurses', 'libxcrypt',
  'libcap-ng', 'libpcre2', 'cmake-native', 'libxau', 'libxdmcp', 'xcb-proto', 'xkeyboard-config', 'attr', 'cracklib', 'xz', 'flac', 'libical', 'dbus', 'readline', 'pixman', 'libstd-rs', 'vala', 'gdk-pixbuf', 'libidn2', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'm4-native', 'libcap-ng-native', 'make-native', 'libtirpc', 'sqlite3', 'gdbm', 'libnsl2', 'icu', 'shared-mime-info', 'libunistring', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| Installing gst/vaapi/libgstvaapi.so to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/image/usr/lib/gstreamer-1.0
| mv: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/image//usr/lib/gstreamer-1.0/pkgconfig/*.pc': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/run.do_install.3632353:154 exit 1 from 'mv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/image//usr/lib/gstreamer-1.0/pkgconfig/*.pc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/image//usr/lib/pkgconfig'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/run.do_install.3632353, line 154
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/run.do_install.3632353, line 164
NOTE: recipe gstreamer1.0-vaapi-1.22.1-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 2437 tasks of which 2427 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gstreamer1.0-vaapi-1.22.1-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/run.do_install.3632353', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.1-r0/temp/log.do_install.3632353
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.1.bb:do_install) failed with exit code '1'

--===============9187240566679127187==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.22.0-1.22.1.patch"

RnJvbSAyNmJhNWE3NmQ4MTFmZjQ2MzNiMWIxZDJlOTQxYWJiOTM4ZmEwYjc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxOTo0NzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC12YWFwaTogdXBncmFkZSAxLjIyLjAgLT4gMS4yMi4xCgotLS0KIC4uLnN0cmVh
bWVyMS4wLXZhYXBpXzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4xLmJifSAoOTYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFh
cGlfMS4yMi4wLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC12YWFwaV8xLjIyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12YWFwaV8xLjIyLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtdmFhcGlfMS4yMi4xLmJiCmluZGV4IDhhNzAzZjUzM2UuLjk3YmY5MzQ4MjEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlf
MS4yMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMi4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7
UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NTkzY2NhZDE5Zjg4ZTVmYTI5ZjQwZjk4MzU2YzAwNzgwNmJkNTM1ODI4NzA3YjE0MDY5NDRkMTZh
OTBiZGZmNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MjNiNTdkYjdmYzVmOTEzN2RhZGYxN2Ni
Mzg1M2E0NzQzOGQ2M2NkNGJhNjg4OWE4ODJlNjNmYjViZTk5N2JjIgogCiBTID0gIiR7V09SS0RJ
Un0vJHtSRUFMUE59LSR7UFZ9IgogREVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAgZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiCi0tIAoyLjM5LjIK
Cg==

--===============9187240566679127187==--

