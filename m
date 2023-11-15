Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C81BC54FC7
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.14634.1700059031187577127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VwdEwMiZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=byhLQABQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018bd36a28ed-dbfb2430-2aea-4c9e-b75f-7119a9b33ff8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OP5/WGeLwAD+hMcnfMko/mkgyl3S1T+9IykznvV3eXA=;
	b=VwdEwMiZkzNjgsW0SnbD5LFbWusqLGnxGsmDo5vwZZQKZ6/DXpumS2QhaAAWvmco
	SwVMEK2sL3jfd2zNIncbaNioXI1KsMgXYr+mwKQXweFEFygXVh9w6kOOqdWHO7+JUxC
	7zj6fePwJnGx8D8yZ1aBxuZSjXxPCkqE80phA/Lg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OP5/WGeLwAD+hMcnfMko/mkgyl3S1T+9IykznvV3eXA=;
	b=byhLQABQHrJqbY8GHbSpKpnrhKRbFAhiFtAFHVDyhzbP6zDbdqQFkql5jSnIxI4T
	FbcQlBm22jRxLTpWb5gbyNVK3+vBWQflkye9yk1w/295Y7LGQ/TvHFgb+uPHNt9BYmU
	6Mlc995+ivpbs/nH7yhRQPpWd/EFU1Onn+A0Wt48=
Content-Type: multipart/mixed; boundary="===============4954261908126518921=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.268.0 FAILED
Message-ID: <0101018bd36a28ed-dbfb2430-2aea-4c9e-b75f-7119a9b33ff8-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190681

--===============4954261908126518921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.268.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.261.1-1.3.268.0.patch
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
From 8ee6077f16225b21965d5a3f4793022cd500b7be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 10:42:45 +0000
Subject: [PATCH] glslang: upgrade 1.3.261.1 -> 1.3.268.0

---
 .../glslang/{glslang_1.3.261.1.bb => glslang_1.3.268.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.261.1.bb => glslang_1.3.268.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb b/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
index e607045148..668184ba62 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "76b52ebf77833908dc4c0dd6c70a9c357ac720bd"
+SRCREV = "36d08c0d940cf307a23928299ef52c7970d8cee6"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.39.2


--===============4954261908126518921==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.261.1-1.3.268.0.patch"

RnJvbSA4ZWU2MDc3ZjE2MjI1YjIxOTY1ZDVhM2Y0NzkzMDIyY2Q1MDBiN2JlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTA6NDI6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yNjEuMSAtPiAxLjMuMjY4LjAKCi0tLQogLi4uL2dsc2xhbmcv
e2dsc2xhbmdfMS4zLjI2MS4xLmJiID0+IGdsc2xhbmdfMS4zLjI2OC4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI2MS4xLmJiID0+IGds
c2xhbmdfMS4zLjI2OC4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI2MS4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjY4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjYxLjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI2OC4w
LmJiCmluZGV4IGU2MDcwNDUxNDguLjY2ODE4NGJhNjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI2MS4xLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI2OC4wLmJiCkBAIC04LDcgKzgsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVm
ZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2Ug
JiBNSVQgJiBBcGFjaGUtMi4wICYgR1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0Y2Zk
YTQ1ZmU4MDdkYzMiCiAKLVNSQ1JFViA9ICI3NmI1MmViZjc3ODMzOTA4ZGM0YzBkZDZjNzBhOWMz
NTdhYzcyMGJkIgorU1JDUkVWID0gIjM2ZDA4YzBkOTQwY2YzMDdhMjM5MjgyOTllZjUyYzc5NzBk
OGNlZTYiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
Z2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAKMi4z
OS4yCgo=

--===============4954261908126518921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-b50c523cc5e82708d0d9177b48f6173e2fc4476c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b50c523cc5e82708d0d9177b48f6173e2fc4476c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 78 Local 66 Mirrors 0 Missed 12 Current 229 (84% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 237 of 307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 619 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 282 of 307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 289 of 307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 291 of 307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_recipe_qa unihash changed to 38c1371540d7c87106327ef9feb8e9715cc0648572c70edbadbe22a3e4b5f82b
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 812 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_unpack)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 307 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 887 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.268.0-r0: task do_unpack: Succeeded
NOTE: Running task 896 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_patch)
NOTE: Running task 897 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_collect_spdx_deps)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.268.0-r0: task do_patch: Succeeded
NOTE: Running task 898 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 899 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_generate_toolchain_file)
NOTE: Running task 900 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_populate_lic: Started
NOTE: recipe glslang-1_1.3.268.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.268.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_deploy_source_date_epoch unihash changed to dc5fdaa3ce134504fc2cd5b8a2fd610ba379d210911838d35b8ab6aebd0df18d
NOTE: recipe glslang-1_1.3.268.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_populate_lic unihash changed to ad2b6ac14743ab5564d791eebaedc104a99009d6d310a8ebad240b97aeecaa50
NOTE: Setscene tasks completed
NOTE: Running task 901 of 913 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.268.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipe
 s-devtools/python/python3_3.11.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'quilt-native', 'ninja-native', 'patch-native', 'pseudo-native', 'python3-native', 're2c-native', 'libedit-native', 'openssl-native', 'util-linux-libuuid-native', 'expat-native', 'zlib-native', 'sqlite3-native', 'libffi-native', 'xz-native', 'gdbm-native', 'libtool-native', 'bzip2-native', 'ncurses-native', 'libnsl2-native', 'libtirpc-native', 'attr-native', 'libgcc', 'linux-libc-headers', 'zstd-native', 'texinfo-dummy-native', 'gmp-native', 'libmpc-native', 'flex-native', 'mpfr-native', 'binutils-cross-x86_64', 'gnu-config-native', 'perl-native', 'gettext-minimal-native', 'm4-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 13.2.0
| -- The CXX compiler identification is GNU 13.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- optimizer enabled
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
| CMake Error at CMakeLists.txt:280 (message):
|   ENABLE_OPT set but SPIR-V tools not found.  Please run
|   update_glslang_sources.py, set the ALLOW_EXTERNAL_SPIRV_TOOLS option to use
|   a local install of SPIRV-Tools, or set ENABLE_OPT=0.
| 
| 
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
| -- Found Threads: TRUE
| -- Found Python3: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/python3-native/python3 (found version "3.11.5") found components: Interpreter
| -- Configuring incomplete, errors occurred!
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1175993:168 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/python3-native/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/pyt
 hon3-native/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/recipe-sysroot-native/usr/bin/python3-native/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DENABLE_PCH=OFF -DENABLE_CTEST=OFF -DBUILD_EXTERNAL=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1175993, line 168
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1175993, line 147
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1175993, line 186
NOTE: recipe glslang-1_1.3.268.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 901 tasks of which 891 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115104201.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115104201.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: glslang-1_1.3.268.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/run.do_configure.1175993', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/glslang/1.3.268.0/temp/log.do_configure.1175993
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb:do_configure) failed with exit code '1'

--===============4954261908126518921==--

