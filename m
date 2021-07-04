Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7587.1625391858425202003
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id B09B738C11D7
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.5.0 SUCCEEDED
Message-ID: <MADEUP.168E8D48A0603679.5985@lists.openembedded.org>
X-Groupsio-MsgNum: 153524
Content-Type: multipart/mixed; boundary="===============7106606874825193046=="

--===============7106606874825193046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.4.1-3.5.0.patch
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

--===============7106606874825193046==
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
DISTRO_VERSION       = "3.3+snapshot-0e1a180863529aeb03ec7b23a8a476097c0dcc19"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e1a180863529aeb03ec7b23a8a476097c0dcc19"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 1 Network 0 Missed 59 Current 762 (1% match, 92% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1567 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_fetch)
NOTE: Running task 1635 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_fetch)
NOTE: Running task 1636 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1637 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 1763 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_fetch)
NOTE: Running task 1779 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_fetch)
NOTE: Running task 1823 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_fetch)
NOTE: Running task 1824 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_fetch)
NOTE: Running task 1872 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_fetch)
NOTE: Running task 1873 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_fetch)
NOTE: Running task 1874 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_fetch)
NOTE: Running task 1875 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1876 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: Running task 1996 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_unpack)
NOTE: Running task 1997 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1998 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_unpack)
NOTE: Running task 1999 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Started
NOTE: Running task 2000 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 2001 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: Running task 2002 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Started
NOTE: Running task 2003 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Started
NOTE: Running task 2004 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_unpack)
NOTE: Running task 2005 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2006 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_unpack)
NOTE: Running task 2020 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Started
NOTE: Running task 2021 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_unpack)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2042 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_unpack)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running task 2057 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 2058 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_unpack)
NOTE: Running task 2059 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_unpack)
NOTE: Running task 2060 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_unpack)
NOTE: Running task 2061 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Started
NOTE: Running task 2062 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 2063 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: Running task 2122 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2123 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Started
NOTE: Running task 2124 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_patch)
NOTE: Running task 2125 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_patch)
NOTE: Running task 2126 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2127 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: Running task 2128 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: Running task 2129 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_patch)
NOTE: Running task 2130 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Started
NOTE: Running task 2131 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Started
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2146 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_patch)
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Started
NOTE: Running task 2147 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_patch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2204 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_patch)
NOTE: Running task 2218 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_patch)
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2248 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_patch)
NOTE: Running task 2249 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 2250 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: Running task 2381 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2383 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2384 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2385 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2386 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic)
NOTE: Running task 2387 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2388 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2389 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2390 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2391 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2392 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2394 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2395 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2397 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic unihash changed to 62471092e1c105608e7f0aad7c8459d226986ecc9d09dbdc2e06609c1ec068e3
NOTE: Running task 2398 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure)
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2399 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure)
NOTE: Running task 2400 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: Running task 2401 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: Running task 2402 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_configure)
NOTE: Running task 2403 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2404 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: Running task 2405 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_configure)
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2406 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_configure)
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Started
NOTE: Running task 2407 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_configure)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: Running task 2408 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2410 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f3ac43696b851485adafba19a643f135a128833e98a29f0334cd75440e1a4e9
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2442 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure_ptest_base)
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Started
NOTE: Running task 2445 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2446 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2478 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_compile)
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2479 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_compile)
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: Running task 2480 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_compile)
NOTE: Running task 2481 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_compile)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2482 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_configure)
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2483 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2484 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile)
NOTE: Running task 2485 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_compile)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Started
NOTE: Running task 2486 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2487 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Started
NOTE: Running task 2488 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Started
NOTE: Running task 2489 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Started
NOTE: Running task 2490 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Started
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Started
NOTE: Running task 2491 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2492 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_install)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2494 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_install)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_install)
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2496 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_install)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile_ptest_base)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2498 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Started
NOTE: Running task 2500 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: Running task 2501 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_install)
NOTE: Running task 2502 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_install)
NOTE: recipe python3-py-1.10.0-r0: task do_install: Started
NOTE: Running task 2503 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2504 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b169c09b3341afe1cc48221181569c738481714a299e3f58e326f2a67a108e3b
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2511 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install)
NOTE: Running task 2515 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Started
NOTE: Running task 2516 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-packaging-20.9-r0: task do_install: Started
NOTE: Running task 2546 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Started
NOTE: Running task 2550 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_install)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2551 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Succeeded
NOTE: Running task 2552 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Succeeded
NOTE: Running task 2553 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Succeeded
NOTE: Running task 2554 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package)
NOTE: Running task 2555 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2556 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_install: Succeeded
NOTE: Running task 2557 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package)
NOTE: recipe python3-py-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2558 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2559 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Succeeded
NOTE: Running task 2560 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2561 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: Running task 2562 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-packaging-20.9-r0: task do_package: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2563 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2564 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2565 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package)
NOTE: Running task 2566 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Succeeded
NOTE: Running task 2567 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2568 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Succeeded
NOTE: Running task 2569 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata)
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Succeeded
NOTE: Running task 2570 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Succeeded
NOTE: Running task 2571 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2572 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Succeeded
NOTE: Running task 2573 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2574 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-20.9-r0: task do_package: Succeeded
NOTE: Running task 2575 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2576 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2577 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Started
NOTE: Running task 2578 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package_write_rpm)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2579 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Succeeded
NOTE: Running task 2580 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2581 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2582 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2583 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: Running task 2584 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2585 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Succeeded
NOTE: Running task 2586 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2587 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_write_rpm)
NOTE: Running task 2588 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_qa)
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2589 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2590 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2591 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2592 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Succeeded
NOTE: Running task 2593 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2594 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package_write_rpm)
NOTE: Running task 2595 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2596 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2596 tasks of which 2432 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============7106606874825193046==
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
DISTRO_VERSION       = "3.3+snapshot-0e1a180863529aeb03ec7b23a8a476097c0dcc19"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e1a180863529aeb03ec7b23a8a476097c0dcc19"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 1 Network 0 Missed 59 Current 762 (1% match, 92% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1567 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_fetch)
NOTE: Running task 1635 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 1636 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1637 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_fetch)
NOTE: Running task 1763 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_fetch)
NOTE: Running task 1779 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_fetch)
NOTE: Running task 1823 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_fetch)
NOTE: Running task 1824 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_fetch)
NOTE: Running task 1871 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_fetch)
NOTE: Running task 1873 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_fetch)
NOTE: Running task 1874 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1875 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1876 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_fetch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1959 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_unpack)
NOTE: Running task 1960 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1989 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: Running task 1990 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1991 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_unpack)
NOTE: Running task 1992 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Started
NOTE: Running task 1993 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Started
NOTE: Running task 1994 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Started
NOTE: Running task 1995 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_unpack)
NOTE: Running task 1996 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_unpack)
NOTE: Running task 1997 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_unpack)
NOTE: Running task 1998 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Started
NOTE: Running task 1999 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_unpack)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 2006 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_unpack)
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Succeeded
NOTE: Running task 2007 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_unpack)
NOTE: Running task 2008 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 2009 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 2010 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_unpack)
NOTE: Running task 2027 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: Running task 2062 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: Running task 2063 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2064 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_patch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2099 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Started
NOTE: Running task 2100 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_patch)
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Started
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Started
NOTE: Running task 2124 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Started
NOTE: Running task 2125 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_patch)
NOTE: Running task 2126 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_patch)
NOTE: Running task 2129 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2130 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2131 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_patch)
NOTE: Running task 2132 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2133 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_patch)
NOTE: Running task 2134 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_patch)
NOTE: Running task 2135 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 2136 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 2137 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2145 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_patch)
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Started
NOTE: Running task 2166 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_patch)
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2383 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2384 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2385 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2386 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2388 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2389 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic)
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2390 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2391 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2392 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 2394 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2395 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2396 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: Running task 2398 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_configure)
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic unihash changed to 62471092e1c105608e7f0aad7c8459d226986ecc9d09dbdc2e06609c1ec068e3
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2399 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2400 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2401 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2402 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2403 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_configure)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: Running task 2404 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_configure)
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Started
NOTE: Running task 2405 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2406 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to db6c413a4896ec7bf862364677c4dcbd28a03d4718a5b45cc6aa9fa6ae3d9b25
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: Running task 2470 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Started
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Succeeded
NOTE: Running task 2471 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_configure)
NOTE: Running task 2472 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Started
NOTE: Running task 2473 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2474 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_compile)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2476 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure_ptest_base)
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Started
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Started
NOTE: Running task 2477 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2478 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 2479 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_compile)
NOTE: Running task 2480 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: Running task 2481 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_compile)
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_compile)
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2483 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2484 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_compile)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2485 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2486 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Started
NOTE: Running task 2487 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2488 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Started
NOTE: Running task 2489 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: Running task 2490 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2491 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2492 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_compile)
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: Running task 2493 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2494 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_install)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2495 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_install)
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Started
NOTE: Running task 2496 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_install)
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_install: Started
NOTE: Running task 2497 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_install)
NOTE: Running task 2498 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_install)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5d4d3efc78424bd89260522c7c76ae2f5d48c022ed0e373ad4d4dd9b6e8201dd
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 2510 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: Running task 2511 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: Running task 2512 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile_ptest_base)
NOTE: recipe python3-py-1.10.0-r0: task do_install: Started
NOTE: Running task 2542 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2546 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2547 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 2548 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2549 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Started
NOTE: Running task 2550 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_install)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2551 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-packaging-20.9-r0: task do_install: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Succeeded
NOTE: Running task 2552 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package)
NOTE: Running task 2553 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2554 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Succeeded
NOTE: Running task 2555 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Succeeded
NOTE: Running task 2556 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package)
NOTE: Running task 2557 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Started
NOTE: recipe python3-packaging-20.9-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2558 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Succeeded
NOTE: Running task 2559 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install_ptest_base)
NOTE: Running task 2560 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2561 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 2562 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Succeeded
NOTE: Running task 2563 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2564 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package)
NOTE: Running task 2565 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2566 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2567 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package)
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2568 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Succeeded
NOTE: Running task 2569 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata)
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package: Succeeded
NOTE: Running task 2570 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2571 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: Running task 2572 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Succeeded
NOTE: Running task 2573 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2574 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Started
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2575 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm)
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2576 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2577 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Succeeded
NOTE: Running task 2578 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2579 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2580 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-py-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2581 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Succeeded
NOTE: Running task 2582 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2583 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Succeeded
NOTE: Running task 2584 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata)
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Succeeded
NOTE: Running task 2585 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2586 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2587 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2588 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_qa)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2589 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2590 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2591 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2592 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Succeeded
NOTE: Running task 2593 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2594 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package_write_rpm)
NOTE: Running task 2595 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2596 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2596 tasks of which 2432 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============7106606874825193046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-32-poky-linux/python3-zipp: PV changed from "3.4.1" to "3.5.0"
packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.4.1.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.5.0.tar.gz"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.4.1" to "3.5.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.4.1" to "3.5.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.4.1" to "3.5.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.4.1" to "3.5.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.4.1" to "3.5.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.4.1" to "3.5.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.4.1" to "3.5.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 19995 to 21147 (+6%)
packages/core2-32-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.4.1 [default] to 3.5.0 [default]
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/Misc was added
  /usr/lib/python3.9/site-packages/Misc/NEWS.d was added
  /usr/lib/python3.9/site-packages/Misc/NEWS.d/next was added
  /usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library was added
  /usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst was added

