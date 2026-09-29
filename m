Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04512CA5FB1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1851.1790662724123273680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=csuLdlOn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iJejthfJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0ebd0c706-23deb188-72aa-469e-9f17-ce44ba289703-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662723;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Mnnr2NS0ES7LR+akQeVnG537jSfak5GTnSSIHCjt9Yc=;
	b=csuLdlOnC/NQvGPWD3EgFsB48Dz3pGCoDFfSLIo2UJtIphH4fERpcWO+nuHTCDpf
	88WB+ucmOkxwoN9NTeTxTDI0DtfRzZzIuBn6NQf0iUsqWKiwQRohSx8nMYsKbDzlFLd
	uJjeoy/RoeeIeM4CyHbJ3qXtsct1+rH4ZTo6xJ7s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662723;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Mnnr2NS0ES7LR+akQeVnG537jSfak5GTnSSIHCjt9Yc=;
	b=iJejthfJ+NyyHdE1I4eUv5NV/qcSqWFm4w+pvbDZ/gku++JyBD1DaKewJszfDR1N
	rpYUB4zEvmJ7w249TZ1rQiAoM/OFC/Ot7x10Kn44BB6WA0IpYccOwRVFNpN2lrnfJ3j
	NbY/RP2YKhWbB/lkW1VfhgP3PX6POpy056jk9e3Y=
Content-Type: multipart/mixed; boundary="===============5414218084913396023=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.4.363.0 FAILED
Message-ID: <010101a0ebd0c706-23deb188-72aa-469e-9f17-ce44ba289703-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246831

--===============5414218084913396023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-utility-libraries* to *1.4.363.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.4.357.0-1.4.363.0.patch
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
From ab3ac3499271fea2cf10b375d7ea82b2efc2156b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 05:53:30 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.4.357.0 -> 1.4.363.0

build: Update to header v1.4.363
safe: Handle Sampler in VkDescriptorMappingSourceDataEXT
build: Update to header v1.4.362
build: Update to header v1.4.361
build: Update to header v1.4.360
build: Check if Vulkan-Headers is an ALIAS target
build: Update to header v1.4.359
build: Avoid AppleClang using the wrong headers
cmake: support shared utility libraries
build: Update to header v1.4.358
---
 ...aries_1.4.357.0.bb => vulkan-utility-libraries_1.4.363.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.357.0.bb => vulkan-utility-libraries_1.4.363.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb
index c750428d09..45ffa83af1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "e9585c3e3d41ab608ee3b098ce4721d357308fc8"
+SRCREV = "57f01541b3959f2528f769043396e882851a7e75"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============5414218084913396023==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.4.357.0-1.4.363.0.patch"

RnJvbSBhYjNhYzM0OTkyNzFmZWEyY2YxMGIzNzVkN2VhODJiMmVmYzIxNTZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDU6NTM6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXM6IHVwZ3JhZGUgMS40LjM1Ny4wIC0+IDEuNC4zNjMuMAoK
YnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNjMKc2FmZTogSGFuZGxlIFNhbXBsZXIgaW4g
VmtEZXNjcmlwdG9yTWFwcGluZ1NvdXJjZURhdGFFWFQKYnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIg
djEuNC4zNjIKYnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNjEKYnVpbGQ6IFVwZGF0ZSB0
byBoZWFkZXIgdjEuNC4zNjAKYnVpbGQ6IENoZWNrIGlmIFZ1bGthbi1IZWFkZXJzIGlzIGFuIEFM
SUFTIHRhcmdldApidWlsZDogVXBkYXRlIHRvIGhlYWRlciB2MS40LjM1OQpidWlsZDogQXZvaWQg
QXBwbGVDbGFuZyB1c2luZyB0aGUgd3JvbmcgaGVhZGVycwpjbWFrZTogc3VwcG9ydCBzaGFyZWQg
dXRpbGl0eSBsaWJyYXJpZXMKYnVpbGQ6IFVwZGF0ZSB0byBoZWFkZXIgdjEuNC4zNTgKLS0tCiAu
Li5hcmllc18xLjQuMzU3LjAuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuNC4zNjMu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdXRpbGl0eS1s
aWJyYXJpZXNfMS40LjM1Ny4wLmJiID0+IHZ1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQuMzYz
LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjM1Ny4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjM2My4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXV0aWxpdHktbGlicmFyaWVzXzEuNC4zNTcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjM2My4wLmJiCmlu
ZGV4IGM3NTA0MjhkMDkuLjQ1ZmZhODNhZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuNC4zNTcuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQu
MzYzLjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDRU5TRSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NGNhMmQ2Nzk5MDkxYWFhOThhODUy
MGYxYjc5MzkzOWIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAv
VnVsa2FuLVV0aWxpdHktTGlicmFyaWVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwczt0
YWc9dnVsa2FuLXNkay0ke1BWfSIKLVNSQ1JFViA9ICJlOTU4NWMzZTNkNDFhYjYwOGVlM2IwOThj
ZTQ3MjFkMzU3MzA4ZmM4IgorU1JDUkVWID0gIjU3ZjAxNTQxYjM5NTlmMjUyOGY3NjkwNDMzOTZl
ODgyODUxYTdlNzUiCiAKIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ2dWxrYW4iCiAKLS0g
CjIuNDcuMQoK

