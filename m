Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92304C41535
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5319.1668517535257945753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hgLhV01y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101847b651abc-ed4af608-560a-456a-b915-a5af4525856e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pdelirzayy4mQDyO6r3WYFurYKgySDupySqgWSle0SM=;
	b=hgLhV01yp31FqbvAxWGHOvEA3e7jJj6UoXoBJcXyYGNx//DvUfShPCHzLDRuhCDM
	u+ptIQeUqayJdN21dWXzSh3USElaoEEXNRVsUgbaQvvviE968+H7A0/6AGQQMeAzxqL
	RoNh9BbAuGm5c998pmtT2qEzfnlQ+GZlDKTZx9dI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pdelirzayy4mQDyO6r3WYFurYKgySDupySqgWSle0SM=;
	b=d16uFtAF5m4O7K5NpvmHJJmXqzJV/CudAGqXY0etS6FLAprDXJuqsz0SvCazyneO
	joNte7ISrztE4imNMlw1gXILd0tFCq8ziVPV7v/VFSgLH4zjQqbh/INdhB8bn23VtEI
	B1S6tci6p52Rw8oz0XfOhdicDtBNlKumEKO+b9xw=
Content-Type: multipart/mixed; boundary="===============1959617341971946469=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.74.0 FAILED
Message-ID: <010101847b651abc-ed4af608-560a-456a-b915-a5af4525856e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173283

--===============1959617341971946469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.74.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.72.2-2.74.0.patch
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
--===============1959617341971946469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (886 cached, 1 parsed). 1665 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:ce94a22bc683e9173ad7e2b3fef5870892df4173"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 141 Local 134 Mirrors 0 Missed 7 Current 297 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1093 of 1604 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_fetch)
NOTE: Running task 1155 of 1604 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_write_config)
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1588 of 1604 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_unpack)
NOTE: Running task 1589 of 1604 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1590 of 1604 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_patch)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1591 of 1604 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1592 of 1604 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_populate_lic)
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1593 of 1604 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', 'v
 irtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.64.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'glib-2.0', 'glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gettext-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 're2c-native', 'linux-libc-headers', 'mpfr-native', 'flex-native', 'zstd-native', 'gmp-native', 'binutils-cross-i686', 'zlib-native', 'libtool-native', 'texinfo-dummy-native', 'gnu-config-native', 'libmpc-native', 'ncurses-native', 'libffi-native', 'bzip2-native', 'util-linux-libuuid-native', 'openssl-native', 'gdbm-native', 'libtirpc-native', 'sqlite3-native', 'libnsl2-native', 'readline-native', 'glib-2.0-native', 'opkg-utils', 'bash-completion', 'util-linux', 'libpcre', 'libffi', 'zlib', 'libgcc', 'gettext-minimal-native', 'python3-installer-native', 'python3-picobuild-native', 'python3-setuptools-native', 'python3-wheel-native', 'attr-native', 'm4-native', 'perl-native', 'util-linux-native', 'libpcre-native
 ', 'libcap-ng', 'libxcrypt', 'libpam', 'util-linux-libuuid', 'ncurses', 'bzip2', 'python3-flit-core-native', 'make-native', 'libpcre2-native', 'libcap-ng-native', 'cracklib', 'flex', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgnome_proxy=disabled -Dgnutls=disabled -Dlibproxy=disabled -Dopenssl=enabled -Dinstalled_tests=true...
| The Meson build system
| Version: 0.64.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/glib-networking-2.74.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/build
| Build type: cross build
| Project name: glib-networking
| Project version: 2.74.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/recipe-sysroot ld.bfd 2.39.0.20220819
| C compiler for the build machine: gcc (gcc 8.5.0 "gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-15)")
| C linker for the build machine: gcc ld.bfd 2.30-117
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports link arguments -Wl,--version-script,/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/glib-networking-2.74.0/glib-networking.map: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Dependency glib-2.0 found: NO found 2.72.3 but need: '>= 2.73.3'
| Found CMake: NO
| Run-time dependency glib-2.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency glib-2.0
| 
| ../glib-networking-2.74.0/meson.build:52:0: ERROR: Neither a subproject directory nor a glib.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/build/meson-logs/meson-log.txt
| WARNING: Running the setup command as `meson [options]` instead of `meson setup [options]` is ambiguous and deprecated.
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1442532:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1442532, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1442532, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1442532, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1442532, line 187
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1593 tasks of which 1585 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-networking-2.74.0-r0 do_configure: meson failed
ERROR: glib-networking-2.74.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1442532', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/log.do_configure.1442532
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure) failed with exit code '1'

--===============1959617341971946469==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.72.2-2.74.0.patch"

RnJvbSBjNzEzNjUwMDI3ZmZjZDZjZjk3MWIyMGM4OTE5NGJhYjY4ZGMyMzg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDY6NTQ6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLW5ldHdvcmtpbmc6IHVwZ3JhZGUgMi43Mi4yIC0+IDIuNzQuMAoKLS0tCiAuLi4ve2dsaWIt
bmV0d29ya2luZ18yLjcyLjIuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuNzQuMC5iYn0gICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcve2dsaWItbmV0d29ya2luZ18yLjcy
LjIuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuNzQuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzIuMi5i
YiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43
NC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43Mi4yLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzQuMC5iYgpp
bmRleCA3NDZkMWJjMzljLi4xYmI2YmNjNTBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzIuMi5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzQuMC5iYgpAQCAt
OSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1
MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiCiBTRUNUSU9OID0gImxpYnMiCiBERVBFTkRTID0g
ImdsaWItMi4wIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJjZDJhMDg0YzdiYjkx
ZDc4ZTg0OWZiNTVkNDBlNDcyZjZkOGY2ODYyY2RkYzlmMTJjMzkxNDkzNTliYTE4MjY4IgorU1JD
X1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiMWYxODVhYWVmMDk0MTIzZjhlMjVkOGZhNTU2NjFi
M2ZkNzEwMjAxNjNhMDE3NGFkYjM1YTM3Njg1Y2RhNjEzYiIKIAogUEFDS0FHRUNPTkZJRyA/Pz0g
Im9wZW5zc2wgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BURVNUX0VOQUJMRUQnLCAnMScsICd0ZXN0
cycsICcnLCBkKX0iCiAKLS0gCjIuMzEuMQoK

--===============1959617341971946469==--

