Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E60C48BF1
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:29 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20185.1708018347157682077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PCizHgnt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gSGsoMvW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dadd3ad9d-6597091c-11b0-41b1-b036-071977496220-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q8L1zoKgIAe+1kEbMThcktCKx6T9FhkwFQMsKmekmiM=;
	b=PCizHgntQwuNBQh1X0T9OsXkAqO1OCuC0ZRxpF61H6eZox7qDG1RDbhbt8dKVDRs
	MpBqoruP4m47+2iHqUGqqy+QPWSgW4GOnrH42+ATjNvFe7/Ub7xZKkE4MqaNis3wheI
	wzr1MzRuBsHXJL1rnmzsf+7GVnmyNCj50lOtdpiA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q8L1zoKgIAe+1kEbMThcktCKx6T9FhkwFQMsKmekmiM=;
	b=gSGsoMvWYxuWI40cGKuv0ak57VbJ4wFu2dSnuCPxWGfzf7yr8QdJwWsnDr3Z9+B8
	wvZ54up9kSziD66IPKqumVh+8oX3EvQRtgFSaOnmn8c3qmhEm9Gvn0UNhvo8xBPzU7p
	HM0X3fGG5OmYHLDFmqh9KZdTTFxQODuDR82YRCfQ=
Content-Type: multipart/mixed; boundary="===============2030590621906355735=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] taglib: upgrading to 2.0 FAILED
Message-ID: <0101018dadd3ad9d-6597091c-11b0-41b1-b036-071977496220-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195682

--===============2030590621906355735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *taglib* to *2.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-taglib-upgrade-1.13.1-2.0.patch
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

-- >8 --
From e84e7727093f0f3214e8c77305e5e1639586f353 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 17:26:04 +0000
Subject: [PATCH] taglib: upgrade 1.13.1 -> 2.0

---
 meta/recipes-support/taglib/{taglib_1.13.1.bb => taglib_2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/taglib/{taglib_1.13.1.bb => taglib_2.0.bb} (95%)

diff --git a/meta/recipes-support/taglib/taglib_1.13.1.bb b/meta/recipes-support/taglib/taglib_2.0.bb
similarity index 95%
rename from meta/recipes-support/taglib/taglib_1.13.1.bb
rename to meta/recipes-support/taglib/taglib_2.0.bb
index b26563ae91..f05e12ea30 100644
--- a/meta/recipes-support/taglib/taglib_1.13.1.bb
+++ b/meta/recipes-support/taglib/taglib_2.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b"
+SRC_URI[sha256sum] = "e36ea877a6370810b97d84cf8f72b1e4ed205149ab3ac8232d44c850f38a2859"
 
 UPSTREAM_CHECK_URI = "https://taglib.org/"
 UPSTREAM_CHECK_REGEX = "taglib-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.42.0


--===============2030590621906355735==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-taglib-upgrade-1.13.1-2.0.patch"

RnJvbSBlODRlNzcyNzA5M2YwZjMyMTRlOGM3NzMwNWU1ZTE2Mzk1ODZmMzUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTc6MjY6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
YWdsaWI6IHVwZ3JhZGUgMS4xMy4xIC0+IDIuMAoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC90
YWdsaWIve3RhZ2xpYl8xLjEzLjEuYmIgPT4gdGFnbGliXzIuMC5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC90YWdsaWIve3RhZ2xpYl8xLjEzLjEuYmIgPT4gdGFnbGliXzIuMC5iYn0gKDk1
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzEuMTMu
MS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWdsaWJfMi4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3RhZ2xpYi90YWds
aWJfMS4xMy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGli
XzIuMC5iYgppbmRleCBiMjY1NjNhZTkxLi5mMDVlMTJlYTMwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC90YWdsaWIvdGFnbGliXzEuMTMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC90YWdsaWIvdGFnbGliXzIuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBERVBFTkRTID0g
InpsaWIiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3RhZ2xpYi5naXRodWIuaW8vcmVsZWFzZXMvJHtC
UH0udGFyLmd6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzhkYTJiMTBmMWJmZWMyY2Q3ZGJm
Y2QzM2Y0YTIzMzhkYjA3NjVkODUxYTUwNTgzZDQxMGJhY2YwNTVjZmQwYiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJlMzZlYTg3N2E2MzcwODEwYjk3ZDg0Y2Y4ZjcyYjFlNGVkMjA1MTQ5YWIzYWM4
MjMyZDQ0Yzg1MGYzOGEyODU5IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly90YWds
aWIub3JnLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInRhZ2xpYi0oP1A8cHZlcj5cZCsoXC5c
ZCspKylcLnRhciIKLS0gCjIuNDIuMAoK

--===============2030590621906355735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1859 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-fb7e1e9ea6ec97d9a42acdbc79899575ed077326"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fb7e1e9ea6ec97d9a42acdbc79899575ed077326"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 110 Local 101 Mirrors 0 Missed 9 Current 198 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 215 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 217 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe taglib-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 277 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe taglib-2.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe taglib-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 278 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe taglib-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 681 of 925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 282 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe taglib-2.0-r0: task do_fetch: Started
NOTE: recipe taglib-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 684 of 925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_unpack)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 289 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 291 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe taglib-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 691 of 925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe taglib-2.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe taglib-2.0-r0: task do_patch: Succeeded
NOTE: Running task 824 of 925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_generate_toolchain_file)
NOTE: recipe taglib-2.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-2.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 308 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 901 of 925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 912 of 925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_collect_spdx_deps)
NOTE: recipe taglib-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe taglib-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe taglib-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 913 of 925 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_configure)
NOTE: recipe taglib-2.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pk
 gconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 13.2.0
