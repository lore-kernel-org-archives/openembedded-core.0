Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4479C41513
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1247.1715794338213667069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JR/APRdn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VRUMZpSI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018f7d4fe485-9bd29815-96aa-4c04-81f0-c34eb5af3881-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GFTdkJ61oSEXDG6weLVCxXQFx7IAws5xpkIPB9nmzsc=;
	b=JR/APRdnSqh+XLDkIl1sZbsNNWRLUVdGnwV3SPZ+i+6/A8InxPuO//mUQ6F0/UQ/
	vpc6UpgsOO8PKrqF1ZESaQWqbDGSnqrJjecjiAo5XcoVGHGKtiHdv229SdvjYlDwfOc
	I51xYh4zMkNroCP5vpxDeqdGAbQ8tnE5Z3epbcM4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GFTdkJ61oSEXDG6weLVCxXQFx7IAws5xpkIPB9nmzsc=;
	b=VRUMZpSIqPQ6zlIqLzOIUktdpu9AQSw78JG/bAlrjqpgJPhemcxMbKlui3MC552W
	XeBNsYeAXEp4n6SGVqjo6I+ts92CImiGMnDpQ6P71PIIEwijDIHAZhaUf3H9bIzGJhZ
	gdYbudK1Gz7idriwENSzlUYUpbuDW65mvy9pXwmA=
Content-Type: multipart/mixed; boundary="===============0089110188965718500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.283.0 FAILED
Message-ID: <0101018f7d4fe485-9bd29815-96aa-4c04-81f0-c34eb5af3881-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199381

--===============0089110188965718500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-validation-layers* to *1.3.283.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-validation-layers-upgrade-1.3.280.0-1.3.283.0.patch
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
From 770b0ac3f93bf02353222c3f192d0c02aa10330b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 14:35:20 +0000
Subject: [PATCH] vulkan-validation-layers: upgrade 1.3.280.0 -> 1.3.283.0

---
 ...ers_1.3.280.0.bb => vulkan-validation-layers_1.3.283.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.280.0.bb => vulkan-validation-layers_1.3.283.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
index c488309c91..6643e185cb 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.280;protocol=https"
-SRCREV = "8506077b9a25a00684e8be24b779733ae1405a54"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.283;protocol=https"
+SRCREV = "d5bed3e26b3d487e8d21f0cc39039351eac921a7"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============0089110188965718500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.3.280.0-1.3.283.0.patch"

RnJvbSA3NzBiMGFjM2Y5M2JmMDIzNTMyMjJjM2YxOTJkMGMwMmFhMTAzMzBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTQ6MzU6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdmFsaWRhdGlvbi1sYXllcnM6IHVwZ3JhZGUgMS4zLjI4MC4wIC0+IDEuMy4yODMuMAoK
LS0tCiAuLi5lcnNfMS4zLjI4MC4wLmJiID0+IHZ1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMu
MjgzLjAuYmJ9IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi12
YWxpZGF0aW9uLWxheWVyc18xLjMuMjgwLjAuYmIgPT4gdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJz
XzEuMy4yODMuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjgwLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjgzLjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI4MC4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjgz
LjAuYmIKaW5kZXggYzQ4ODMwOWM5MS4uNjY0M2UxODVjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI4MC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5
ZXJzXzEuMy4yODMuMC5iYgpAQCAtOCw4ICs4LDggQEAgU0VDVElPTiA9ICJsaWJzIgogTElDRU5T
RSA9ICJBcGFjaGUtMi4wICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS50eHQ7bWQ1PWNkM2MwYmMzNjZjZDliNmE5MDZlMjJmMGJjYjU5MTBmIgogCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1WYWxpZGF0aW9uTGF5ZXJzLmdp
dDticmFuY2g9dnVsa2FuLXNkay0xLjMuMjgwO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjg1
MDYwNzdiOWEyNWEwMDY4NGU4YmUyNGI3Nzk3MzNhZTE0MDVhNTQiCitTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1WYWxpZGF0aW9uTGF5ZXJzLmdpdDticmFu
Y2g9dnVsa2FuLXNkay0xLjMuMjgzO3Byb3RvY29sPWh0dHBzIgorU1JDUkVWID0gImQ1YmVkM2Uy
NmIzZDQ4N2U4ZDIxZjBjYzM5MDM5MzUxZWFjOTIxYTciCiAKIFMgPSAiJHtXT1JLRElSfS9naXQi
CiAKLS0gCjIuNDQuMAoK

