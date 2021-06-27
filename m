Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5884.1624805202679484171
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0371C38C1290
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:42 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2021.1 SUCCEEDED
Message-ID: <MADEUP.168C77B9314AEDB7.17375@lists.openembedded.org>
X-Groupsio-MsgNum: 153312
Content-Type: multipart/mixed; boundary="===============1680202644250123517=="

--===============1680202644250123517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2021.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2021.0-2021.1.patch
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

--===============1680202644250123517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 59 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ea76b8a32a77c3b61757f797fb143d0cf60f094e"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ea76b8a32a77c3b61757f797fb143d0cf60f094e"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 0 Network 0 Missed 26 Current 747 (0% match, 96% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1562 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_fetch)
NOTE: Running task 1661 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_fetch)
NOTE: Running task 1662 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_fetch)
NOTE: Running task 1735 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_fetch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Started
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Succeeded
NOTE: Running task 2061 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_unpack)
NOTE: Running task 2062 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Started
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2107 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_unpack)
NOTE: Running task 2108 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2138 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_unpack)
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2156 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_unpack)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Started
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Started
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_patch)
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_patch)
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_generate_toolchain_file)
NOTE: recipe shaderc-2021.1-r0: task do_patch: Started
NOTE: Running task 2292 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2293 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2294 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2295 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2296 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2297 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Started
NOTE: recipe shaderc-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2298 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 2299 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2300 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic)
NOTE: recipe glslang-11.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_generate_toolchain_file)
NOTE: Running task 2302 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2303 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 2304 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Started
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 841825cfc653d46a4b24e061c26555a5a0ddc6388490cee7a6ee60ef81e77c87
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic unihash changed to 644e124593288c73e4ca66465a52e661e0a5e87adafee06e9a1ee4861bde6edb
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2368 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Succeeded
NOTE: Running task 2369 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_compile)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2370 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b78b5efb05abe13a8acf5c0eb54a13e47fc93ebb9c7c23ee3f2dc7022fb6c093
NOTE: Setscene tasks completed
NOTE: Running task 2412 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Succeeded
NOTE: Running task 2414 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2415 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe glslang-11.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_compile)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2417 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_packagedata)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2420 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_compile)
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_install)
NOTE: recipe glslang-11.4.0-r0: task do_install: Started
NOTE: recipe glslang-11.4.0-r0: task do_install: Succeeded
NOTE: Running task 2423 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package)
NOTE: Running task 2424 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_populate_sysroot)
NOTE: recipe glslang-11.4.0-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_install)
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package)
NOTE: Running task 2427 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_packagedata)
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Started
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package_write_rpm)
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2430 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2431 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_configure)
NOTE: recipe shaderc-2021.1-r0: task do_configure: Started
NOTE: recipe shaderc-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_compile)
NOTE: recipe shaderc-2021.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_packagedata)
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package_write_rpm)
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_install)
NOTE: recipe shaderc-2021.1-r0: task do_install: Started
NOTE: recipe shaderc-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package)
NOTE: Running task 2437 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_package: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_packagedata)
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Started
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_write_rpm)
NOTE: Running task 2440 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_qa)
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2441 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2441 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1680202644250123517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 50 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ea76b8a32a77c3b61757f797fb143d0cf60f094e"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ea76b8a32a77c3b61757f797fb143d0cf60f094e"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 0 Network 0 Missed 26 Current 747 (0% match, 96% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1562 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_fetch)
NOTE: Running task 1661 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_fetch)
NOTE: Running task 1662 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_fetch)
NOTE: Running task 1735 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_fetch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Started
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Succeeded
NOTE: Running task 2040 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_unpack)
NOTE: Running task 2041 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Started
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2110 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_unpack)
NOTE: Running task 2111 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2112 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_unpack)
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2156 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_unpack)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Started
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Started
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_generate_toolchain_file)
NOTE: Running task 2291 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2292 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2293 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2294 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2295 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2296 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2297 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_patch: Started
NOTE: recipe shaderc-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2298 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 2299 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2300 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic)
NOTE: recipe glslang-11.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_generate_toolchain_file)
NOTE: Running task 2302 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2303 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 2304 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b206359c4ac281199fb6df57609777e2913cb5d2d36821e97aa72a53628a6f43
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic unihash changed to 644e124593288c73e4ca66465a52e661e0a5e87adafee06e9a1ee4861bde6edb
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_compile)
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2369 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Started
NOTE: recipe glslang-11.4.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2370 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 660310fae8a1a52d1e7a820ecf75e948b1dd6e0c3c2b79e4331d33c58a528489
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2378 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2379 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package)
NOTE: Running task 2413 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_compile)
NOTE: recipe glslang-11.4.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2417 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_packagedata)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2420 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_compile)
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_install)
NOTE: recipe glslang-11.4.0-r0: task do_install: Started
NOTE: recipe glslang-11.4.0-r0: task do_install: Succeeded
NOTE: Running task 2423 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package)
NOTE: Running task 2424 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_populate_sysroot)
NOTE: recipe glslang-11.4.0-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_install)
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package)
NOTE: Running task 2427 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_packagedata)
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Started
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2429 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package_write_rpm)
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2431 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_configure)
NOTE: recipe shaderc-2021.1-r0: task do_configure: Started
NOTE: recipe shaderc-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_compile)
NOTE: recipe shaderc-2021.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_packagedata)
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package_write_rpm)
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_install)
NOTE: recipe shaderc-2021.1-r0: task do_install: Started
NOTE: recipe shaderc-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package)
NOTE: Running task 2437 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_package: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_packagedata)
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Started
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_write_rpm)
NOTE: Running task 2440 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_qa)
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2441 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2441 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1680202644250123517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 41 skipped, 0 masked, 0 errors.
Removing 109 recipes from the core2-32 sysroot...done.
Removing 114 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ea76b8a32a77c3b61757f797fb143d0cf60f094e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ea76b8a32a77c3b61757f797fb143d0cf60f094e"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 567 Local 540 Network 0 Missed 27 Current 217 (95% match, 96% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 218 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 275 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 279 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 287 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 289 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 317 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 320 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 321 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 323 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 325 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 326 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 328 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 329 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 332 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 335 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 337 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 338 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 339 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 347 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 348 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 353 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 355 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 358 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 359 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 360 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 361 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 364 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 365 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 366 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 367 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 369 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_deploy_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 375 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 379 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 382 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 383 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 409 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 412 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 423 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 425 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 443 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: Running task 768 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_fetch)
NOTE: Running task 788 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_fetch)
NOTE: Running task 789 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_fetch)
NOTE: Running task 810 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Started
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Started
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Succeeded
NOTE: Running task 1047 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 455 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1048 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_unpack)
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1049 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_unpack)
NOTE: Running task 1050 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_unpack)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Started
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Succeeded
NOTE: Running task 1101 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_patch)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Started
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1110 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_patch)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: recipe shaderc-2021.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Succeeded
NOTE: Running task 1119 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_generate_toolchain_file)
NOTE: Running task 1120 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1121 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_patch)
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1122 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe shaderc-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1147 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 1148 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1149 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 523 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1154 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 1155 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1156 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_generate_toolchain_file)
NOTE: Running task 1157 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic unihash changed to 644e124593288c73e4ca66465a52e661e0a5e87adafee06e9a1ee4861bde6edb
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 580 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1221 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.43+gitAUTOINC+67dad5ca86_ab49d2db98-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1235 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1239 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1280 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 1295 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1309 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1326 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1376 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1405 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1714c244078a4fc8ad24074ca8e8b148d9bbb24c33c14c3ff6dc015b55d698dc
NOTE: Running task 1422 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 778 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 779 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 782 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 784 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2053 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2113 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2431 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_configure)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Started
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2432 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_configure)
NOTE: recipe glslang-11.4.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Succeeded
NOTE: Running task 2433 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_compile)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Started
NOTE: recipe glslang-11.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2434 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_compile)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_install)
NOTE: recipe glslang-11.4.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2437 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2438 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_packagedata)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_compile)
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Succeeded
NOTE: Running task 2442 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2443 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_install)
NOTE: recipe glslang-11.4.0-r0: task do_install: Started
NOTE: recipe glslang-11.4.0-r0: task do_install: Succeeded
NOTE: Running task 2444 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package)
NOTE: Running task 2445 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_populate_sysroot)
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_packagedata)
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Started
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package_write_rpm)
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_install)
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2449 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package)
NOTE: Running task 2450 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2451 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2452 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_configure)
NOTE: recipe shaderc-2021.1-r0: task do_configure: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2453 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_packagedata)
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Started
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2454 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package_write_rpm)
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2455 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_compile)
NOTE: recipe shaderc-2021.1-r0: task do_compile: Started
NOTE: recipe shaderc-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2456 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_install)
NOTE: recipe shaderc-2021.1-r0: task do_install: Started
NOTE: recipe shaderc-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2457 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package)
NOTE: Running task 2458 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_package: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2459 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_packagedata)
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Started
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2460 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_write_rpm)
NOTE: Running task 2461 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_qa)
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2462 of 2462 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2462 tasks of which 2397 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1680202644250123517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ea76b8a32a77c3b61757f797fb143d0cf60f094e"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ea76b8a32a77c3b61757f797fb143d0cf60f094e"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 0 Network 0 Missed 26 Current 747 (0% match, 96% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1562 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_fetch)
NOTE: Running task 1661 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_fetch)
NOTE: Running task 1662 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_fetch)
NOTE: Running task 1735 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_fetch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Started
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Succeeded
NOTE: Running task 2001 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_unpack)
NOTE: Running task 2002 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2051 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_unpack)
NOTE: Running task 2065 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_unpack)
NOTE: Running task 2066 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2085 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_unpack)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Started
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Started
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_generate_toolchain_file)
NOTE: recipe shaderc-2021.1-r0: task do_patch: Started
NOTE: Running task 2292 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2293 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2294 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2295 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2296 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Started
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2297 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Started
NOTE: recipe shaderc-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2298 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 2299 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2300 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic)
NOTE: recipe glslang-11.4.0-r0: task do_patch: Started
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 2302 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glslang-11.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2303 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_generate_toolchain_file)
NOTE: Running task 2304 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic unihash changed to 644e124593288c73e4ca66465a52e661e0a5e87adafee06e9a1ee4861bde6edb
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 20bbe76526bfd1801d56326c498066373583d071fff3a0c7a66cd3f4855cf592
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2368 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_configure)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Succeeded
NOTE: Running task 2369 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_compile)
NOTE: recipe glslang-11.4.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Succeeded
NOTE: Running task 2370 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2371 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d90379b9043c10c2a9348500772ca090e85759aee9bfb44685d4d60671bfdccf
NOTE: Setscene tasks completed
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Started
NOTE: Running task 2414 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe glslang-11.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_compile)
NOTE: recipe glslang-11.4.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2417 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Succeeded
NOTE: Running task 2419 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_packagedata)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_compile)
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_install)
NOTE: recipe glslang-11.4.0-r0: task do_install: Started
NOTE: recipe glslang-11.4.0-r0: task do_install: Succeeded
NOTE: Running task 2423 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package)
NOTE: Running task 2424 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_populate_sysroot)
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_package: Succeeded
NOTE: Running task 2425 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_packagedata)
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Started
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2426 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package_write_rpm)
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_install)
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package)
NOTE: Running task 2429 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2430 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2431 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_configure)
NOTE: recipe shaderc-2021.1-r0: task do_configure: Started
NOTE: recipe shaderc-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_compile)
NOTE: recipe shaderc-2021.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_packagedata)
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Started
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package_write_rpm)
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_install)
NOTE: recipe shaderc-2021.1-r0: task do_install: Started
NOTE: recipe shaderc-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package)
NOTE: Running task 2437 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_package: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_packagedata)
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Started
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_write_rpm)
NOTE: Running task 2440 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_qa)
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2441 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2441 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1680202644250123517==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2021.0-2021.1.patch"

