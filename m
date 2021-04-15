Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.1305.1618510599615473954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 41DF938C13F3
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 6.2.3 SUCCEEDED
Message-ID: <MADEUP.16761AD10A3DC3C7.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150529
Content-Type: multipart/mixed; boundary="===============6044208196304746923=="

--===============6044208196304746923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *6.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-6.2.2-6.2.3.patch
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

--===============6044208196304746923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1440 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e61e989aa79ddbfcafe3c6e4703131a0260932ba"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 31 Local 20 Network 0 Missed 11 Current 701 (64% match, 98% complete)
Removing 4 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 717 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 730 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Started
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1542 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_fetch)
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1912 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_unpack)
NOTE: Running task 1913 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_patch)
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2316 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic)
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic unihash changed to 9ff443df6c2b1de38e860a5baee6734a8ae6ca5c3d1fd7076fb72ef803cfd030
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2317 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_configure)
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_compile)
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_install)
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package)
NOTE: Running task 2321 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_packagedata)
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2324 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm)
NOTE: Running task 2325 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2326 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2327 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_write_rpm)
NOTE: Running task 2328 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_qa)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to ae8d6be11c1954c88ebf62bd45307c0b41c6c5a9e1add3164751215f6fe7bdb2
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm unihash changed to 9910da012e6781ae8c9ecb02b65272d9541d5972ec1aa48eb4591050f87d7e27
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm unihash changed to 29a23042b199ea86aeb1c5a9680e41e4ee512b80758dbabad06fcfd7d3b6c6b4
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm unihash changed to c1561ef99ab198d2f926cd9280ab69acedbc9a7fe3eb7e7c402a8c50aab0faaa
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2329 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2329 tasks of which 2310 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6044208196304746923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 66 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e61e989aa79ddbfcafe3c6e4703131a0260932ba"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 31 Local 20 Network 0 Missed 11 Current 701 (64% match, 98% complete)
Removing 4 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 717 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 730 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Started
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1542 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_fetch)
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1903 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_unpack)
NOTE: Running task 1904 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_patch)
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2316 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic)
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic unihash changed to 9ff443df6c2b1de38e860a5baee6734a8ae6ca5c3d1fd7076fb72ef803cfd030
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2317 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_configure)
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_compile)
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_install)
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package)
NOTE: Running task 2321 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_packagedata)
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2324 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm)
NOTE: Running task 2325 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2326 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2327 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_write_rpm)
NOTE: Running task 2328 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_qa)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to bcf8a48cd0fab44cd6bea7d157c374d8c7c0c7629f7eac475808ac42d78355b1
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm unihash changed to 8b3263f4b8bf20a6fec03a021c726e589ca2023a8c30e8c9bd573650064669eb
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm unihash changed to 48c3c1d8e7f0ce1eb6d7e2d54647aaf54fe12629ae4da170877446690dc5e6ea
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm unihash changed to e838ccf7d2a0e126e54333e89ff2394d954502f4e9fd07cfe9c94f6f9c5959a4
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2329 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2329 tasks of which 2310 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6044208196304746923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-6.2.2-6.2.3.patch"

From 239f07336f4d446a7a9a348f7e487f0757b2ad8c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 06:29:47 +0000
Subject: [PATCH] python3-pytest: upgrade 6.2.2 -> 6.2.3

