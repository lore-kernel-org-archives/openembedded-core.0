Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37CBC19774
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8647.1698848703568689614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N4GttCLX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HGGAyNl/;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b8b460480-0c286090-04ad-418d-a8d9-7ba31459b38b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N8QCIpsX5vgWBfhxsrvtChjv3e4V7AriQIvot21oPSU=;
	b=N4GttCLXhWuBCjL9FSeWqm6DPbzeVKcsaXIKRdtKELmCWiWZGtGfr5RE5VuBrOqO
	bs/92ZjsTQyUAtyYZ/afkDmb8wAiyF0PA3KgIUyOhRJfnLEOk1/Uw3uGlTgOdtdDiV7
	yzMlzDpx9cqIQAeBc7wzMYwmrHoWX0ObSTHlKGbk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N8QCIpsX5vgWBfhxsrvtChjv3e4V7AriQIvot21oPSU=;
	b=HGGAyNl/BD4/RvJJ00eGaPFfzCGPBpIBAmPwr/q72qEDLS0p7Mwnkjt1s66CVPBY
	czb3J9kKsZS/z0zgSpsBSA9K4YO0JKTrogQQT2xQoaSK9Hfjhsa1p+8j4MNrLSzhWzn
	4JiPvrs+A2yoBWyHApmBfcu1ZpwkQb1Dd6s+IlQI=
Content-Type: multipart/mixed; boundary="===============2951542066643033450=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.26.1 SUCCEEDED
Message-ID: <0101018b8b460480-0c286090-04ad-418d-a8d9-7ba31459b38b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189949

--===============2951542066643033450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.26.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.26.0-1.26.1.patch
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
From eb62f1ff91a0b3a8aae2e2f950383a08a5853b23 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:08:31 +0000
Subject: [PATCH] python3-numpy: upgrade 1.26.0 -> 1.26.1

---
 .../python/{python3-numpy_1.26.0.bb => python3-numpy_1.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.0.bb => python3-numpy_1.26.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb b/meta/recipes-devtools/python/python3-numpy_1.26.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.26.0.bb
rename to meta/recipes-devtools/python/python3-numpy_1.26.1.bb
index 3ae40a33fb..55ce0b72da 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "f93fc78fe8bf15afe2b8d6b6499f1c73953169fad1e9a8dd086cdff3190e7fdf"
+SRC_URI[sha256sum] = "c8c6c72d4a9f831f328efb1312642a1cafafaa88981d9ab76368d50d07d93cbe"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.2


--===============2951542066643033450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.26.0/numpy-1.26.0.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.26.1/numpy-1.26.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://fix_reproducibility.patch file://run-ptest"
packages/core2-64-poky-linux/python3-numpy: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 57082232 to 57082248 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 19526310 to 19526865 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 39376433 to 39397025 (+0%)
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.26.0.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.26.1.dist-info, added "/usr/lib/python3.11/site-packages/numpy/_core/multiarray.py /usr/lib/python3.11/site-packages/numpy/_core/_multiarray_umath.py /usr/lib/python3.11/site-packages/numpy/_core/__init__.py /usr/lib/python3.11/site-packages/numpy/_core/_dtype_ctypes.py /usr/lib/python3.11/site-packages/numpy/core/tests/data/numpy_2_0_array.pkl /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_numpy_2_0_compat.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/multiarray.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_common.f /usr/lib/python3.11/site-packages/numpy/_core/umath.py /usr/lib/python3.11/site-packages/numpy/_core/_internal.py 
 /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/umath.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/_dtype.py /usr/lib/python3.11/site-packages/numpy/core/tests/test_numpy_2_0_compat.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype_ctypes.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_internal.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_with_comments.f /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_multiplier.f /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_multiarray_umath.cpython-311.pyc"
packages/core2-64-poky-linux/python3-numpy/python3-numpy: PV changed from "1.26.0" to "1.26.1"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.26.0.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.26.1.dist-info
  /usr/lib/python3.11/site-packages/numpy/_core was added
  /usr/lib/python3.11/site-packages/numpy/_core/_dtype_ctypes.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/_dtype.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/__init__.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/_internal.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/multiarray.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/_multiarray_umath.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__ was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype_ctypes.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_internal.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/multiarray.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_multiarray_umath.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/umath.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/data/numpy_2_0_array.pkl was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_numpy_2_0_compat.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/test_numpy_2_0_compat.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/umath.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_common.f was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_multiplier.f was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_with_comments.f was added

--===============2951542066643033450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-204ce604cf67a8d4e4b44c63675ef9d1ea014b0a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:204ce604cf67a8d4e4b44c63675ef9d1ea014b0a"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 29 Mirrors 0 Missed 27 Current 734 (51% match, 96% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1288 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_recipe_qa)
NOTE: Running task 1340 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_recipe_qa)
NOTE: Running task 1630 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_recipe_qa)
NOTE: Running task 1657 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1658 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1659 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_fetch)
NOTE: Running task 1660 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 2188 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_fetch: Succeeded
NOTE: Running task 2189 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_unpack)
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 2190 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2191 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_unpack)
NOTE: Running task 2192 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_unpack)
NOTE: Running task 2193 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2194 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_patch)
NOTE: Running task 2196 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_unpack: Succeeded
NOTE: Running task 2197 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_patch)
NOTE: Running task 2198 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2199 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2205 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_patch: Succeeded
NOTE: Running task 2206 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 2207 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_patch)
NOTE: Running task 2208 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2209 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_configure)
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2210 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Succeeded
NOTE: Running task 2211 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2212 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_populate_lic)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Started
NOTE: Running task 2213 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2214 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Started
NOTE: Running task 2215 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2216 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2217 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 47d15e95dc67312091fe0edc4afd925f1a77898692e538a69bc9c701f28b3473 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '14dd61948db3476c30eeb2c55835de0ae27630efca8b5bf46e96dca66cfe9f3e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '47d15e95dc67312091fe0edc4afd925f1a77898692e538a69bc9c701f28b3473'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 14dd61948db3476c30eeb2c55835de0ae27630efca8b5bf46e96dca66cfe9f3e -> 47d15e95dc67312091fe0edc4afd925f1a77898692e538a69bc9c701f28b3473 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Succeeded
NOTE: Running task 2225 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2226 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2230 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_install)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_install: Succeeded
NOTE: Running task 2231 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 2232 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Started
NOTE: Running task 2233 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_package)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_create_spdx)
NOTE: Running task 2235 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_package: Succeeded
NOTE: Running task 2236 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.87.4-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2236 tasks of which 2192 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.88.1-r0 to 0:6.87.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.88.1-r0 to 0:6.87.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.88.1-r0 to 0:6.87.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.88.1-r0 to 0:6.87.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.88.1-r0 to 0:6.87.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.88.1-r0 to 0:6.87.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.88.1-r0 to 0:6.87.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.88.1-r0 to 0:6.87.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.87.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-hypothesis/6.87.4/temp/log.do_packagedata.3368267
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.87.4.bb:do_packagedata) failed with exit code '1'

