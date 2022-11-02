Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADE0C67791
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.854.1667349632132217010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bwpTXo0B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018435c850fa-dfeb6335-a1cf-4e5a-9d0b-768a6d8cb361-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5ehaeUVFR3Jq62Ox5AtUWK1VZzqlYldpV4bZlqQoBBU=;
	b=bwpTXo0BSzKqFSjwTb+BroOH2E0yH7I92EeMa4OrEIsD6JufWeBb0niuIgKaOi/d
	ASEvy5givlCEYC3vUafVTcWMDX84k9umvvStHRlMQE5OB1ULGOuncvgIuJWe8Ye2Cbr
	QYuGykRZBf56Y2tk+xhoJ6G/pBNVMavllW1aj0Ds=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5ehaeUVFR3Jq62Ox5AtUWK1VZzqlYldpV4bZlqQoBBU=;
	b=U4+iV3DwGxkkUfnZ/EAxqlanmCTcfLAKNfCU+39LeVMHtwnQOqlwz9XYXHD8cOkm
	Njv1kiN+P7y3S3TT1H4512IOPgA4XvMaBZdOaiRDi800mXBYD8lclwwjuWzwBhCqLkU
	p0PdwWiF3MKfttdCv4fDUB9ahIbHD/yCETYZVDeI=
Content-Type: multipart/mixed; boundary="===============8683511900698983109=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.74.0 FAILED
Message-ID: <0101018435c850fa-dfeb6335-a1cf-4e5a-9d0b-768a6d8cb361-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172399

--===============8683511900698983109==
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
--===============8683511900698983109==
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
meta-yocto-bsp       = "tmp-auh-upgrades:6629851ef39bd270192b3a09847927b72f1ffee0"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 79 Local 72 Mirrors 0 Missed 7 Current 358 (91% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1092 of 1603 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_fetch)
NOTE: Running task 1154 of 1603 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_write_config)
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1587 of 1603 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_unpack)
NOTE: Running task 1588 of 1603 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.74.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1589 of 1603 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_patch)
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 1603 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1591 of 1603 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_populate_lic)
NOTE: recipe glib-networking-2.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.74.0-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-networking-2.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1592 of 1603 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure)
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot', 'v
 irtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'glib-2.0', 'glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'gettext-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'zlib', 'libffi', 'libpcre', 'bash-completion', 'util-linux', 'linux-libc-headers', 'libffi-native', 'zlib-native', 'ncurses-native', 'sqlite3-native', 'libtool-native', 'libtirpc-native', 'readline-native', 'libnsl2-native', 'util-linux-libuuid-native', 'openssl-native', 'bzip2-native', 'gdbm-native', 'glib-2.0-native', 'libgcc', 'libmpc-native', 'flex-native', 'gmp-native', 'texinfo-dummy-native', 'gnu-config-native', 'mpfr-native', 'zstd-native', 'binutils-cross-i686', 'opkg-utils', 'gettext-minimal-native', 'python3-picobuild-native', 'python3-installer-native', 'python3-wheel-native', 'python3-setuptools-native', 'attr-native', 're2c-native', 'bzip2', 'ncurses', 'util-linux-libuuid', 'libcap-ng', 'libpam',
  'libxcrypt', 'perl-native', 'libpcre-native', 'util-linux-native', 'm4-native', 'python3-flit-core-native', 'flex', 'cracklib', 'make-native', 'libcap-ng-native', 'libpcre2-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dgnome_proxy=disabled -Dgnutls=disabled -Dlibproxy=disabled -Dopenssl=enabled -Dinstalled_tests=true...
| The Meson build system
| Version: 0.63.3
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/glib-networking-2.74.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/build
| Build type: cross build
| Project name: glib-networking
| Project version: 2.74.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/recipe-sysroot ld.bfd 2.39.0.20220819
| C compiler for the build machine: gcc (gcc 8.5.0 "gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-10)")
| C linker for the build machine: gcc ld.bfd 2.30-113
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
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1059590:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1059590, line 175
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1059590, line 164
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1059590, line 150
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1059590, line 188
NOTE: recipe glib-networking-2.74.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1592 tasks of which 1584 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-networking-2.74.0-r0 do_configure: meson failed
ERROR: glib-networking-2.74.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/run.do_configure.1059590', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glib-networking/2.74.0-r0/temp/log.do_configure.1059590
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb:do_configure) failed with exit code '1'

--===============8683511900698983109==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.72.2-2.74.0.patch"

RnJvbSA0MGZkZjY5ODQ2Yzc3YWUxMGU5YjRmZTdjNWQ2ZDQxMmUyMGM5MThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNzoxNDo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItbmV0d29ya2luZzogdXBncmFkZSAyLjcyLjIgLT4gMi43NC4wCgotLS0KIC4uLi97Z2xpYi1u
ZXR3b3JraW5nXzIuNzIuMi5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi43NC4wLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy97Z2xpYi1uZXR3b3JraW5nXzIuNzIu
Mi5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi43NC4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43Mi4yLmJi
IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc0
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjcyLjIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43NC4wLmJiCmlu
ZGV4IDc0NmQxYmMzOWMuLjFiYjZiY2M1MGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43Mi4yLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43NC4wLmJiCkBAIC05
LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT00ZmJkNjUz
ODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIFNFQ1RJT04gPSAibGlicyIKIERFUEVORFMgPSAi
Z2xpYi0yLjAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImNkMmEwODRjN2JiOTFk
NzhlODQ5ZmI1NWQ0MGU0NzJmNmQ4ZjY4NjJjZGRjOWYxMmMzOTE0OTM1OWJhMTgyNjgiCitTUkNf
VVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIxZjE4NWFhZWYwOTQxMjNmOGUyNWQ4ZmE1NTY2MWIz
ZmQ3MTAyMDE2M2EwMTc0YWRiMzVhMzc2ODVjZGE2MTNiIgogCiBQQUNLQUdFQ09ORklHID8/PSAi
b3BlbnNzbCAke0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcxJywgJ3Rlc3Rz
JywgJycsIGQpfSIKIAotLSAKMi4zMS4xCgo=

--===============8683511900698983109==--

