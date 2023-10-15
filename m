Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD51AC04AAC
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.102710.1697399114853211253
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JxAQL27Y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lgWa6eqJ;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b34df0964-1c9a275d-3335-409f-8a38-e6d6c792fda7-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cpc0Ucw1IKa7MjcQdgYHTHQ1OdPSgUmeQLcCOUuvGfI=;
	b=JxAQL27Yt5CFnjyfLsYrZC5fewn6GJwdQJaXWDUU0DBL9OXTObaHojjM3AwwU0CR
	AtBFP8lKEMOjmbnkyAV8NZLldPry0OZLXGc1UmFBU1cNA91AHTkAzFm+1sXbm/VQgpo
	0FKDhWO/WtP4y8XBpr+7yJDG+2UeBYLHkcYoZIVw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cpc0Ucw1IKa7MjcQdgYHTHQ1OdPSgUmeQLcCOUuvGfI=;
	b=lgWa6eqJXiDPNo38If1hLRV3mL0i5rYWTZme5yaWgixb0sFuqKo1PCcQnzToP4GW
	bNfUTZGe+fpA0CWyxVolZigczv9K7zld92hF50j6oq10sf03JHwqfPBJNsEiCHrfO3V
	3yXU1wrZZsLWuo3saL03yfkeG18e9FU0euP+0Piw=
Content-Type: multipart/mixed; boundary="===============0606924138360531586=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.26.1 SUCCEEDED
Message-ID: <0101018b34df0964-1c9a275d-3335-409f-8a38-e6d6c792fda7-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189201

--===============0606924138360531586==
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
From cb5e5eb31f139dab87cbcef578e7bda7ca58fee6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 11:50:44 +0000
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


--===============0606924138360531586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 50 skipped, 0 masked, 0 errors.
Removing 28 recipes from the core2-32 sysroot...done.
Removing 72 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 454 Local 427 Mirrors 0 Missed 27 Current 336 (94% match, 96% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 337 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 361 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 372 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 386 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_recipe_qa)
NOTE: Running task 403 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_recipe_qa)
NOTE: Running task 468 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_recipe_qa)
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 391 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 420 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 421 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 513 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_fetch)
NOTE: Running task 514 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 515 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 473 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 480 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 490 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 561 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Succeeded
NOTE: Running task 562 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_unpack)
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 563 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_unpack)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 540 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 593 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 603 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 565 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 573 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1081 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_patch)
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 605 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running task 1115 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_patch)
NOTE: Running task 1131 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1171 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1181 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 631 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 637 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Succeeded
NOTE: Running task 1339 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1340 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 649 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1346 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 659 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 666 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 672 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 686 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1403 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_populate_lic)
NOTE: Running task 1405 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1411 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_populate_lic unihash changed to f30f4a30dbec368387325dbbfdb1aa3fc3ce02255c524a70d40650f47c5cce4d
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1508 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 757 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1518 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 65b6804f18b5304f7fc6bf26f99eb080c6989c489e5ea6be5abbbd4524adf075
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash b1bbabce6aac7d6588f445d6f2e827c0ef36ad1844bce1dade2908f0bbf4d1d9 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '43dd250868c6f76df491a0ea6259ae6910ad61f086fcf261e626a12a2c17b211', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'b1bbabce6aac7d6588f445d6f2e827c0ef36ad1844bce1dade2908f0bbf4d1d9'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 43dd250868c6f76df491a0ea6259ae6910ad61f086fcf261e626a12a2c17b211 -> b1bbabce6aac7d6588f445d6f2e827c0ef36ad1844bce1dade2908f0bbf4d1d9 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe musl-1.2.4+git-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 764 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 773 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 790 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1857 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2006 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2066 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_collect_spdx_deps)
NOTE: Running task 2187 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2190 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_collect_spdx_deps)
NOTE: Running task 2218 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2219 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2220 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2221 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Succeeded
NOTE: Running task 2222 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2223 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure_ptest_base)
NOTE: Running task 2224 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2225 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2226 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2229 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install)
NOTE: Running task 2230 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Succeeded
NOTE: Running task 2231 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2232 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_package)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_create_spdx)
NOTE: Running task 2235 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Succeeded
NOTE: Running task 2236 of 2249 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2236 tasks of which 2186 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.86.2/temp/log.do_packagedata.2125590
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata) failed with exit code '1'

