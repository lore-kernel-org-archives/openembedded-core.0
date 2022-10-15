Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FDFC3A5A1
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.24232.1665871395989593931
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bLs/hdH5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010183ddac3928-cd041660-0d7d-4d80-b463-d216c41111b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vWJAuOiWNZ1Y/96Pl5/kXaJEinkEkdqTuIw9jbudArQ=;
	b=bLs/hdH56M9ZKsMgDO0vXahs/0l+9GjFQQFFotmmH1K94Qal36cUkhqbH/mjGwvA
	M3uezytH3hqh0FnmaDIxb2rYMzi/ushDXdmTbZbVh/xT+PrUo4jQdq7kWqVoGUzMio6
	iBd6kCSgl1UaaPemWo/06ZQMLJGNtUUfDKxIzR6M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vWJAuOiWNZ1Y/96Pl5/kXaJEinkEkdqTuIw9jbudArQ=;
	b=JTFgDtyWok0SZgaEUld9ADFSrbxADnkBnRys4bxskzDK4fPVwz24Kj9omYopww7t
	MzRjXMt8zb3gqpMcZi01NFKT2IVLXGHvckqJe3PZ5I72I1spOZ4FagGNVq7LPViAEgy
	OVrrUyd5HlP5IySWzQNVSik48Q3rI+V978skqDXc=
Content-Type: multipart/mixed; boundary="===============2870936469904124462=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.74.0 FAILED
Message-ID: <01010183ddac3928-cd041660-0d7d-4d80-b463-d216c41111b3-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171833

--===============2870936469904124462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.74.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.72.0-1.74.0.patch
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
--===============2870936469904124462==
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
meta-yocto-bsp       = "tmp-auh-upgrades:815de8de3318ef6d68b11dbb184c295d667c8c43"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 117 Local 108 Mirrors 0 Missed 9 Current 213 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1052 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1054 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1113 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1121 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_write_config: Started
NOTE: Running task 1231 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: Running task 1232 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: Running task 1233 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1235 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1236 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1237 of 1252 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1238 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1239 of 1252 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/y
 octo-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['quilt-native', 'glib-2.0-native', 'zlib-native', 'autoconf-archive-native', 'bison-native', 'flex-native', 'meson-native', 'ninja-native', 'pkgconfig-native', 'python3-native', 'xz-native', 'gtk-doc-native', 'libffi-native', 'libtool-native', 'util-linux-native', 'gettext-minimal-native', 'gettext-native', 'libpcre-native', 'python3-picobuild-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-wheel-native', 'texinfo-dummy-native', 're2c-native', 'bzip2-native', 'util-linux-libuuid-native', 'libnsl2-native', 'ncurses-native', 'sqlite3-native', 'libtirpc-native', 'gdbm-native', 'openssl-native', 'readline-native', 'm4-native', 'libpcre2-native', 'libcap-ng-native', 'python3-flit-core-native', 'perl-native', 'gnu-config-native', 'unzip-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| gtkdocize: neither configure.ac nor configure.in exist
| NOTE: Executing meson -Dgtk_doc=false -Ddoctool=disabled...
| The Meson build system
| Version: 0.63.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/gobject-introspection-1.74.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/build
| Build type: native build
| Project name: gobject-introspection
| Project version: 1.74.0
| C compiler for the host machine: gcc (gcc 8.5.0 "gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-10)")
| C linker for the host machine: gcc ld.bfd 2.30-113
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Program python3 found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
| Compiler for C supports arguments -Warray-bounds: YES
| Compiler for C supports arguments -Wcast-align: YES
| Compiler for C supports arguments -Wduplicated-branches: YES
| Compiler for C supports arguments -Wformat=2: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wimplicit-function-declaration: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wjump-misses-init: YES
| Compiler for C supports arguments -Wlogical-op: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-format-attribute: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Wmissing-noreturn: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wnested-externs: YES
| Compiler for C supports arguments -Wnull-dereference: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Wpacked: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wrestrict: YES
| Compiler for C supports arguments -Wreturn-type: YES
| Compiler for C supports arguments -Wshadow: YES
| Compiler for C supports arguments -Wsign-compare: YES
| Compiler for C supports arguments -Wstrict-aliasing: YES
| Compiler for C supports arguments -Wstrict-prototypes: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wunused-but-set-variable: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Checking for size of "char" : 1
| Checking for size of "short" : 2
| Checking for size of "int" : 4
| Checking for size of "long" : 8
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/recipe-sysroot-native/usr/bin/pkg-config-native (0.29.2)
| Dependency glib-2.0 found: NO found 2.72.3 but need: '>=2.74.0'
| Did not find CMake 'cmake'
| Found CMake: NO
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../gobject-introspection-1.74.0/meson.build:129:0: ERROR: Automatic wrap-based subproject downloading is disabled
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2900542:184 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2900542, line 184
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2900542, line 173
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2900542, line 159
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2900542, line 197
NOTE: recipe gobject-introspection-native-1.74.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1239 tasks of which 1226 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: gobject-introspection-native-1.74.0-r0 do_configure: meson failed
ERROR: gobject-introspection-native-1.74.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/run.do_configure.2900542', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/gobject-introspection-native/1.74.0-r0/temp/log.do_configure.2900542
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure) failed with exit code '1'