---
 .../python/{python3-pytest_6.2.2.bb => python3-pytest_6.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_6.2.2.bb => python3-pytest_6.2.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.2.bb b/meta/recipes-devtools/python/python3-pytest_6.2.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_6.2.2.bb
rename to meta/recipes-devtools/python/python3-pytest_6.2.3.bb
index d221cbcd7f..7fb7baf188 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
-SRC_URI[sha256sum] = "9d1edf9e7d0b84d72ea3dbcdfd22b35fb543a5e8f2a60092dd578936bf63d7f9"
+SRC_URI[sha256sum] = "671238a46e4df0f3498d1c3270e5deb9b32d25134c99b7d75370a68cfbe9b634"
 
 inherit update-alternatives pypi setuptools3
 
-- 
2.27.0


--===============6044208196304746923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 107 recipes from the core2-32 sysroot...done.
Removing 112 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e61e989aa79ddbfcafe3c6e4703131a0260932ba"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 546 Local 534 Network 0 Missed 12 Current 197 (97% match, 98% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_20.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 269 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 270 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 272 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-20.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 284 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-54.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-zipp-3.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 291 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 292 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 301 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-20.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 303 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_20.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-54.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-zipp-3.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_54.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 319 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.4.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 320 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 321 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 324 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-20.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 327 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-setuptools-54.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-zipp-3.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: Running setscene task 330 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 331 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 332 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 334 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 337 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 349 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 351 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
NOTE: recipe python3-attrs-20.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-54.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 376 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_setscene)
NOTE: Running setscene task 406 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 415 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 416 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 418 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 419 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 421 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 422 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 423 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 430 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 442 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 443 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 445 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 451 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 459 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 468 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 734 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_fetch)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1039 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 503 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 504 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 505 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1078 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_patch)
NOTE: Running setscene task 506 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 508 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1100 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1101 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic)
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic unihash changed to 9ff443df6c2b1de38e860a5baee6734a8ae6ca5c3d1fd7076fb72ef803cfd030
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 654 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 667 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 670 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 671 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 713 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 718 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 737 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1959 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2338 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_configure)
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2339 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_compile)
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2340 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_install)
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Succeeded
NOTE: Running task 2341 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package)
NOTE: Running task 2342 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_packagedata)
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm)
NOTE: Running task 2345 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2346 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2347 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2348 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_write_rpm)
NOTE: Running task 2349 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_qa)
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm unihash changed to b6d4787f7873f7ed4e5483b2d479f382f0727bd53f6b6f13bebfac90c93c7900
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to 25b3014c26efc681a93d1f34981b0769f511eeedd263e708713c9659d69564ce
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm unihash changed to f1da1d1b04122f603adb76419b4753a08ebd36ce7d678ddabf5c86cd68f40087
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm unihash changed to c90444de60934e43aead4e5275c0bed1c1f023a2a2fa7c7ecafc06221dd6f0e7
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2350 of 2350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2350 tasks of which 2331 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6044208196304746923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e61e989aa79ddbfcafe3c6e4703131a0260932ba"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 31 Local 20 Network 0 Missed 11 Current 701 (64% match, 98% complete)
Removing 4 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 717 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 730 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Started
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1542 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_fetch)
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1927 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_unpack)
NOTE: Running task 1928 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_patch)
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2316 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic)
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic unihash changed to 9ff443df6c2b1de38e860a5baee6734a8ae6ca5c3d1fd7076fb72ef803cfd030
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2317 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_configure)
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_compile)
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_install)
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package)
NOTE: Running task 2321 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_packagedata)
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2324 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2325 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2326 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm)
NOTE: Running task 2327 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_write_rpm)
NOTE: Running task 2328 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_qa)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to c257b0ae2639a5d262a3ac1c4f270f13f647b63cc11dee28083f80a7fd822b57
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm unihash changed to 3c185009d0b5bcc60612c9c13521897abbeb0739bf7ef03ab580cd897b463e45
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm unihash changed to 989710987465419b63c36f9fd2ff76ded466f82f34e5c3bdcb81c1fbf5eea1ce
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm unihash changed to d49b8ebdc2b34d159ec31922a76f00c7a36a0f49113562efc18874e51eda8cc6
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2329 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2329 tasks of which 2310 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6044208196304746923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 2 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e61e989aa79ddbfcafe3c6e4703131a0260932ba"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 31 Local 20 Network 0 Missed 11 Current 701 (64% match, 98% complete)
Removing 4 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 717 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 730 of 732 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1542 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_fetch)
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-3.4.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:3.10.1-r0 to 0:3.4.0-r0) [version-going-backwards]
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1860 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_unpack)
NOTE: Running task 1861 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_patch)
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2316 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic)
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_lic unihash changed to 9ff443df6c2b1de38e860a5baee6734a8ae6ca5c3d1fd7076fb72ef803cfd030
NOTE: recipe python3-pytest-6.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2317 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_configure)
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2318 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_compile)
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2319 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_install)
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_install: Succeeded
NOTE: Running task 2320 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package)
NOTE: Running task 2321 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_populate_sysroot)
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.3-r0: task do_package: Succeeded
NOTE: Running task 2322 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_packagedata)
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2323 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2324 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2325 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm)
NOTE: Running task 2326 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2327 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_write_rpm)
NOTE: Running task 2328 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_package_qa)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm unihash changed to 9cc37b1b57d4b0caf32af319d62f62795066b3aeaeedf2d98243233c60cc6041
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm unihash changed to f0e3f9e2ba2ef74eb8987dac6b96158adede7c92e8d95fb4351c845d9b9401e0
NOTE: recipe python3-more-itertools-8.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb:do_package_write_rpm unihash changed to 31a6e0d3904d6398661f95d2b81a196dc80a5d6550c029abdb945fbeb6a3e320
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm unihash changed to bd96c2790d4278e6836efbacbe5acf1b4300991fc49f07bb68344099e2397ccb
NOTE: recipe python3-pytest-6.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2329 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2329 tasks of which 2310 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============6044208196304746923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: PKGV changed from 6.2.2 [default] to 6.2.3 [default]
packages/core2-32-poky-linux/python3-pytest: PV changed from "6.2.2" to "6.2.3"
packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-6.2.2.tar.gz file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-6.2.3.tar.gz file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 6.2.2 [default] to 6.2.3 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "6.2.2" to "6.2.3"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 6.2.2 [default] to 6.2.3 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "6.2.2" to "6.2.3"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 6.2.2 [default] to 6.2.3 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "6.2.2" to "6.2.3"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 6.2.2 [default] to 6.2.3 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "6.2.2" to "6.2.3"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 6.2.2 [default] to 6.2.3 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "6.2.2" to "6.2.3"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 6.2.2 [default] to 6.2.3 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "6.2.2" to "6.2.3"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 6.2.2 [default] to 6.2.3 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "6.2.2" to "6.2.3"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 1802849 to 1804361 (+0%)

--===============6044208196304746923==--