--===============0606924138360531586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.26.0.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.26.1.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_with_comments.f /usr/lib/python3.11/site-packages/numpy/_core/_internal.py /usr/lib/python3.11/site-packages/numpy/_core/_dtype_ctypes.py /usr/lib/python3.11/site-packages/numpy/_core/_multiarray_umath.py /usr/lib/python3.11/site-packages/numpy/core/tests/test_numpy_2_0_compat.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype_ctypes.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/umath.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_multiplier.f /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/multiarray.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_multiarray_umath.cpython-311.pyc /usr/lib/python3.11/site-pa
 ckages/numpy/_core/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_common.f /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_numpy_2_0_compat.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_internal.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/core/tests/data/numpy_2_0_array.pkl /usr/lib/python3.11/site-packages/numpy/_core/__init__.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/umath.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/_dtype.py /usr/lib/python3.11/site-packages/numpy/_core/multiarray.py"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
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

--===============0606924138360531586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1845 targets, 38 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 38 Mirrors 0 Missed 26 Current 708 (59% match, 96% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1285 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_recipe_qa)
NOTE: Running task 1337 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_recipe_qa)
NOTE: Running task 1589 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_recipe_qa)
NOTE: Running task 1615 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1616 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1617 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_fetch)
NOTE: Running task 1618 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2147 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_unpack)
NOTE: Running task 2148 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 2149 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_unpack)
NOTE: Running task 2150 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2151 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_unpack)
NOTE: Running task 2152 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Started
NOTE: Running task 2153 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_patch)
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Started
NOTE: Running task 2154 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_patch)
NOTE: Running task 2156 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2157 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2163 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Succeeded
NOTE: Running task 2164 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2165 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_patch)
NOTE: Running task 2166 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2167 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2168 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure)
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Succeeded
NOTE: Running task 2169 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2170 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_populate_lic)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2171 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Succeeded
NOTE: Running task 2172 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2173 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2174 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2175 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 41de79a8e5aa4adff5c84d9689e46f868ca74cfd324d8705ad647ed0c045a6a1
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d0653da54ee98e3d0bc29c5e7e2020d43e2f7c704f698d398e283c756eeb95c0 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '2a0f1314c2d26451991d176353c3a8557e6adeca7ad6affdfb52fff6fe845056', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd0653da54ee98e3d0bc29c5e7e2020d43e2f7c704f698d398e283c756eeb95c0'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 2a0f1314c2d26451991d176353c3a8557e6adeca7ad6affdfb52fff6fe845056 -> d0653da54ee98e3d0bc29c5e7e2020d43e2f7c704f698d398e283c756eeb95c0 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2184 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2185 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Succeeded
NOTE: Running task 2187 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2188 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 2190 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2191 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_package)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_create_spdx)
NOTE: Running task 2193 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Succeeded
NOTE: Running task 2194 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2194 tasks of which 2151 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.86.2/temp/log.do_packagedata.2090177
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata) failed with exit code '1'

--===============0606924138360531586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 39 Mirrors 0 Missed 26 Current 707 (60% match, 96% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1285 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_recipe_qa)
NOTE: Running task 1337 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_recipe_qa)
NOTE: Running task 1589 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_recipe_qa)
NOTE: Running task 1615 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1616 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1617 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_fetch)
NOTE: Running task 1618 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2147 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_unpack)
NOTE: Running task 2148 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 2149 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_unpack)
NOTE: Running task 2150 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_unpack)
NOTE: Running task 2151 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Started
NOTE: Running task 2152 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2153 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_patch)
NOTE: Running task 2154 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_patch)
NOTE: Running task 2156 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2158 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2164 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Succeeded
NOTE: Running task 2165 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 2166 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_patch)
NOTE: Running task 2167 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2168 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2169 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Started
NOTE: Running task 2170 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2171 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2172 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2173 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2174 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile)
NOTE: Running task 2175 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 92d337ef06d6815edfae603f3065f50a80d7a4e3b16f348bd050c3d4b458d813
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash ea6a8f251611f9af0b841a5e38b1b84535c1cefb8079793973d9b8fa124b965b to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'fefeab79e5c5799caa6245e11037cbbbc55618c14b488cb234c0b5bcab283743', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'ea6a8f251611f9af0b841a5e38b1b84535c1cefb8079793973d9b8fa124b965b'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed fefeab79e5c5799caa6245e11037cbbbc55618c14b488cb234c0b5bcab283743 -> ea6a8f251611f9af0b841a5e38b1b84535c1cefb8079793973d9b8fa124b965b as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2184 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_install)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2185 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Succeeded
NOTE: Running task 2186 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Succeeded
NOTE: Running task 2187 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2188 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 2189 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Succeeded
NOTE: Running task 2190 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2191 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_create_spdx)
NOTE: Running task 2192 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_package)
NOTE: Running task 2193 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Succeeded
NOTE: Running task 2194 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2194 tasks of which 2151 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.86.2/temp/log.do_packagedata.2103032
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata) failed with exit code '1'

