Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1ACC07E9D
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.341.1664643226234381834
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q28a+l7x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101839477e64c-66d081dc-ed85-4647-bf64-ac9eccf47010-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j0pkiDyToV2Dde3TigVVgzCK2ZZJYz8SqrDQJjwUepY=;
	b=Q28a+l7xRnGivwDmGk2T1/zVwZJ6DsUVRRJrZYWk0P2o0pjtS//Kpms4QF6/tYDJ
	jnGPMHUCSKe0w2SM4BTUc+mGRs+UGNP0xcZtNgWs/wTVk5zKm4rRIoH30bfLrZj0hbq
	PT8MQd2zoePlu1qQTWCVFZiJDzS3IfGHlTH5cmZc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j0pkiDyToV2Dde3TigVVgzCK2ZZJYz8SqrDQJjwUepY=;
	b=dKudPCaH4ndVruIIDDB0c3bjqc7Ey6EJKPNgJNi1lPqHPs/7b3EDikVeK3yZfXUK
	BySh66amkisTsPsNzxG1YlC1o6+qV1xdb/0tWuA8puR1nUeUH8AKE7DxexVTMOh6amY
	s+c9HDNwmLYnNVFp/UYStPPg02SSpZhPxPmhG0Hg=
Content-Type: multipart/mixed; boundary="===============3132137753955282526=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.2.0 FAILED
Message-ID: 
 <010101839477e64c-66d081dc-ed85-4647-bf64-ac9eccf47010-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171332

--===============3132137753955282526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.2.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.0.7-3.2.0.patch
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
--===============3132137753955282526==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.0.7-3.2.0.patch"

RnJvbSBjODRjNWZkNzJlMThjMDJkZTcwOTkyZTExZDM5ZDJmYzA2NDgwNDYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNjoxMToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvdXA6IHVwZ3JhZGUgMy4wLjcgLT4gMy4yLjAKCi0tLQogLi4uL2xpYnNvdXAve2xpYnNvdXBf
My4wLjcuYmIgPT4gbGlic291cF8zLjIuMC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGlic291cC97bGlic291cF8zLjAuNy5iYiA9PiBsaWJzb3VwXzMuMi4wLmJi
fSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291
cF8zLjAuNy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjIuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzb3VwL2xpYnNvdXBfMy4wLjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnNvdXAvbGlic291cF8zLjIuMC5iYgppbmRleCA1OWNjNGExZDBhLi45ZTc0MmFlNDFhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy4wLjcuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuMi4wLmJiCkBAIC0xMiw3
ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGxpYnhtbDIgc3Fs
aXRlMyBsaWJwc2wgbmdodHRwMiIKIFNIUlRfVkVSID0gIiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0
KCcuJylbMF19LiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMV19IgogCiBTUkNfVVJJID0g
IiR7R05PTUVfTUlSUk9SfS9saWJzb3VwLyR7U0hSVF9WRVJ9L2xpYnNvdXAtJHtQVn0udGFyLnh6
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImViZGY5MGNmMzU5OWMxMWFjYmI2ODE4YTlkOWUzZmM5
ZDJjNjhlNTZlYjgyOWI5Mzk2Mjk3MjY4M2UxYmY3YzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MjgzMjM3MDY5OGNhOGY5ZmJmMTc0YzM0NWI3M2Q4OWI2MDU2MTEwM2E2MjZjMmRmNzA3MjZiMDcw
N2Y3OWJkMyIKIAogUFJPVklERVMgPSAibGlic291cC0zLjAiCiBDVkVfUFJPRFVDVCA9ICJsaWJz
b3VwIgotLSAKMi4zMS4xCgo=

--===============3132137753955282526==
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
meta-yocto-bsp       = "tmp-auh-upgrades:389dde0dc7ec5922bcfd89e6b30811f1173c26d9"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 170 Local 163 Mirrors 0 Missed 7 Current 266 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1194 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_fetch)
NOTE: Running task 1394 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_write_config)
NOTE: recipe libsoup-3.2.0-r0: task do_fetch: Started
NOTE: recipe libsoup-3.2.0-r0: task do_write_config: Started
NOTE: recipe libsoup-3.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1582 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_unpack)
NOTE: Running task 1583 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.2.0-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.2.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_patch)
NOTE: recipe libsoup-3.2.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1586 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_populate_lic)
NOTE: recipe libsoup-3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.2.0-r0: task do_populate_lic: Started
NOTE: recipe libsoup-3.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libsoup-3.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1587 of 1595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_configure)
NOTE: recipe libsoup-3.2.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysr
 oot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.
 bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glib-2.0', 'glibc', 'libxml2', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gobject-introspection', 'libpsl', 'nghttp2', 'sqlite3', 'gettext-native', 'glib-2.0-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gobject-introspection-native', 'gtk-doc-native', 'zlib-native', 'mpfr-native', 'gmp-native', 'texinfo-dummy-native', 'gnu-config-native', 'flex-native', 'binutils-cross-i686', 'linux-libc-headers', 'libmpc-native', 'zstd-native', 'libtool-native', 'icu', 'gettext-minimal-native', 'libffi-native', 'libffi', 'zlib', 'bash-completion', 'util-linux', 'libpcre', 're2c-native', 'python3', 'opkg-utils', 'autoconf-archive', 'python3-wheel-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-picobuild-native', 'attr-native', 'gdbm-native', 'sqlite3-native', 'bzip2-native', 'libtirpc-native', 'util-linux-libuuid-native', 'o
 penssl-native', 'readline-native', 'ncurses-native', 'libnsl2-native', 'util-linux-native', 'libpcre-native', 'libgcc', 'm4-native', 'ncurses', 'libcap-ng', 'libxcrypt', 'util-linux-libuuid', 'libpam', 'bzip2', 'openssl', 'libtirpc', 'xz', 'gdbm', 'libnsl2', 'readline', 'python3-flit-core-native', 'perl-native', 'libcap-ng-native', 'libpcre2-native', 'flex', 'cracklib', 'unzip-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Dgtk_doc=false -Dintrospection=enabled -Dgssapi=disabled -Dvapi=disabled -Dtls_check=false...
| The Meson build system
| Version: 0.63.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/libsoup-3.2.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/build
| Build type: cross build
| 
| ../libsoup-3.2.0/meson.build:1:0: ERROR: Unknown options: "gtk_doc"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/temp/run.do_configure.3730824:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/temp/run.do_configure.3730824, line 183
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/temp/run.do_configure.3730824, line 172
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/temp/run.do_configure.3730824, line 158
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/temp/run.do_configure.3730824, line 196
NOTE: recipe libsoup-3.2.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1587 tasks of which 1579 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libsoup-3.2.0-r0 do_configure: meson failed
ERROR: libsoup-3.2.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/temp/run.do_configure.3730824', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsoup/3.2.0-r0/temp/log.do_configure.3730824
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.0.bb:do_configure) failed with exit code '1'

--===============3132137753955282526==--