| -- The CXX compiler identification is GNU 13.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Looking for sys/types.h
| -- Looking for sys/types.h - found
| -- Looking for stdint.h
| -- Looking for stdint.h - found
| -- Looking for stddef.h
| -- Looking for stddef.h - found
| -- Check size of short
| -- Check size of short - done
| -- Check size of int
| -- Check size of int - done
| -- Check size of long long
| -- Check size of long long - done
| -- Check size of wchar_t
| -- Check size of wchar_t - done
| -- Check size of float
| -- Check size of float - done
| -- Check size of double
| -- Check size of double - done
| -- Performing Test HAVE_GCC_BYTESWAP
| -- Performing Test HAVE_GCC_BYTESWAP - Success
| -- Performing Test HAVE_ISO_STRDUP
| -- Performing Test HAVE_ISO_STRDUP - Failed
| -- Found ZLIB: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/recipe-sysroot/usr/lib/libz.so (found version "1.3")
| CMake Error at CMakeLists.txt:157 (message):
|   utfcpp not found.  Either install package (probably utfcpp, utf8cpp, or
|   libutfcpp-dev) or fetch the git submodule using
| 
|   git submodule update --init
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/temp/run.do_configure.2979851:164 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/taglib-2.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/
 x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_SHARED_LIBS=ON -DCMAKE_DISABLE_FIND_PACKAGE_Boost=TRUE -DHAVE_BOOST_BYTESWAP=FALSE -DCMAKE_CXX_STANDARD=11 -DCMAKE_CXX_STANDARD_REQUIRED=OFF -DLIB_SUFFIX= -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/temp/run.do_configure.2979851, line 164
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/temp/run.do_configure.2979851, line 143
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/temp/run.do_configure.2979851, line 182
NOTE: recipe taglib-2.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 913 tasks of which 906 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215172548.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215172548.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: taglib-2.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/temp/run.do_configure.2979851', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/taglib/2.0/temp/log.do_configure.2979851
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/taglib/taglib_2.0.bb:do_configure) failed with exit code '1'

--===============2030590621906355735==--