--===============0606924138360531586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.26.0/numpy-1.26.0.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://fix_reproducibility.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.26.1/numpy-1.26.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://fix_reproducibility.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 50276872 to 50276908 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 19526737 to 19527292 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 271256 to 271268 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.26.0 [default] to 1.26.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.26.0" to "1.26.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.26.0.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.26.1.dist-info, added "/usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype_ctypes.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_multiarray_umath.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_internal.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/_multiarray_umath.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/multiarray.py /usr/lib/python3.11/site-packages/numpy/core/tests/test_numpy_2_0_compat.py /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_numpy_2_0_compat.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_multiplier.f /usr/lib/python3.11/site-packages/numpy/_core/_dty
 pe.py /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/_dtype.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/umath.py /usr/lib/python3.11/site-packages/numpy/core/tests/data/numpy_2_0_array.pkl /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_with_comments.f /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/multiarray.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/_core/__init__.py /usr/lib/python3.11/site-packages/numpy/_core/_internal.py /usr/lib/python3.11/site-packages/numpy/_core/_dtype_ctypes.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/data_common.f /usr/lib/python3.11/site-packages/numpy/_core/__pycache__/umath.cpython-311.pyc"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40786242 to 40806834 (+0%)
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
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

--===============0606924138360531586==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.26.0-1.26.1.patch"

RnJvbSBjYjVlNWViMzFmMTM5ZGFiODdjYmNlZjU3OGU3YmRhN2NhNThmZWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTE6NTA6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDEuMjYuMCAtPiAxLjI2LjEKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1udW1weV8xLjI2LjAuYmIgPT4gcHl0aG9uMy1udW1weV8xLjI2LjEuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8xLjI2LjAuYmIgPT4g
cHl0aG9uMy1udW1weV8xLjI2LjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjYuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI2LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
XzEuMjYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzEuMjYuMS5iYgppbmRleCAzYWU0MGEzM2ZiLi41NWNlMGI3MmRhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNi4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI2LjEuYmIK
QEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2ZpeF9y
ZXByb2R1Y2liaWxpdHkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAg
ICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY5M2ZjNzhmZThiZjE1YWZlMmI4ZDZi
NjQ5OWYxYzczOTUzMTY5ZmFkMWU5YThkZDA4NmNkZmYzMTkwZTdmZGYiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYzhjNmM3MmQ0YTlmODMxZjMyOGVmYjEzMTI2NDJhMWNhZmFmYWE4ODk4MWQ5YWI3
NjM2OGQ1MGQwN2Q5M2NiZSIKIAogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNv
bS9udW1weS9udW1weS9yZWxlYXNlcyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2Vz
L3RhZy92Pyg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCi0tIAoyLjM5LjIKCg==

