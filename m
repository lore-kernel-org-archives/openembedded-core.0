Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4FCC6FD23
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.10725.1663251512687298215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GZ5kTSVG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101018341840003-4b1a7acb-66ed-4e27-bc91-933d7e267cbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0OkiynRiUdII+XjeDY0nLaIyi3HEUL2AJuRzMX3+FHM=;
	b=GZ5kTSVG+77esm7RpaXPTCaddM3Ra3izXiRy1kuUPi7vKV/t+PhwWcn7vv3e+dkg
	1u8WxZFApSx7iIXGF4w+m1ePSyfDRKOUqt4TfGUKOKy8yPkNDdrZ23koCErQxhUPGnD
	U+lk3BTPSTawe7wHaiR9kqZrrRcBNAclVkJOBFGo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0OkiynRiUdII+XjeDY0nLaIyi3HEUL2AJuRzMX3+FHM=;
	b=LZgXdFP1SDU1KDHC004K/bqBERYpyF8sEujl/9f9VBEeWp91JIOy7XQTi7aaxcGv
	cYf/0dlDzZ9T9y2dTOlBEq9rbRt9xBP0eIYyId86Q7Hlf1ufmkgQ+kF0zRJ3wOkIAjO
	D7ivbOpNYgAhCpFeC5PuAMQs5xw0IqL5I3acR3Ak=
Content-Type: multipart/mixed; boundary="===============4806422183235716143=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.113 FAILED
Message-ID: 
 <0101018341840003-4b1a7acb-66ed-4e27-bc91-933d7e267cbe-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170725

--===============4806422183235716143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdrm* to *2.4.113* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.112-2.4.113.patch
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
--===============4806422183235716143==
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
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-88bf8d73a526e6cdb30900cef1a3481f17baae04"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:88bf8d73a526e6cdb30900cef1a3481f17baae04"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 31 Mirrors 0 Missed 7 Current 155 (81% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 719 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_fetch)
NOTE: Running task 779 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_write_config)
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Succeeded
NOTE: Running task 785 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_unpack)
NOTE: Running task 786 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Succeeded
NOTE: Running task 787 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_patch)
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Succeeded
NOTE: Running task 788 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 789 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_lic: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_lic: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 790 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure)
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.1.bb:do_populate_
 sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libpciaccess', 'libpthread-stubs', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'attr-native', 'libtool-native', 'gnu-config-native', 'libmpc-native', 'mpfr-native', 'flex-native', 'linux-libc-headers', 'texinfo-dummy-native', 'gmp-native', 'zlib-native', 'binutils-cross-i686', 'zstd-native', 'glib-2.0-native', 'libgcc', 'gettext-minimal-native', 'gdbm-native', 'readline-native', 'util-linux-libuuid-native', 'ncurses-native', 'sqlite3-native', 'libtirpc-native', 'libnsl2-native', 'openssl-native', 'bzip2-native', 'libffi-native', 'util-macros', 'python3-setuptools-native', 'python3-installer-native', 'python3-picobuild-native', 'python3-wheel-native', 're2c-native', 'm4-native', 'util-linux-native', 'libpcre-native', 'gettext-native', 'perl-native', 'python3-flit-core-native', 'libcap-ng-native
 ', 'libpcre2-native', 'make-native', 'unzip-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Damdgpu=true -Dcairo-tests=false -Detnaviv=true -Dexynos=false -Dfreedreno=true -Dfreedreno-kgsl=false -Dinstall-test-programs=true -Dintel=true -Dman-pages=false -Dnouveau=true -Domap=true -Dradeon=true -Dtegra=false -Dudev=false -Dvalgrind=false -Dvc4=true -Dvmwgfx=true...
| The Meson build system
| Version: 0.63.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/libdrm-2.4.113
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/build
| Build type: cross build
| 
| ../libdrm-2.4.113/meson.build:21:0: ERROR: Value "true" (of type "string") for combo option "Enable support for amdgpu's KMS API." is not one of the choices. Possible choices are (as string): "enabled", "disabled", "auto".
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1066079:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1066079, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1066079, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1066079, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1066079, line 187
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 790 tasks of which 782 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libdrm-2.4.113-r0 do_configure: meson failed
ERROR: libdrm-2.4.113-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1066079', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/log.do_configure.1066079
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure) failed with exit code '1'

--===============4806422183235716143==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.112-2.4.113.patch"

RnJvbSA0MzM5N2Q3NGZjOWI0NmRjNGFhOGM3OTQ4NjY0ODNmMTc1YmFlODIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTA6NTc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkcm06IHVwZ3JhZGUgMi40LjExMiAtPiAyLjQuMTEzCgotLS0KIC4uLi9kcm0ve2xpYmRybV8y
LjQuMTEyLmJiID0+IGxpYmRybV8yLjQuMTEzLmJifSAgICAgICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0ve2xpYmRybV8yLjQuMTEyLmJiID0+IGxpYmRybV8yLjQuMTEz
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJt
XzIuNC4xMTIuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTEzLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9k
cm0vbGliZHJtXzIuNC4xMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0v
bGliZHJtXzIuNC4xMTMuYmIKaW5kZXggNDg4MzgyNDVkZC4uZDI4Mzk1M2Q4MyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjExMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTEzLmJiCkBAIC0xMyw3ICsxMyw3IEBA
IERFUEVORFMgPSAibGlicHRocmVhZC1zdHVicyIKIFNSQ19VUkkgPSAiaHR0cDovL2RyaS5mcmVl
ZGVza3RvcC5vcmcvbGliZHJtLyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMDBiMDc3MTBiZDA5YjM1Y2Q4ZDgwZWFmNGY0NDk3ZmUyN2Y0YmVjZjQ2
N2E5ODMwZjFmNWU4MzI0Zjg0MjBmZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZmQ3ZWIyOTY3
ZjYzYmViNDYwNmYyMmQ1MGUyNzdkOTkzNDgwZDA1ZWY3NWRkODhhOWJkOGU2NzczMjNlNWUxIgog
CiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBtYW5wYWdlcwogCi0tIAoyLjMxLjEKCg==

--===============4806422183235716143==--