From 2b17a1b7756d6d78e967f03f3a9771e805d9aad1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 13:11:30 +0000
Subject: [PATCH] shaderc: upgrade 2021.0 -> 2021.1

---
 .../shaderc/{shaderc_2021.0.bb => shaderc_2021.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2021.0.bb => shaderc_2021.1.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2021.0.bb b/meta/recipes-graphics/shaderc/shaderc_2021.1.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2021.0.bb
rename to meta/recipes-graphics/shaderc/shaderc_2021.1.bb
index 3d59e0c38c..e15b5794ee 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2021.0.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2021.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "1a3e2aaab191f44644e899e29ab7bac50bebdeb8"
+SRCREV = "031a8c9715df5d7c69dcc1ee9d53cbfa35c7b026"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.17.1


--===============1680202644250123517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1457 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (817 cached, 1 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ea76b8a32a77c3b61757f797fb143d0cf60f094e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ea76b8a32a77c3b61757f797fb143d0cf60f094e"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 0 Network 0 Missed 26 Current 747 (0% match, 96% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1562 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_fetch)
NOTE: Running task 1661 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_fetch)
NOTE: Running task 1662 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_fetch)
NOTE: Running task 1735 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_fetch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Started
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_fetch: Succeeded
NOTE: Running task 1998 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_unpack)
NOTE: Running task 1999 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Started
NOTE: recipe glslang-11.4.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2061 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_unpack)
NOTE: Running task 2062 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_unpack)
NOTE: Running task 2063 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2099 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_unpack)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Started
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_patch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_generate_toolchain_file)
NOTE: Running task 2291 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2292 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2293 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2294 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Started
NOTE: recipe shaderc-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2295 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_patch)
NOTE: recipe shaderc-2021.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c26e00ca8ecd41900a5ec56f0e8feffbd4e276f028a9db6fcef41dcb579dede2
NOTE: recipe spirv-tools-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2359 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_patch)
NOTE: recipe glslang-11.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2360 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_patch)
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Started
NOTE: recipe glslang-11.4.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_configure: Succeeded
NOTE: Running task 2361 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_compile)
NOTE: recipe shaderc-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2362 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 2363 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2364 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic)
NOTE: recipe glslang-11.4.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2365 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_generate_toolchain_file)
NOTE: Running task 2366 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2367 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_generate_toolchain_file)
NOTE: Running task 2369 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Started
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_compile: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2370 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_install)
NOTE: recipe shaderc-2021.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_lic unihash changed to 644e124593288c73e4ca66465a52e661e0a5e87adafee06e9a1ee4861bde6edb
NOTE: recipe shaderc-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2371 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_configure)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 09c5a062478d866374a9bc75cff21db5e16fb9d07761b5edccd9a2dd3fc8de0f
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2378 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2379 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package)
NOTE: Running task 2413 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2416 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2417 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_compile: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2418 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_configure)
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_compile)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_packagedata)
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb:do_package_write_rpm)
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-headers-1.5.4+gitAUTOINC+bcf55210f1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glslang-11.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2422 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_install)
NOTE: recipe glslang-11.4.0-r0: task do_install: Started
NOTE: recipe glslang-11.4.0-r0: task do_install: Succeeded
NOTE: Running task 2423 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package)
NOTE: Running task 2424 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_populate_sysroot)
NOTE: recipe glslang-11.4.0-r0: task do_package: Started
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-11.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_install)
NOTE: recipe glslang-11.4.0-r0: task do_package: Succeeded
NOTE: Running task 2426 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_packagedata)
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Started
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
ERROR: glslang-11.4.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 0:11.5.0-r0 to 0:11.4.0-r0) [version-going-backwards]
NOTE: recipe glslang-11.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2427 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_11.4.0.bb:do_package_write_rpm)
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package)
NOTE: Running task 2429 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2430 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2431 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_configure)
NOTE: recipe shaderc-2021.1-r0: task do_configure: Started
NOTE: recipe shaderc-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_compile)
NOTE: recipe shaderc-2021.1-r0: task do_compile: Started
NOTE: recipe glslang-11.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_packagedata)
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_2021.1.bb:do_package_write_rpm)
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_install)
NOTE: recipe shaderc-2021.1-r0: task do_install: Started
NOTE: recipe shaderc-2021.1-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package)
NOTE: Running task 2437 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_populate_sysroot)
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Started
NOTE: recipe shaderc-2021.1-r0: task do_package: Started
NOTE: recipe shaderc-2021.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_packagedata)
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Started
NOTE: recipe shaderc-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_write_rpm)
NOTE: Running task 2440 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_package_qa)
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Started
NOTE: recipe shaderc-2021.1-r0: task do_package_qa: Succeeded
NOTE: recipe shaderc-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe spirv-tools-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2441 of 2441 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2021.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2441 tasks of which 2381 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1680202644250123517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PKGV changed from 2021.0 [default] to 2021.1 [default]
packages/core2-32-poky-linux/shaderc: PV changed from "2021.0" to "2021.1"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGSIZE changed from 6150872 to 6154360 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2021.0 [default] to 2021.1 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2021.0" to "2021.1"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 60998 to 61659 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2021.0 [default] to 2021.1 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2021.0" to "2021.1"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2021.0 [default] to 2021.1 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2021.0" to "2021.1"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2021.0 [default] to 2021.1 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2021.0" to "2021.1"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 314608 to 316734 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2021.0 [default] to 2021.1 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2021.0" to "2021.1"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2434794 to 2437078 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2021.0 [default] to 2021.1 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2021.0" to "2021.1"
packages/core2-32-poky-linux/shaderc/shaderc: PKGSIZE changed from 277940 to 282036 (+1%)
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2021.0 [default] to 2021.1 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2021.0" to "2021.1"

--===============1680202644250123517==--