--===============0606924138360531586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 38 Mirrors 0 Missed 26 Current 708 (59% match, 96% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1285 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_recipe_qa)
NOTE: Running task 1337 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_recipe_qa)
NOTE: Running task 1589 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_recipe_qa)
NOTE: Running task 1615 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1616 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1617 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_fetch)
NOTE: Running task 1618 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2130 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_unpack)
NOTE: Running task 2131 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Succeeded
NOTE: Running task 2132 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_unpack)
NOTE: Running task 2133 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_unpack)
NOTE: Running task 2134 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2135 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Started
NOTE: Running task 2153 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_patch)
NOTE: Running task 2154 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_patch)
NOTE: Running task 2156 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2157 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2163 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Succeeded
NOTE: Running task 2164 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 2165 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_patch)
NOTE: Running task 2166 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2167 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_configure)
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2168 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure)
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Succeeded
NOTE: Running task 2169 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2170 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_populate_lic)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2171 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Succeeded
NOTE: Running task 2172 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure_ptest_base)
NOTE: Running task 2173 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2174 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2175 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 200bb33903ec133f456f3590c1839eabe64198ee0b7808a12285742dded5600b
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 60d32e43613abde25a68bee4544fd0cdf41669c467b03155c2d8a44a0560addc to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '084c8a6feb4d81e3a6fb8c4dd0d33caa74d4a9043bcc3b3f4c751f82be20c1b3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '60d32e43613abde25a68bee4544fd0cdf41669c467b03155c2d8a44a0560addc'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 084c8a6feb4d81e3a6fb8c4dd0d33caa74d4a9043bcc3b3f4c751f82be20c1b3 -> 60d32e43613abde25a68bee4544fd0cdf41669c467b03155c2d8a44a0560addc as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2184 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2185 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package)
NOTE: Running task 2187 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2188 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 2190 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2191 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_package)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_create_spdx)
NOTE: Running task 2193 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Succeeded
NOTE: Running task 2194 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2194 tasks of which 2151 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.86.2/temp/log.do_packagedata.2109158
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata) failed with exit code '1'

--===============0606924138360531586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee345d3e748a8e0eeeb9a540851ba7b3c3cdf4f3"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 38 Mirrors 0 Missed 26 Current 708 (59% match, 96% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1285 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_recipe_qa)
NOTE: Running task 1337 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_recipe_qa)
NOTE: Running task 1589 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_recipe_qa)
NOTE: Running task 1615 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1616 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1617 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_fetch)
NOTE: Running task 1618 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2147 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_unpack)
NOTE: Running task 2148 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.26.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_fetch: Succeeded
NOTE: Running task 2149 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_unpack)
NOTE: Running task 2150 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_unpack)
NOTE: Running task 2151 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2152 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Started
NOTE: Running task 2153 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_patch)
NOTE: Running task 2154 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_unpack: Succeeded
NOTE: Running task 2155 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_patch)
NOTE: Running task 2156 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2157 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2163 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.26.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_patch: Succeeded
NOTE: Running task 2164 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_unpack: Succeeded
NOTE: Running task 2165 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_patch)
NOTE: Running task 2166 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2167 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2168 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_patch: Succeeded
NOTE: Running task 2169 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2170 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Started
NOTE: Running task 2171 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2172 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure: Succeeded
NOTE: Running task 2173 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2174 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2175 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2572f28bd6d6ab3b8d5d65dea143291e7936867d7b6c5b21c4c3d1e3b7a8e7fe
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 3fdae2288785c051a164105ec6ece9574eb4b9f3db3bef5c60a659d569530abf to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '9c6fd820fd1fcb3339f3c8439febb6667e8326a281ed556679f5ebea4286a3eb', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '3fdae2288785c051a164105ec6ece9574eb4b9f3db3bef5c60a659d569530abf'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 9c6fd820fd1fcb3339f3c8439febb6667e8326a281ed556679f5ebea4286a3eb -> 3fdae2288785c051a164105ec6ece9574eb4b9f3db3bef5c60a659d569530abf as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.26.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2184 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.26.1.bb:do_compile)
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2185 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_install: Succeeded
NOTE: Running task 2187 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2188 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package: Succeeded
NOTE: Running task 2190 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2191 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_package)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_create_spdx)
NOTE: Running task 2193 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.8.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_package: Succeeded
NOTE: Running task 2194 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.86.2-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.26.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2194 tasks of which 2151 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.87.4-r0 to 0:6.86.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.86.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.86.2/temp/log.do_packagedata.2096899
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb:do_packagedata) failed with exit code '1'

--===============0606924138360531586==--