--===============2951542066643033450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.26.0.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.26.1.dist-info, added "/usr/lib/python3.11/site-packages/numpy/core/tests/data/numpy_2_0_array.pkl /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_multiplier.f /usr/lib/python3.11/site-packages/numpy/_core/umath.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/_dtype_ctypes.py /usr/lib/python3.11/site-packages/numpy/core/tests/test_numpy_2_0_compat.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/umath.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/multiarray.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/_dtype.py /usr/lib/python3.11/site-packages/numpy/_core/
 _multiarray_umath.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype_ctypes.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_with_comments.f /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_internal.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_numpy_2_0_compat.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/_internal.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_multiarray_umath.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/multiarray.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_common.f /usr/lib/python3.11/site-packages/numpy/_core/__init__.py"
Changes to packages/core2-64-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.26.0.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.26.1.dist-info
  /usr/lib/python3.11/site-packages/numpy/_core was added
  /usr/lib/python3.11/site-packages/numpy/_core/_dtype_ctypes.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/_dtype.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/__init__.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/_internal.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/multiarray.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/_multiarray_umath.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__ was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype_ctypes.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/__init__.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_internal.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/multiarray.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_multiarray_umath.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/umath.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/data/numpy_2_0_array.pkl was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_numpy_2_0_compat.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/test_numpy_2_0_compat.py was added
  /usr/lib/python3.11/site-packages/numpy/_core/umath.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_common.f was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_multiplier.f was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_with_comments.f was added

--===============2951542066643033450==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.26.0-1.26.1.patch"

RnJvbSBlYjYyZjFmZjkxYTBiM2E4YWFlMmUyZjk1MDM4M2EwOGE1ODUzYjIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOTowODozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMS4yNi4wIC0+IDEuMjYuMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLW51bXB5XzEuMjYuMC5iYiA9PiBweXRob24zLW51bXB5XzEuMjYuMS5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW51bXB5XzEuMjYuMC5iYiA9PiBw
eXRob24zLW51bXB5XzEuMjYuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlf
MS4yNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
bnVtcHlfMS4yNi4xLmJiCmluZGV4IDNhZTQwYTMzZmIuLjU1Y2UwYjcyZGEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI2LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjYuMS5iYgpA
QCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92
JHtQVn0vJHtTUkNOQU1FfS0ke1BWfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vZml4X3Jl
cHJvZHVjaWJpbGl0eS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjkzZmM3OGZlOGJmMTVhZmUyYjhkNmI2
NDk5ZjFjNzM5NTMxNjlmYWQxZTlhOGRkMDg2Y2RmZjMxOTBlN2ZkZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJjOGM2YzcyZDRhOWY4MzFmMzI4ZWZiMTMxMjY0MmExY2FmYWZhYTg4OTgxZDlhYjc2
MzY4ZDUwZDA3ZDkzY2JlIgogCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29t
L251bXB5L251bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMv
dGFnL3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKLS0gCjIuMzkuMgoK

--===============2951542066643033450==--