--===============7106606874825193046==
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
DISTRO_VERSION       = "3.3+snapshot-0e1a180863529aeb03ec7b23a8a476097c0dcc19"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e1a180863529aeb03ec7b23a8a476097c0dcc19"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 1 Network 0 Missed 59 Current 762 (1% match, 92% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1567 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_fetch)
NOTE: Running task 1635 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 1636 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_fetch)
NOTE: Running task 1637 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1763 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_fetch)
NOTE: Running task 1779 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_fetch)
NOTE: Running task 1823 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_fetch)
NOTE: Running task 1824 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_fetch)
NOTE: Running task 1871 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_fetch)
NOTE: Running task 1872 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1873 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1875 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_fetch)
NOTE: Running task 1876 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_fetch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1985 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_unpack)
NOTE: Running task 1986 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2014 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Started
NOTE: Running task 2015 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_unpack)
NOTE: Running task 2016 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2017 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 2018 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Started
NOTE: Running task 2019 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2020 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_unpack)
NOTE: Running task 2021 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_unpack)
NOTE: Running task 2022 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Succeeded
NOTE: Running task 2023 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_unpack)
NOTE: Running task 2024 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_unpack)
NOTE: Running task 2025 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 2026 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_unpack)
NOTE: Running task 2027 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 2028 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 2029 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_unpack)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 2052 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_unpack)
NOTE: Running task 2062 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Started
NOTE: Running task 2063 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: Running task 2119 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_patch)
NOTE: Running task 2121 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2122 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: Running task 2123 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Started
NOTE: Running task 2124 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_patch)
NOTE: Running task 2125 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: Running task 2126 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: Running task 2129 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Started
NOTE: Running task 2130 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_patch)
NOTE: Running task 2131 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_patch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2132 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_patch)
NOTE: Running task 2133 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2134 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 2140 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_patch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2144 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 2146 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_patch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2150 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_patch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Started
NOTE: Running task 2268 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_patch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2383 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2384 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2385 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2386 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2387 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2388 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2389 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2390 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2391 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure)
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2392 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2393 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Started
NOTE: Running task 2394 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2395 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2396 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2397 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_configure)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c09116e7a1e8cc0003c5ccd8abf3676ec7278c816ea4ad3658e5deaf863ed6b0
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2430 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic unihash changed to 62471092e1c105608e7f0aad7c8459d226986ecc9d09dbdc2e06609c1ec068e3
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2432 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure)
NOTE: Running task 2433 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: Running task 2434 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure_ptest_base)
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2442 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2467 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_configure)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2468 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: Running task 2469 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_configure)
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2470 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Started
NOTE: Running task 2471 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2472 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_compile)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Started
NOTE: Running task 2473 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_configure)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2474 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2475 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Started
NOTE: Running task 2476 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2477 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Started
NOTE: Running task 2478 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2479 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Started
NOTE: Running task 2480 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_compile)
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2482 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 2483 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2484 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_compile)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2485 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2487 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile)
NOTE: Running task 2488 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Started
NOTE: Running task 2489 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Started
NOTE: Running task 2490 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2491 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_install)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile_ptest_base)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2493 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 2494 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_install)
NOTE: recipe python3-py-1.10.0-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8c3897072e47f6d6d935d3e001c5f541b493bc22b501b840eee7f9271b7ef5da
NOTE: Setscene tasks completed
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2504 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Succeeded
NOTE: Running task 2514 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2515 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_install)
NOTE: Running task 2516 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2517 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile_ptest_base)
NOTE: Running task 2520 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Started
NOTE: Running task 2521 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_install)
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Started
NOTE: Running task 2522 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-packaging-20.9-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 2543 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2547 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: Running task 2548 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Started
NOTE: Running task 2549 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2550 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_install)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Succeeded
NOTE: Running task 2551 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Succeeded
NOTE: Running task 2552 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package)
NOTE: recipe python3-py-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2553 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package)
NOTE: Running task 2554 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_sysroot)
NOTE: recipe python3-packaging-20.9-r0: task do_install: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Succeeded
NOTE: Running task 2555 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2556 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Started
NOTE: Running task 2557 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2558 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Succeeded
NOTE: Running task 2559 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package: Started
NOTE: recipe python3-packaging-20.9-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2560 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2561 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 2562 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install_ptest_base)
NOTE: Running task 2563 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2564 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2565 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Succeeded
NOTE: Running task 2566 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: Running task 2567 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Succeeded
NOTE: Running task 2568 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata)
NOTE: Running task 2569 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_packagedata)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2570 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-packaging-20.9-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2571 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata)
NOTE: Running task 2572 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Succeeded
NOTE: Running task 2573 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2574 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Succeeded
NOTE: Running task 2575 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_packagedata)
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2576 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm)
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Succeeded
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Succeeded
NOTE: Running task 2577 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package)
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2578 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2579 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2580 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm)
NOTE: Running task 2581 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2582 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package_write_rpm)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2583 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: Running task 2584 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2585 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2586 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2587 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_qa)
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Succeeded
NOTE: Running task 2588 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2589 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2590 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2591 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2592 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Succeeded
NOTE: Running task 2593 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2594 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package_write_rpm)
NOTE: Running task 2595 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2596 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2596 tasks of which 2432 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============7106606874825193046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: FILELIST: directory renamed /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info -> /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst"
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.9/site-packages/zipp-3.4.1-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/zipp-3.5.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/Misc was added
  /usr/lib/python3.9/site-packages/Misc/NEWS.d was added
  /usr/lib/python3.9/site-packages/Misc/NEWS.d/next was added
  /usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library was added
  /usr/lib/python3.9/site-packages/Misc/NEWS.d/next/Library/2021-05-14-16-06-02.bpo-44095.v_pLwY.rst was added

