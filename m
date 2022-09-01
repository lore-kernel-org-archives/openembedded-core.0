Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42935C6FA93
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.12462.1662040787160894132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JzDeFxgR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010182f959c48b-8dea8c37-5db4-4a35-8581-a06d718cdb72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Un2PT8MPYtDbmnABgbfltupjfnXwqURJjCys/F/kg3A=;
	b=JzDeFxgR8pCVwNAb59+FI11Ca1ofWLmYlmsedE//s04sPnp1lPMZlI66+O4NPGDV
	SjlMa7ycNhGv7NlVlOzlQySGHLNNeUvza+bZYeltB1YE9B6S1IcUBW9VSlGef0bJdgC
	lTbZ+fCdZR+MtAjhZHgKLgLMaqP9sQh/Q7E4CyB0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Un2PT8MPYtDbmnABgbfltupjfnXwqURJjCys/F/kg3A=;
	b=Eq+UPAyZjhAxFdE1XVZsNvzIySvu9YSNP/FRDE3x/XivyDJloiCGN2uA9l4jWp12
	RPTbTQTUE9Gmw1JF+aCvUEEXzN32uz70Lq4+z8WQRYq05SS4PvL6AEG0NYtDl9JFD3z
	54qglrP9l8BHte8Az8nXOFpLJ/8jwHn7zU3o07I4=
Content-Type: multipart/mixed; boundary="===============8733689693095374450=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.113 FAILED
Message-ID: 
 <01010182f959c48b-8dea8c37-5db4-4a35-8581-a06d718cdb72-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170195

--===============8733689693095374450==
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
--===============8733689693095374450==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.112-2.4.113.patch"

RnJvbSBhZGZmNjE5NTM2ZDFiY2UxNmFiYTA0ZTM2Yjk4N2M4M2JjNWU3ZjE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwOToxNjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRybTogdXBncmFkZSAyLjQuMTEyIC0+IDIuNC4xMTMKCi0tLQogLi4uL2RybS97bGliZHJtXzIu
NC4xMTIuYmIgPT4gbGliZHJtXzIuNC4xMTMuYmJ9ICAgICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2RybS97bGliZHJtXzIuNC4xMTIuYmIgPT4gbGliZHJtXzIuNC4xMTMu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1f
Mi40LjExMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC4xMTMuYmIK
c2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2Ry
bS9saWJkcm1fMi40LjExMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9s
aWJkcm1fMi40LjExMy5iYgppbmRleCA0ODgzODI0NWRkLi5kMjgzOTUzZDgzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTEyLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC4xMTMuYmIKQEAgLTEzLDcgKzEzLDcgQEAg
REVQRU5EUyA9ICJsaWJwdGhyZWFkLXN0dWJzIgogU1JDX1VSSSA9ICJodHRwOi8vZHJpLmZyZWVk
ZXNrdG9wLm9yZy9saWJkcm0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIwMGIwNzcxMGJkMDliMzVjZDhkODBlYWY0ZjQ0OTdmZTI3ZjRiZWNmNDY3
YTk4MzBmMWY1ZTgzMjRmODQyMGZmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdmZDdlYjI5Njdm
NjNiZWI0NjA2ZjIyZDUwZTI3N2Q5OTM0ODBkMDVlZjc1ZGQ4OGE5YmQ4ZTY3NzMyM2U1ZTEiCiAK
IGluaGVyaXQgbWVzb24gcGtnY29uZmlnIG1hbnBhZ2VzCiAKLS0gCjIuMzEuMQoK

--===============8733689693095374450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 36 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-fcb1df118f900428e9a965869eb2e7869179a822"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fcb1df118f900428e9a965869eb2e7869179a822"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 32 Local 25 Mirrors 0 Missed 7 Current 161 (78% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 185 of 193 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 671 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_fetch)
NOTE: Running task 715 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_write_config)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Succeeded
NOTE: Running task 716 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_unpack)
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_patch)
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Succeeded
NOTE: Running task 718 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 719 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_lic: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_lic: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 784 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 790 of 798 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure)
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.63.1.bb:do_populate_
 sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libpciaccess', 'libpthread-stubs', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'libtool-native', 'attr-native', 'zlib-native', 'glib-2.0-native', 'util-macros', 'linux-libc-headers', 'libgcc', 'gettext-minimal-native', 'ncurses-native', 'bzip2-native', 'sqlite3-native', 'libtirpc-native', 'readline-native', 'gdbm-native', 'libffi-native', 'libnsl2-native', 'util-linux-libuuid-native', 'openssl-native', 'python3-installer-native', 'python3-picobuild-native', 'python3-setuptools-native', 'python3-wheel-native', 'zstd-native', 'mpfr-native', 'gmp-native', 'binutils-cross-i686', 'libmpc-native', 'flex-native', 'gnu-config-native', 'texinfo-dummy-native', 're2c-native', 'util-linux-native', 'libpcre-native', 'gettext-native', 'perl-native', 'python3-flit-core-native', 'm4-native', 'libcap-ng-native
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1553338:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1553338, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1553338, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1553338, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1553338, line 187
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 790 tasks of which 782 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libdrm-2.4.113-r0 do_configure: meson failed
ERROR: libdrm-2.4.113-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/run.do_configure.1553338', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.113-r0/temp/log.do_configure.1553338
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure) failed with exit code '1'

--===============8733689693095374450==--