--===============5414218084913396023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-53bcaf1a589a7b4613c82211894fa3fc806442ed"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:53bcaf1a589a7b4613c82211894fa3fc806442ed"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 156 Local 143 Mirrors 0 Missed 13 Current 226 (91% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 917 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_recipe_qa)
NOTE: Running task 996 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1015 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_fetch)
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_fetch: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_fetch: Succeeded
NOTE: Running task 1016 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_unpack)
NOTE: Running task 1017 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_unpack: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_patch)
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_patch: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_patch: Succeeded
NOTE: Running task 1019 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1020 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_generate_toolchain_file)
NOTE: Running task 1021 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_populate_lic)
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1022 of 1034 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.4.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv
 /pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'linux-libc-headers', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| The no-dev option is deprecated.  Use -Wno-author instead.
| -- The CXX compiler identification is GNU 16.2.0
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Warning at CMakeLists.txt:27 (find_package):
|   Could not find a configuration file for package "VulkanHeaders" that is
|   compatible with requested version "1.4.363".
| 
|   The following configuration files were considered but not accepted:
| 
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/recipe-sysroot/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake, version: 1.4.357
|       The version found is not compatible with the version requested.
| 
| 
| 
| -- Configuring done (0.3s)
| CMake Error at src/layer/CMakeLists.txt:26 (target_link_Libraries):
|   Target "VulkanLayerSettings" links to:
| 
|     Vulkan::Headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| CMake Error at src/vulkan/CMakeLists.txt:26 (target_link_Libraries):
|   Target "VulkanSafeStruct" links to:
| 
|     Vulkan::Headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| CMake Error at include/CMakeLists.txt:38 (target_link_libraries):
|   The link interface of target "VulkanUtilityHeaders" contains:
| 
|     Vulkan::Headers
| 
|   but the target was not found.  Possible reasons include:
| 
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
| 
| 
| 
| -- Generating done (0.0s)
| CMake Warning (unused-cli):
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/temp/run.do_configure.983101:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/sources/vulkan-utility-libraries-1.4.363.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython
 3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/temp/run.do_configure.983101, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/temp/run.do_configure.983101, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/temp/run.do_configure.983101, line 179
NOTE: recipe vulkan-utility-libraries-1.4.363.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1022 tasks of which 1012 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260929055313.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260929055313.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/temp/log.do_configure.983101
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-utility-libraries-1.4.363.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/temp/run.do_configure.983101' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.363.0/temp/log.do_configure.983101
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb:do_configure) failed with exit code '1'

--===============5414218084913396023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vulkan-utility-libraries-changelog.txt"

build: Update to header v1.4.363
safe: Handle Sampler in VkDescriptorMappingSourceDataEXT
build: Update to header v1.4.362
build: Update to header v1.4.361
build: Update to header v1.4.360
build: Check if Vulkan-Headers is an ALIAS target
build: Update to header v1.4.359
build: Avoid AppleClang using the wrong headers
cmake: support shared utility libraries
build: Update to header v1.4.358

--===============5414218084913396023==--

