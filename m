Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA41CA9EA9
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.107901.1682976352332789911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nWO54SI8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010187d9352dba-5c0587f2-aecb-4df4-9009-8b5b2906fe5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7j/S/UQTDNc5K8bd7ACznFpH6qGehR7Wt6MQ2vLaxEM=;
	b=nWO54SI8cidq9dzxcR10XVWBYT/GZ5jkb1I2EmgdssYG5vao1Bq5+1H4bknjMJa2
	D7/cGIMJJtKyVBLpEgqaTndFNSls4EkhQowFj8Loq45TCT3HS25hD9WXWGI54haPWgU
	56uigxOblSOV5bfx158d4KfRiw2ZEELEUxd26APA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7j/S/UQTDNc5K8bd7ACznFpH6qGehR7Wt6MQ2vLaxEM=;
	b=rfpjD33w1omxKeLL9wWVXU5oo/+15dbnsYRYtdPhLa2Lud0syjaMHGjkPwr57LQc
	nLqAMX92bilgTVV5vxUcFGfwcpVkKhfyhdd1Gk5mdWLdMIUNu52xvHbCfZDJn/34Ods
	FjW3tXlWmeG4BepG7y3VEWDa+4YHVwkbleWu79jk=
Content-Type: multipart/mixed; boundary="===============3740045750796608140=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.22.2 FAILED
Message-ID: <01010187d9352dba-5c0587f2-aecb-4df4-9009-8b5b2906fe5a-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180692

--===============3740045750796608140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-vaapi* to *1.22.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.22.0-1.22.2.patch
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
--===============3740045750796608140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4cb39d2c4204eb40beaa4662d9922f22039da254"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 242 Local 235 Mirrors 0 Missed 7 Current 450 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2317 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_fetch)
NOTE: Running task 2418 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_write_config: Started
NOTE: Running task 2430 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_unpack)
NOTE: Running task 2431 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 2432 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_patch)
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 2433 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2434 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_configure)
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_compile)
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_install)
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_install: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo
 rker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot', '/ho
 me/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/rec
 ipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'systemd', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'libva', 'mesa', 'wayland-protocols', 'wayland', 'libx11', 'libxrandr', 'libxrender', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'wayland-native', 'xtrans', 'xorgproto', 'util-macros', 'libxcb', 'autoconf-archive', 'libxml2', 'glib-2.0', 'gobject-introspection', 'libxext', 're2c-native', 'base-passwd', 'kmod', 'opkg-utils', 'libpam', 'zstd', 'libcap', 'bash-completion', 'shadow-sysroot', 'libseccomp', 'libxkbcommon', 'shadow-native', 'update-rc.d', 'shadow', 'util-linux', 'base-files', 'acl', 'initscripts', 'attr-native', 'libtool-native', 'libusb1', 'pango', 'libwebp', 'orc', 'bluez5', 'vulkan-loader', 'libsndfile1', 'libgudev', 'librsvg', 'cairo', 'bzip2', 'curl', 'openssl', 'sbc', 'libxfixes', 'exp
 at-native', 'libffi-native', 'libxml2-native', 'xrandr', 'libxshmfence', 'vulkan-headers', 'libxxf86vm', 'expat', 'libxdamage', 'zlib', 'python3-build-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-wheel-native', 'gdbm-native', 'readline-native', 'openssl-native', 'util-linux-libuuid-native', 'libtirpc-native', 'sqlite3-native', 'bzip2-native', 'zlib-native', 'libnsl2-native', 'ncurses-native', 'linux-libc-headers', 'libffi', 'libtheora', 'libpng', 'libogg', 'libvorbis', 'libxv', 'libjpeg-turbo', 'alsa-lib', 'libsm', 'iso-codes', 'gettext-minimal-native', 'zstd-native', 'texinfo-dummy-native', 'gmp-native', 'flex-native', 'libmpc-native', 'gnu-config-native', 'mpfr-native', 'binutils-cross-i686', 'glib-2.0-native', 'libpciaccess', 'libpthread-stubs', 'libgcc', 'xcb-proto', 'libxau', 'libxdmcp', 'python3', 'libpcre2', 'xz', 'cracklib', 'libxcrypt', 'xkeyboard-config', 'attr', 'util-linux-libuuid', 'libcap-ng', 'ncurses', 'freetype', 'fribidi', 'fontconfig'
 , 'harfbuzz', 'libxft', 'libical', 'readline', 'dbus', 'flac', 'libstd-rs', 'vala', 'gdk-pixbuf', 'pixman', 'libidn2', 'cmake-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-flit-core-native', 'perl-native', 'libice', 'm4-native', 'util-linux-native', 'libpcre2-native', 'gettext-native', 'gdbm', 'sqlite3', 'libtirpc', 'libnsl2', 'icu', 'shared-mime-info', 'libunistring', 'unzip-native', 'make-native', 'libcap-ng-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_install
| Installing gst/vaapi/libgstvaapi.so to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/image/usr/lib/gstreamer-1.0
| mv: cannot stat '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/image//usr/lib/gstreamer-1.0/pkgconfig/*.pc': No such file or directory
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/temp/run.do_install.623648:154 exit 1 from 'mv /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/image//usr/lib/gstreamer-1.0/pkgconfig/*.pc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/image//usr/lib/pkgconfig'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/temp/run.do_install.623648, line 154
| 	#2: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/temp/run.do_install.623648, line 164
NOTE: recipe gstreamer1.0-vaapi-1.22.2-r0: task do_install: Failed
NOTE: Tasks Summary: Attempted 2437 tasks of which 2427 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: gstreamer1.0-vaapi-1.22.2-r0 do_install: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/temp/run.do_install.623648', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-vaapi/1.22.2-r0/temp/log.do_install.623648
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.2.bb:do_install) failed with exit code '1'

--===============3740045750796608140==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.22.0-1.22.2.patch"

RnJvbSA4OTdmN2NhMGZhMjk5NmM0YjMwNWU0OTcxMGFkNmExMTdmNjdmNTQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMDozMTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC12YWFwaTogdXBncmFkZSAxLjIyLjAgLT4gMS4yMi4yCgotLS0KIC4uLnN0cmVh
bWVyMS4wLXZhYXBpXzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtdmFhcGlfMS4yMi4yLmJifSAoOTYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFh
cGlfMS4yMi4wLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC12YWFwaV8xLjIyLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC12YWFwaV8xLjIyLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtdmFhcGlfMS4yMi4yLmJiCmluZGV4IDhhNzAzZjUzM2UuLmQ1YzkwODFlYjYgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlf
MS4yMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yMi4yLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkcuTElCO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2
YyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjLyR7
UkVBTFBOfS8ke1JFQUxQTn0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NTkzY2NhZDE5Zjg4ZTVmYTI5ZjQwZjk4MzU2YzAwNzgwNmJkNTM1ODI4NzA3YjE0MDY5NDRkMTZh
OTBiZGZmNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkMmU2NDJmOTc0NWY5N2Q5ZjczYTdmNTA4
NWU3NjU5YTlhMzFmZTIwOWI3NzRlNmU0NWRhZTA0MWI0MzVkZjA2IgogCiBTID0gIiR7V09SS0RJ
Un0vJHtSRUFMUE59LSR7UFZ9IgogREVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAgZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiCi0tIAoyLjM5LjIK
Cg==

--===============3740045750796608140==--