--===============7106606874825193046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 65 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-0e1a180863529aeb03ec7b23a8a476097c0dcc19"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e1a180863529aeb03ec7b23a8a476097c0dcc19"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 1 Network 0 Missed 59 Current 762 (1% match, 92% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1181 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1567 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_fetch)
NOTE: Running task 1635 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_fetch)
NOTE: Running task 1636 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: Running task 1637 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 1763 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_fetch)
NOTE: Running task 1779 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_fetch)
NOTE: Running task 1823 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_fetch)
NOTE: Running task 1824 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_fetch)
NOTE: Running task 1871 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_fetch)
NOTE: Running task 1872 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_fetch)
NOTE: Running task 1873 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 1874 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1875 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_fetch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: Running task 1932 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_unpack)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1933 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1960 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_unpack)
NOTE: Running task 1961 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Started
NOTE: Running task 1962 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1963 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1964 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Started
NOTE: Running task 1965 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1966 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_unpack)
NOTE: Running task 1967 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_unpack)
NOTE: Running task 1969 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running task 1970 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_unpack)
NOTE: Running task 1971 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_unpack)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Succeeded
NOTE: Running task 2005 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_unpack)
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Started
NOTE: Running task 2006 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_unpack)
NOTE: Running task 2007 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 2008 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 2009 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_unpack)
NOTE: Running task 2027 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2062 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2063 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_patch)
NOTE: Running task 2064 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2065 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_patch)
NOTE: Running task 2066 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: Running task 2067 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Started
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: Running task 2104 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_patch)
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: Running task 2125 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 2126 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_patch)
NOTE: Running task 2127 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_patch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 2128 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: Running task 2129 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2130 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_patch)
NOTE: Running task 2131 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_patch)
NOTE: Running task 2132 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_patch)
NOTE: Running task 2133 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Started
NOTE: Running task 2134 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2135 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2136 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Started
NOTE: Running task 2145 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_patch)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2357 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Succeeded
NOTE: Running task 2383 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 2384 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2385 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2386 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2387 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2388 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2389 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2390 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2391 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f3e251490b4856b027ccf647cafe5bcc7e717e68661535dffb34ae7a9b90d9d
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2428 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2432 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2442 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2443 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: Running task 2459 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Succeeded
NOTE: Running task 2461 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2462 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2463 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2464 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_configure)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2465 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2466 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: Running task 2467 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_configure)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2468 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2469 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2470 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic unihash changed to 62471092e1c105608e7f0aad7c8459d226986ecc9d09dbdc2e06609c1ec068e3
NOTE: Running task 2471 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2472 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Started
NOTE: Running task 2473 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_configure)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2474 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2475 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2476 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_configure)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2477 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 2478 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2479 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 2480 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2481 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Started
NOTE: Running task 2482 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: Running task 2483 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: Running task 2484 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_compile)
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: Running task 2485 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_compile)
NOTE: Running task 2486 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_compile)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2487 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_configure)
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Started
NOTE: Running task 2488 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: Running task 2489 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Started
NOTE: Running task 2490 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_compile)
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2491 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ea1145b4f943f25b076d01d1d934f51638dc21cf187d96770689ad7c38234ce6
NOTE: Setscene tasks completed
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Started
NOTE: Running task 2505 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_install)
NOTE: Running task 2531 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2535 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 2536 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2537 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: Running task 2538 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile_ptest_base)
NOTE: recipe python3-packaging-20.9-r0: task do_install: Started
NOTE: Running task 2539 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2540 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_install)
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 2541 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2542 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 2543 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2544 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2545 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install)
NOTE: recipe python3-py-1.10.0-r0: task do_install: Started
NOTE: Running task 2546 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: Running task 2547 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_install)
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Started
NOTE: Running task 2548 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2549 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2550 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running task 2551 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_install)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2552 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Started
NOTE: recipe python3-packaging-20.9-r0: task do_install: Succeeded
NOTE: Running task 2553 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package: Started
NOTE: Running task 2554 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package)
NOTE: Running task 2555 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Succeeded
NOTE: Running task 2556 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2557 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Succeeded
NOTE: Running task 2558 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Started
NOTE: Running task 2559 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install_ptest_base)
NOTE: recipe python3-py-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 2560 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Succeeded
NOTE: Running task 2561 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2562 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Started
NOTE: recipe python3-py-1.10.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2563 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Started
NOTE: Running task 2564 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2565 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2566 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Succeeded
NOTE: Running task 2567 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2568 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2569 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-packaging-20.9-r0: task do_package: Succeeded
NOTE: Running task 2570 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Started
NOTE: Running task 2571 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2572 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Succeeded
NOTE: Running task 2573 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata)
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Started
NOTE: Running task 2574 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2575 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2576 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Succeeded
NOTE: Running task 2577 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2578 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Started
NOTE: Running task 2579 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Succeeded
NOTE: Running task 2580 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_packagedata)
NOTE: Running task 2581 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Started
NOTE: Running task 2582 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2583 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2584 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package_write_rpm)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2585 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2586 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_packagedata)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2587 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2588 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_qa)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2589 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2590 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2591 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: Running task 2592 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Succeeded
NOTE: Running task 2593 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2594 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package_write_rpm)
NOTE: Running task 2595 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2596 of 2596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2596 tasks of which 2432 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============7106606874825193046==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 41 skipped, 0 masked, 0 errors.
Removing 121 recipes from the core2-32 sysroot...done.
Removing 126 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-0e1a180863529aeb03ec7b23a8a476097c0dcc19"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0e1a180863529aeb03ec7b23a8a476097c0dcc19"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 613 Local 553 Network 0 Missed 60 Current 220 (90% match, 92% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 221 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 227 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 334 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-21.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 339 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 346 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 351 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 353 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 355 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-21.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 357 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_21.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 364 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 373 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 375 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 379 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 380 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 383 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 384 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 385 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-21.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 386 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 389 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 390 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 393 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 394 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 395 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 396 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 398 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 399 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 400 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 402 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 403 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_setscene: Started
NOTE: Running setscene task 405 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 406 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 408 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 410 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 411 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 412 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 413 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 416 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 418 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 419 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 420 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 421 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-21.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyparsing-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 430 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 431 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 434 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 438 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 443 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 451 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 458 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 775 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_fetch)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: Running task 805 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_fetch)
NOTE: Running task 806 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_fetch)
NOTE: Running task 807 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 857 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_fetch)
NOTE: Running task 860 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_fetch)
NOTE: Running task 874 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_fetch)
NOTE: Running task 875 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_fetch)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 901 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_fetch)
NOTE: Running task 902 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_fetch)
NOTE: Running task 903 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_fetch)
NOTE: Running task 904 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 905 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_fetch)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1106 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_unpack)
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1120 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_unpack)
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Started
NOTE: Running task 1121 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_unpack)
NOTE: Running task 1122 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_unpack)
NOTE: recipe python3-zipp-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1123 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_unpack)
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Started
NOTE: Running task 1124 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_unpack)
NOTE: recipe python3-pytest-6.2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running task 1125 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_unpack)
NOTE: Running task 1126 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_unpack)
NOTE: recipe python3-packaging-20.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1127 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_unpack)
NOTE: Running task 1128 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_unpack)
NOTE: Running task 1129 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_unpack)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1130 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_unpack)
NOTE: Running task 1131 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Started
NOTE: Running setscene task 527 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Started
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Started
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Started
NOTE: Running task 1141 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_patch)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: Running task 1142 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_patch)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_patch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Started
NOTE: Running task 1144 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_patch)
NOTE: Running task 1145 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_patch)
NOTE: Running task 1146 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_patch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_patch)
NOTE: recipe python3-py-1.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_patch)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1149 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1154 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 1155 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1156 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1161 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_patch)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1162 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1163 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_patch: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: Running task 1166 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1167 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1168 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1169 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1170 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1171 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1172 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1189 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_patch: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: Running task 1190 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_lic unihash changed to 62471092e1c105608e7f0aad7c8459d226986ecc9d09dbdc2e06609c1ec068e3
NOTE: recipe python3-zipp-3.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1191 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 565 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-6.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1283 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1307 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1314 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1342 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1353 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1367 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1388 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 735 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1398 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 754 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 758 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 759 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 780 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1463 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 800 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ddb7cbb05a3514a911d134efaf88f6ddf4f53f8f4619ab94e3a7e28d32b32581
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1480 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 809 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 828 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 831 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 833 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 833 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2090 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2134 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2135 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2136 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2240 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2251 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2270 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2271 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2299 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2300 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2301 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2302 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2303 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2526 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure)
NOTE: Running task 2527 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure)
NOTE: Running task 2528 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure)
NOTE: recipe python3-zipp-3.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2529 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2530 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_configure)
NOTE: Running task 2531 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_configure)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2532 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_configure)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2533 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Started
NOTE: Running task 2534 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2535 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_configure)
NOTE: recipe python3-py-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2536 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2537 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Started
NOTE: Running task 2538 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2539 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Started
NOTE: Running task 2540 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2541 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_compile)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Started
NOTE: Running task 2542 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 2543 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_compile)
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2544 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2545 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_compile)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: Running task 2546 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_compile)
NOTE: recipe python3-packaging-20.9-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2547 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile)
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Started
NOTE: recipe python3-py-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2548 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile)
NOTE: Running task 2549 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Started
NOTE: Running task 2550 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_compile)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Started
NOTE: Running task 2551 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2552 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Started
NOTE: Running task 2553 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile)
NOTE: Running task 2554 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_compile)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2555 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_install)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_compile: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2556 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_install)
NOTE: Running task 2557 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_install)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2558 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2559 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_compile_ptest_base)
NOTE: Running task 2560 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2561 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Started
NOTE: Running task 2562 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_install)
NOTE: recipe python3-packaging-20.9-r0: task do_compile: Succeeded
NOTE: Running task 2563 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Started
NOTE: Running task 2564 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_compile_ptest_base)
NOTE: Running task 2565 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-py-1.10.0-r0: task do_compile: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Started
NOTE: Running task 2566 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_install)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Started
NOTE: Running task 2567 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_install)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2568 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Started
NOTE: Running task 2569 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-20.9-r0: task do_install: Started
NOTE: Running task 2570 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2571 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install)
NOTE: recipe python3-py-1.10.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_install: Succeeded
NOTE: Running task 2572 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_install: Succeeded
NOTE: Running task 2573 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package)
NOTE: Running task 2574 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package)
NOTE: Running task 2575 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_populate_sysroot)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_install: Succeeded
NOTE: Running task 2576 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package)
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 2577 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-packaging-20.9-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Started
NOTE: Running task 2578 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install: Succeeded
NOTE: Running task 2579 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_install_ptest_base)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2580 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_install_ptest_base)
NOTE: Running task 2581 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: Running task 2582 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_install_ptest_base)
NOTE: recipe python3-packaging-20.9-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Started
NOTE: Running task 2583 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Started
NOTE: Running task 2584 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2585 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2586 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2587 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package)
NOTE: Running task 2588 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package: Succeeded
NOTE: Running task 2589 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package: Succeeded
NOTE: Running task 2590 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata)
NOTE: recipe python3-zipp-3.5.0-r0: task do_package: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Started
NOTE: Running task 2591 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package: Succeeded
NOTE: Running task 2592 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_packagedata)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 2593 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_install: Succeeded
NOTE: Running task 2594 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package)
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-20.9-r0: task do_package: Succeeded
NOTE: Running task 2595 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Started
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2596 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.5.bb:do_package_write_rpm)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2597 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-zipp-3.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2598 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb:do_package_write_rpm)
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: Running task 2599 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
ERROR: python3-packaging-20.9-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:21.0-r0 to 0:20.9-r0) [version-going-backwards]
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package: Succeeded
NOTE: Running task 2600 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_packagedata)
NOTE: Running task 2601 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_packagedata)
NOTE: Running task 2602 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2603 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata)
NOTE: recipe python3-packaging-20.9-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 2604 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2605 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_20.9.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package: Succeeded
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Started
NOTE: Running task 2606 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_packagedata)
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-pathlib2-2.3.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2607 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_write_rpm)
NOTE: Running task 2608 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_package_qa)
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2609 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-4.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2610 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_0.13.1.bb:do_package_write_rpm)
NOTE: Running task 2611 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-20.9-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2612 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2613 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-zipp-3.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package: Succeeded
NOTE: Running task 2614 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-atomicwrites-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-py-1.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-0.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-more-itertools-8.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2615 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb:do_package_write_rpm)
NOTE: Running task 2616 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_6.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-6.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-57.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2617 of 2617 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.5.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2617 tasks of which 2448 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============7106606874825193046==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.4.1-3.5.0.patch"

From 8db57e82cc395662340a66a46f342f1cc2cdc74c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 4 Jul 2021 07:42:15 +0000
Subject: [PATCH] python3-zipp: upgrade 3.4.1 -> 3.5.0

---
 .../python/{python3-zipp_3.4.1.bb => python3-zipp_3.5.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.4.1.bb => python3-zipp_3.5.0.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.4.1.bb b/meta/recipes-devtools/python/python3-zipp_3.5.0.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-zipp_3.4.1.bb
rename to meta/recipes-devtools/python/python3-zipp_3.5.0.bb
index 191d3b38ad..ab12601e4e 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.4.1.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.5.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "3d91c7ab73b62ac3674210df94df600a"
-SRC_URI[sha256sum] = "3607921face881ba3e026887d8150cca609d517579abe052ac81fc5aeffdbd76"
+SRC_URI[sha256sum] = "f5812b1e007e48cff63449a5e9f4e7ebea716b4111f9c4f9a645f91d579bf0c4"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.20.1


--===============7106606874825193046==--
