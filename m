Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14397CD5BCA
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34770.1778851238068324047
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rGVz/P+2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J8eJXY6s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcbd5b5-2721f251-9ed6-4929-9f8a-b486464a4bb4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851239;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZmtrWglxt0yWe+swJGsXBoYBJ8+415AsquxFYyc+Cuc=;
	b=rGVz/P+2PdZxTKCryL6r4kNrRPVuXt1kcIupvaCPdLI4FDGiQ1j4W0XXRlzwCydv
	MKMFTx1+f+eJ3nAsXBl0GlH4Pbh5/64Sci63Z+IuBGloYA1vfIetaqcBsQUih30B4JD
	friqKDDsn8ZNwuYMUoPoCad6XZUxmbhhYxuLbE4I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851239;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZmtrWglxt0yWe+swJGsXBoYBJ8+415AsquxFYyc+Cuc=;
	b=J8eJXY6sq30bqGfc3ghGFKKomYS9zr4n3Imct4E1Q59Yv8JHQ6C6ziQFCW2w1nqo
	Vo4LAEXE9LsremrzHDBDiQs+d2SwNELES7nH5/muzIMGkSMGcgT9eHVXngSBHqyc0gx
	Xp6uxceEUjYD2BEUjpDhJyBfs0/eRLPPt5uBC34Y=
Content-Type: multipart/mixed; boundary="===============7624813453745763206=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.4.350.0 FAILED
Message-ID: <0101019e2bcbd5b5-2721f251-9ed6-4929-9f8a-b486464a4bb4-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237147

--===============7624813453745763206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-utility-libraries* to *1.4.350.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.4.341.0-1.4.350.0.patch
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
From 414e48ffff359e7dbbc4821ea93b0242edf874e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 10:34:40 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.4.341.0 -> 1.4.350.0

---
 ...aries_1.4.341.0.bb => vulkan-utility-libraries_1.4.350.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.341.0.bb => vulkan-utility-libraries_1.4.350.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb
index 46d317adce..600d88dcea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "a663eca87ba71294dd4b74ba9d3e64a72d725453"
+SRCREV = "a96bd4933c6adfc21329d15e9999791a0153bbf3"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============7624813453745763206==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSA0MTRlNDhmZmZmMzU5ZTdkYmJjNDgyMWVhOTNiMDI0MmVkZjg3NGUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTA6MzQ6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdXRpbGl0eS1saWJyYXJpZXM6IHVwZ3JhZGUgMS40LjM0MS4wIC0+IDEuNC4zNTAuMAoK
LS0tCiAuLi5hcmllc18xLjQuMzQxLjAuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEu
NC4zNTAuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdXRp
bGl0eS1saWJyYXJpZXNfMS40LjM0MS4wLmJiID0+IHZ1bGthbi11dGlsaXR5LWxpYnJhcmllc18x
LjQuMzUwLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjM0MS4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjM1MC4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuNC4zNDEuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS40LjM1MC4w
LmJiCmluZGV4IDQ2ZDMxN2FkY2UuLjYwMGQ4OGRjZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEuNC4zNDEuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmll
c18xLjQuMzUwLjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDRU5TRSA9ICJBcGFjaGUtMi4wIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9NGNhMmQ2Nzk5MDkxYWFh
OThhODUyMGYxYjc5MzkzOWIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9z
R3JvdXAvVnVsa2FuLVV0aWxpdHktTGlicmFyaWVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1o
dHRwczt0YWc9dnVsa2FuLXNkay0ke1BWfSIKLVNSQ1JFViA9ICJhNjYzZWNhODdiYTcxMjk0ZGQ0
Yjc0YmE5ZDNlNjRhNzJkNzI1NDUzIgorU1JDUkVWID0gImE5NmJkNDkzM2M2YWRmYzIxMzI5ZDE1
ZTk5OTk3OTFhMDE1M2JiZjMiCiAKIFJFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ2dWxrYW4i
CiAKLS0gCjIuNDcuMQoK

--===============7624813453745763206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-1ec2c372317f5972ab1f6c57d4ac32df826cc0ce"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:1ec2c372317f5972ab1f6c57d4ac32df826cc0ce"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 106 Local 93 Mirrors 0 Missed 13 Current 323 (87% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 984 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_recipe_qa)
NOTE: Running task 1050 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1069 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_fetch)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_fetch: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_unpack)
NOTE: Running task 1071 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_unpack: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_patch)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_patch: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_patch: Succeeded
NOTE: Running task 1073 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1074 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_generate_toolchain_file)
NOTE: Running task 1075 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_populate_lic)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1076 of 1088 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv
 /pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconf/pkgconf_2.5.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'vulkan-headers', 'linux-libc-headers', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconf-native', 'pseudo-native', 'bzip2-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The CXX compiler identification is GNU 15.2.0
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| CMake Warning at CMakeLists.txt:27 (find_package):
|   Could not find a configuration file for package "VulkanHeaders" that is
|   compatible with requested version "1.4.350".
| 
|   The following configuration files were considered but not accepted:
| 
|     /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/recipe-sysroot/usr/share/cmake/VulkanHeaders/VulkanHeadersConfig.cmake, version: 1.4.341
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/temp/run.do_configure.2543076:161 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/sources/vulkan-utility-libraries-1.4.350.0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPytho
 n3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DBUILD_TESTS=OFF -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/temp/run.do_configure.2543076, line 161
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/temp/run.do_configure.2543076, line 140
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/temp/run.do_configure.2543076, line 179
NOTE: recipe vulkan-utility-libraries-1.4.350.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1076 tasks of which 1066 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515103426.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515103426.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/temp/log.do_configure.2543076
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-utility-libraries-1.4.350.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/temp/run.do_configure.2543076' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/vulkan-utility-libraries/1.4.350.0/temp/log.do_configure.2543076
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.350.0.bb:do_configure) failed with exit code '1'

--===============7624813453745763206==--

