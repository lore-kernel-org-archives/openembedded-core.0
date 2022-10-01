Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5ECC47089
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.347.1664643227316354873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UF19CLxD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101839477e073-d36090cf-ca9a-489a-9d14-ca1cdacebd59-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wv/scVv8GaTpuDETOcMUkgvClBwJ0E/NH4R3/1cthFk=;
	b=UF19CLxDCttBTthAK1teIioSzEcvKakhlTVedJlX2t6DudAwUn6rBQhGSipQUIIw
	IUR3Ig+dzVlyGh8AKgWK5K+VcMAqlbR6kBnwbq3Ko+Q6+nXHNbgEptjTf8FhAUmv9s6
	gV7Wt4KZ1vxDXoSSlgI2psawtAxylfXZ30hlBJQM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wv/scVv8GaTpuDETOcMUkgvClBwJ0E/NH4R3/1cthFk=;
	b=BYnzLlOFxF4oN4yL4EMfKg5fDQTf/K5pmZ/kVAIdlZBGUo+WDfkU/ZoLDbguW9Bt
	+BgAWqg9GnVBnzpfilSsZ1bJRh2dRDO/Uvom9gUAeJzbvGQf1MHPybpkf+6vDQ9iPf1
	jtcJeiaFvzyrrUCo5Tz4itGvEBSR9aJ10oPkSFa8=
Content-Type: multipart/mixed; boundary="===============6892113027050971248=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 43.0 FAILED
Message-ID: 
 <010101839477e073-d36090cf-ca9a-489a-9d14-ca1cdacebd59-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171297

--===============6892113027050971248==
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
--===============6892113027050971248==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-42.4-43.0.patch"

RnJvbSAwODRhOGFmY2I2NTM2M2I2M2VjZDQ1ZjhiNmVhMTBlN2MwYjY2ZWMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMjoyMToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
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

--===============6892113027050971248==
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
meta-yocto-bsp       = "tmp-auh-upgrades:132713818ff9bcb0a1c53820f695e44749d87109"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 179 Local 172 Mirrors 0 Missed 7 Current 696 (96% match, 99% complete)
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
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr', 'gsettings-desktop-schemas', 'json-glib', 'libdazzle', 'libhandy', 'webkitgtk', 'libsoup-2.4', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gmp', 'gobject-introspection', 'vala', 'gtk+3', 'libtool-native', 'attr-native', 'glib-2.0', 'bzip2', 'zstd', 'xz', 'attr', 'acl', 'zlib', 'opkg-utils', 'libnsl2-native', 'sqlite3-native', 'util-linux-libuuid-native', 'gdbm-native', 'readline-native', 'libtirpc-native', 'zlib-native', 'bzip2-native', 'ncurses-native', 'libffi-native', 'openssl-native', 'linux-libc-headers', 'libgcc', 'gettext-minimal-native', 'texinfo-dummy-native', 'systemd', 'libtasn1', 'libjpeg-turbo', 'libnotify', 'libx11', 'libxrender', 'libwpe', 'libxslt', 'libsecret', 'waylan
 d', 'cairo', 'atk', 'libxdamage', 'libwebp', 'mesa', 'libxt', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'wpebackend-fdo', 'enchant2', 'libxcomposite', 'harfbuzz', 'libpcre-native', 'util-linux-native', 're2c-native', 'mpfr-native', 'libmpc-native', 'zstd-native', 'flex-native', 'gnu-config-native', 'gmp-native', 'binutils-cross-i686', 'python3-picobuild-native', 'python3-installer-native', 'python3-wheel-native', 'python3-setuptools-native', 'p11-kit', 'gdk-pixbuf', 'shared-mime-info', 'hicolor-icon-theme', 'libgcrypt', 'libxml2', 'sqlite3', 'libpsl', 'libffi', 'autoconf-archive', 'python3', 'libxrandr', 'libpng', 'at-spi2-atk', 'libepoxy', 'libxcursor', 'libxi', 'wayland-protocols', 'fontconfig', 'libxext', 'libxkbcommon', 'pango', 'libxfixes', 'util-linux', 'libpcre', 'bash-completion', 'perl-native', 'shadow-native', 'base-passwd', 'kmod', 'update-rc.d', 'base-files', 'shadow', 'libpam', 'initscripts', 'libcap', 'libseccomp', 'shadow-sysroot', 'dbus', 'util-macros', 'xtrans', 
 'libxcb', 'xorgproto', 'expat', 'libsm', 'pixman', 'libxxf86vm', 'libdrm', 'xrandr', 'libxshmfence', 'vulkan-loader', 'vulkan-headers', 'libxdmcp', 'libxv', 'libvorbis', 'libogg', 'iso-codes', 'libtheora', 'alsa-lib', 'orc', 'aspell', 'icu', 'freetype', 'libpcre2-native', 'libcap-ng-native', 'm4-native', 'python3-flit-core-native', 'libgpg-error', 'openssl', 'readline', 'gdbm', 'libtirpc', 'ncurses', 'libnsl2', 'libxcrypt', 'util-linux-libuuid', 'at-spi2-core', 'xkeyboard-config', 'fribidi', 'libxft', 'libcap-ng', 'make-native', 'cracklib', 'flex', 'xcb-proto', 'libxau', 'libpthread-stubs', 'libice', 'libpciaccess', 'unzip-native', 'libxtst']
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2547652:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2547652, line 175
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2547652, line 164
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2547652, line 150
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2547652, line 188
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
ERROR: epiphany-43.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/run.do_configure.2547652', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/43.0-r0/temp/log.do_configure.2547652
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_43.0.bb:do_configure) failed with exit code '1'

--===============6892113027050971248==--

