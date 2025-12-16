Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77142D5E38D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17191.1765872143528324452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iJBuEbDt;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=otor1Fxr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262ed13b-83b1f9a7-74f5-4b89-b0fb-5d58554eea02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ix3BMtl+z80I4N71mEYLoZW4N+mq2GY1qs74xaN4y3Q=;
	b=iJBuEbDtzMefDK3B4I8f7xPyAg27GuSVapCjgLKmdrG4s45q1ARUf6kG8w4bLI8c
	cVgditJYsV/bo2+LWDFAzbERUV0nRWXRFAlrtPSHSah76FljtIZriXJ7yIDgV4Fkdy9
	meVz6PhEHelbzpvmnt8kO+muZTOY3l+HgZMCHGSA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ix3BMtl+z80I4N71mEYLoZW4N+mq2GY1qs74xaN4y3Q=;
	b=otor1FxrLgzsgrWDrwY8MxC3DE6RgFm1zu+6Qd3hQ17G4EAWHI6VH883M6iVZCHY
	kGVRhqsUe+Ff2TYJfgqzIjwQ76+1np3NBEG1pTqlCzx38tnDe5kVUHqMsx0M4B5gsRK
	ND6davCpljBDSigYujM8tWLA5ApLcPahKnrpDcS4=
Content-Type: multipart/mixed; boundary="===============4465080487424213027=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.4.335.0 FAILED
Message-ID: <0101019b262ed13b-83b1f9a7-74f5-4b89-b0fb-5d58554eea02-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227876

--===============4465080487424213027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-utility-libraries* to *1.4.335.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.4.328.1-1.4.335.0.patch
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
From b2c972d5d80e0dca5f49f2eaf2d225233c7a0d9d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:06:58 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.4.328.1 -> 1.4.335.0

---
 ...ies_1.4.328.1.bb => vulkan-utility-libraries_1.4.335.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.328.1.bb => vulkan-utility-libraries_1.4.335.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb
index d59efaaaee..adeca17348 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "4322db5906e67b57ec9c327e6afe3d98ed893df7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
+SRCREV = "c010c19e796035e92fb3b0462cb887518a41a7c1"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============4465080487424213027==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.4.328.1-1.4.335.0.patch"

RnJvbSBiMmM5NzJkNWQ4MGUwZGNhNWY0OWYyZWFmMmQyMjUyMzNjN2EwZDlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6MDY6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXM6IHVwZ3JhZGUgMS40LjMyOC4xIC0+IDEuNC4zMzUuMAoK
LS0tCiAuLi5pZXNfMS40LjMyOC4xLmJiID0+IHZ1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQu
MzM1LjAuYmJ9IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi11
dGlsaXR5LWxpYnJhcmllc18xLjQuMzI4LjEuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVz
XzEuNC4zMzUuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQuMzI4LjEuYmIgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQuMzM1LjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjMyOC4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjQuMzM1
LjAuYmIKaW5kZXggZDU5ZWZhYWFlZS4uYWRlY2ExNzM0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjMyOC4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFy
aWVzXzEuNC4zMzUuMC5iYgpAQCAtOSw4ICs5LDggQEAgU0VDVElPTiA9ICJsaWJzIgogTElDRU5T
RSA9ICJBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDtt
ZDU9NGNhMmQ2Nzk5MDkxYWFhOThhODUyMGYxYjc5MzkzOWIiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVV0aWxpdHktTGlicmFyaWVzLmdpdDticmFu
Y2g9dnVsa2FuLXNkay0xLjQuMzI4O3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjQzMjJkYjU5
MDZlNjdiNTdlYzljMzI3ZTZhZmUzZDk4ZWQ4OTNkZjciCitTUkNfVVJJID0gImdpdDovL2dpdGh1
Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1VdGlsaXR5LUxpYnJhcmllcy5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiYzAxMGMxOWU3OTYwMzVlOTJmYjNiMDQ2MmNi
ODg3NTE4YTQxYTdjMSIKIAogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gInZ1bGthbiIKIAot
LSAKMi40Ny4xCgo=

--===============4465080487424213027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-65477d70106d9421970c2f252877ac621434fc2a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:65477d70106d9421970c2f252877ac621434fc2a"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 86 Local 77 Mirrors 0 Missed 9 Current 277 (89% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 326 of 363 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 362 of 363 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 363 of 363 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1059 of 1079 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_fetch)
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_fetch: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 1079 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_unpack)
NOTE: Running task 1061 of 1079 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_unpack: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_unpack: Succeeded
NOTE: Running task 1062 of 1079 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_patch)
NOTE: Running task 1063 of 1079 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_patch: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 1079 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1067 of 1079 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysroot', 'virtual:native:/srv
 /pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'linux-libc-headers', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 15.2.0
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Warning at CMakeLists.txt:27 (find_package):
|   Could not find a configuration file for package "VulkanHeaders" that is
|   compatible with requested version "1.4.335".
| 
|   The following configuration files were considered but not accepted:
| 
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/recipe-sysroot/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake, version: 1.4.328
|       The version found is not compatible with the version requested.
| 
| 
| 
| -- Configuring done (0.3s)
| CMake Error at src/layer/CMakeLists.txt:20 (target_link_Libraries):
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
| CMake Error at src/vulkan/CMakeLists.txt:20 (target_link_Libraries):
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/temp/run.do_configure.2642845:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/sources/vulkan-utility-libraries-1.4.335.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPytho
 n3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/temp/run.do_configure.2642845, line 162
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/temp/run.do_configure.2642845, line 141
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/temp/run.do_configure.2642845, line 180
NOTE: recipe vulkan-utility-libraries-1.4.335.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1067 tasks of which 1060 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216050645.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216050645.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/temp/log.do_configure.2642845
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-utility-libraries-1.4.335.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/temp/run.do_configure.2642845' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.335.0/temp/log.do_configure.2642845
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.335.0.bb:do_configure) failed with exit code '1'

--===============4465080487424213027==--