--===============2870936469904124462==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.72.0-1.74.0.patch"

RnJvbSA1ZTU4Y2I3NzBkYWVlOGI2NGZmNDM3NDg2NzMwNDFlNjJkOWVmYjc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTU6MDE6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
b2JqZWN0LWludHJvc3BlY3Rpb246IHVwZ3JhZGUgMS43Mi4wIC0+IDEuNzQuMAoKLS0tCiAuLi4t
UmVsb2NhdGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5LWZvci1uYXRpdmUtYnVpbGRzLnBhdGNo
IHwgNCArKy0tCiAuLi5udHJvc3BlY3Rpb25fMS43Mi4wLmJiID0+IGdvYmplY3QtaW50cm9zcGVj
dGlvbl8xLjc0LjAuYmJ9IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9z
cGVjdGlvbi97Z29iamVjdC1pbnRyb3NwZWN0aW9uXzEuNzIuMC5iYiA9PiBnb2JqZWN0LWludHJv
c3BlY3Rpb25fMS43NC4wLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9t
ZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uLzAwMDEtUmVsb2Nh
dGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5LWZvci1uYXRpdmUtYnVpbGRzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rp
b24vMDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWls
ZHMucGF0Y2gKaW5kZXggYmE5NjUwOTJlMS4uM2NlOTAzODkxYiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb24v
MDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2Jq
ZWN0LWludHJvc3BlY3Rpb24vMDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3Rvcnkt
Zm9yLW5hdGl2ZS1idWlsZHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc0YTBmZWU4OTIy
MzVjNzIyYWM2MGRkZWE2ZWU3OWJjM2Q3YTkzZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDgxZGI3NGM4OGI3NTgwMGI4Njk1ZDkzNmQ2MzY1MjVkOTFkNzNhNTAgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBTYXNjaGEgU2lsYmUgPHgteW8xN0BzZS1zaWxiZS5kZT4KIERh
dGU6IEZyaSwgOCBKdW4gMjAxOCAxMzo1NToxMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBSZWxv
Y2F0ZSB0aGUgcmVwb3NpdG9yeSBkaXJlY3RvcnkgZm9yIG5hdGl2ZSBidWlsZHMKQEAgLTIxLDcg
KzIxLDcgQEAgU2lnbmVkLW9mZi1ieTogU2FzY2hhIFNpbGJlIDx4LXlvMTdAc2Utc2lsYmUuZGU+
CiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBk
aWZmIC0tZ2l0IGEvZ2lyZXBvc2l0b3J5L2dpcmVwb3NpdG9yeS5jIGIvZ2lyZXBvc2l0b3J5L2dp
cmVwb3NpdG9yeS5jCi1pbmRleCA3ZDAzNDg1Li4yMGY0ODEzIDEwMDY0NAoraW5kZXggYTA3NTRm
NC4uMmQ0NTZmOSAxMDA2NDQKIC0tLSBhL2dpcmVwb3NpdG9yeS9naXJlcG9zaXRvcnkuYwogKysr
IGIvZ2lyZXBvc2l0b3J5L2dpcmVwb3NpdG9yeS5jCiBAQCAtMjEsNiArMjEsOCBAQApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWlu
dHJvc3BlY3Rpb25fMS43Mi4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9z
cGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43NC4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24v
Z29iamVjdC1pbnRyb3NwZWN0aW9uXzEuNzIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43NC4wLmJi
CmluZGV4IGQ5MzVjYmQ5MDUuLmFiOWQyZDM1ZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
bm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uXzEuNzIuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3Qt
aW50cm9zcGVjdGlvbl8xLjc0LjAuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICIke0dO
T01FX01JUlJPUn0vJHtCUE59LyR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAyKX0v
JHtCUE59LSQKICAgICAgICAgICAgZmlsZTovLzAwMDEtZy1pci10b29sLXRlbXBsYXRlLmluLWZp
eC1naXJkaXItcGF0aC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjAyZmU4ZTU5MDg2MWQ4OGY4MzA2MGRkMzljZGE1Y2NhYTYwYjJkYTFkMjFkMGY5NTQ5OTMw
MWIxODZiZWFhYmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzQ3YjNhNzE5ZTY4YmE0YzY5ZmYy
ZDU3ZWUyNjg5MjMzZWE4YzA3ZmM0OTIyMDVlNTczMzg2Nzc5ZTQyZDY1MyIKIAogU1JDX1VSSTph
cHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vMDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9y
eS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2giCiAKLS0gCjIuMzEuMQoK

--===============2870936469904124462==--