--===============0089110188965718500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1879 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-9ca63aca9f944615639ca2065605bfe0190c4757"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9ca63aca9f944615639ca2065605bfe0190c4757"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 213 Local 201 Mirrors 0 Missed 12 Current 374 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1479 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_recipe_qa)
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1629 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_fetch: Succeeded
NOTE: Running task 1630 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_unpack)
NOTE: Running task 1631 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_unpack: Succeeded
NOTE: Running task 1632 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_patch)
NOTE: Running task 1633 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_patch: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_patch: Succeeded
NOTE: Running task 1634 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1635 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_generate_toolchain_file)
NOTE: Running task 1636 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_populate_lic)
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1637 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/glslang/glslang_1.3.280.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_
 1.3.280.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.280.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.280.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/y
 octo-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'texinfo-dummy-native', 'xz', 'glslang', 'spirv-headers', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'vulkan-utility-libraries', 'wayland', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdmcp', 'libxext', 'libxrandr', 'libxrender', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'gdbm', 'libffi', 'sqlite3', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmp
 c-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 13.2.0
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Could NOT find robin_hood (missing: robin_hood_DIR)
| -- Configuring done (0.4s)
| CMake Warning at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot/usr/lib/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake:70 (set_target_properties):
|   Target "vvl" requests linking to directory
|   "/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot/usr/lib".
|   Targets may link only to libraries.  CMake is dropping the item.
| Call Stack (most recent call first):
|   /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot/usr/lib/cmake/SPIRV-Tools/SPIRV-ToolsConfig.cmake:1 (include)
|   /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot-native/usr/share/cmake-3.28/Modules/CMakeFindDependencyMacro.cmake:76 (find_package)
|   /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot/usr/lib/cmake/SPIRV-Tools-opt/SPIRV-Tools-optConfig.cmake:2 (find_dependency)
|   CMakeLists.txt:85 (find_package)
| 
| 
| -- Generating done (0.0s)
| CMake Error at layers/CMakeLists.txt:68 (target_link_libraries):
|   Target "VkLayer_utils" links to:
| 
|     Vulkan::SafeStruct
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| CMake Warning:
|   Manually-specified variables were not used by the project:
| 
|     CMAKE_EXPORT_NO_PACKAGE_REGISTRY
|     FETCHCONTENT_FULLY_DISCONNECTED
|     LIB_SUFFIX
|     PYTHON_EXECUTABLE
|     Python3_EXECUTABLE
|     Python_EXECUTABLE
| 
| 
| CMake Generate step failed.  Build files cannot be regenerated correctly.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/temp/run.do_configure.2459912:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yo
 cto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -DUSE_ROBIN_HOOD_HASHING=OFF -DGLSLANG_INSTALL_DIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot/usr/lib -DVULKAN_HEADERS_INSTALL_DIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot/usr -DSPIRV_HEADERS_INSTALL_DIR=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/recipe-sysroot/usr -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=O
 N -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/temp/run.do_configure.2459912, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/temp/run.do_configure.2459912, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/temp/run.do_configure.2459912, line 180
NOTE: recipe vulkan-validation-layers-1.3.283.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1637 tasks of which 1627 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515143441.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240515143441.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-validation-layers-1.3.283.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/temp/run.do_configure.2459912', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.283.0/temp/log.do_configure.2459912
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb:do_configure) failed with exit code '1'

--===============0089110188965718500==--

