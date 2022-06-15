Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE2ACCA48D
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.4425.1655298222146764425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BZLuRPMs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101816776652e-0019ff9c-179b-49a0-a53a-890415d608f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=evPlWRaOG1v2EqKgY9zp5WlYkFvHZDm73t2g8oZpREc=;
	b=BZLuRPMsDSWmcmjBwFMQ+xptchyoDfG1qPzJ++qYu24PwfvH1wtveyho+yq9+Ah+
	1cG7ph2Ege5NfFvCMVdR54SQEMiEL3hXbJqO3kexDJD0NzEyw2tKNzFegnZ5SBfabx/
	MitYb1TZsWqqcNcA/DZoy1RylE5SP/Kfu4z1ajqM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=evPlWRaOG1v2EqKgY9zp5WlYkFvHZDm73t2g8oZpREc=;
	b=A9TztCHftJflSvRn7lUByKLcNs3jt7DPHYxwn9TGlNI6aQuUtroFSkiPzFq9N0fy
	NPIvK7SDLcPnv46lUyYwk4mHYRBgV9CKPsvJjPjtItgVExWw7PLSAobgXQnGFsw256w
	aDYIBcegM1nyJKU6udIJpD99AwfbTCnCu8uiTViU=
Content-Type: multipart/mixed; boundary="===============2292399396149658846=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.111 FAILED
Message-ID: 
 <010101816776652e-0019ff9c-179b-49a0-a53a-890415d608f9-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166967

--===============2292399396149658846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdrm* to *2.4.111* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.110-2.4.111.patch
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
--===============2292399396149658846==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.110-2.4.111.patch"

From f9240a56f175c51a5bcd637e3687a2076d17830f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 10:57:43 +0000
Subject: [PATCH] libdrm: upgrade 2.4.110 -> 2.4.111

---
 .../drm/{libdrm_2.4.110.bb => libdrm_2.4.111.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.110.bb => libdrm_2.4.111.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.110.bb b/meta/recipes-graphics/drm/libdrm_2.4.111.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.110.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.111.bb
index dd775939a5..b07bd144f8 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.110.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.111.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737"
+SRC_URI[sha256sum] = "1ad7164f77424de6f4ecba7c262bde196a214c6e19a6fbf497f0815f4d7ab2a9"
 
 inherit meson pkgconfig manpages
 
-- 
2.31.1


--===============2292399396149658846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-ea03fbcd4dff91ecaacda0c090ccf2e61a88b0fc"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ea03fbcd4dff91ecaacda0c090ccf2e61a88b0fc"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 27 Mirrors 0 Missed 7 Current 157 (79% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 181 of 191 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 662 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_fetch)
NOTE: Running task 706 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_write_config)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.111-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.111-r0: task do_fetch: Succeeded
NOTE: Running task 707 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_unpack)
NOTE: recipe libdrm-2.4.111-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.111-r0: task do_unpack: Succeeded
NOTE: Running task 708 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_patch)
NOTE: recipe libdrm-2.4.111-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.111-r0: task do_patch: Succeeded
NOTE: Running task 709 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_deploy_source_date_epoch)
NOTE: Running task 710 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.111-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_lic: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_lic: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 775 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.111-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.111-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 781 of 789 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_configure)
NOTE: recipe libdrm-2.4.111-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.62.2.bb:do_populate_
 sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libpciaccess', 'libpthread-stubs', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'libtool-native', 're2c-native', 'libtirpc-native', 'libffi-native', 'readline-native', 'util-linux-libuuid-native', 'openssl-native', 'ncurses-native', 'sqlite3-native', 'gdbm-native', 'bzip2-native', 'libnsl2-native', 'zlib-native', 'util-macros', 'gettext-minimal-native', 'glib-2.0-native', 'python3-installer-native', 'python3-wheel-native', 'python3-setuptools-native', 'texinfo-dummy-native', 'linux-libc-headers', 'mpfr-native', 'zstd-native', 'gmp-native', 'gnu-config-native', 'flex-native', 'libmpc-native', 'binutils-cross-i686', 'attr-native', 'libgcc', 'perl-native', 'libpcre-native', 'gettext-native', 'util-linux-native', 'python3-flit-core-native', 'unzip-native', 'm4-native', 'make-native', 'libpcre2-nati
 ve', 'libcap-ng-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Damdgpu=true -Dcairo-tests=false -Detnaviv=true -Dexynos=false -Dfreedreno=true -Dfreedreno-kgsl=false -Dinstall-test-programs=true -Dintel=true -Dlibkms=true -Dman-pages=false -Dnouveau=true -Domap=true -Dradeon=true -Dtegra=false -Dudev=false -Dvalgrind=false -Dvc4=true -Dvmwgfx=true...
| The Meson build system
| Version: 0.62.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/libdrm-2.4.111
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/build
| Build type: cross build
| 
| ../libdrm-2.4.111/meson.build:21:0: ERROR: Unknown options: "libkms"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/temp/run.do_configure.2721123:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/temp/run.do_configure.2721123, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/temp/run.do_configure.2721123, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/temp/run.do_configure.2721123, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/temp/run.do_configure.2721123, line 187
NOTE: recipe libdrm-2.4.111-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 781 tasks of which 773 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libdrm-2.4.111-r0 do_configure: meson failed
ERROR: libdrm-2.4.111-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/temp/run.do_configure.2721123', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libdrm/2.4.111-r0/temp/log.do_configure.2721123
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_configure) failed with exit code '1'

--===============2292399396149658846==--

