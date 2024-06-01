Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274D5C30658
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:41 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42206.1717263217645949738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bRZ60sSL;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SZsH+0Yf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018fd4dd3533-d6e8f282-4af6-4246-b923-489f5af1aa35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=esdyQDjvKJTOzVw8jnNVS/OFb7x5Mhv/0Ja8JzE1jUQ=;
	b=bRZ60sSLgvcxvNOSXR2v+wQWhq0C4m/3StcAhFM7PjyU2rR/tvf/az6VshQ0D7ds
	69dhZGpTF+f38wHKWsTQJoApan2zjfvUUSb7ApxPtBsYQs8xP+iyDVXUcnG4HxvWQw/
	lWUDNqWqgZtRCzSkWV9Hept/VohRlNgXJpevIFWw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263218;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=esdyQDjvKJTOzVw8jnNVS/OFb7x5Mhv/0Ja8JzE1jUQ=;
	b=SZsH+0YfS+5gUR6E6Ycd2M1OqAJwTHjwwJVtDK/5L0rSCUHgVSkRMNVHUCVnH8x0
	HPDdUsDc2uLzLQxxaJ4gUL3P7/thI8OJNN1eBQDH2kkmSasL0ggdgQYFg0ttbyeYAoa
	8tl8bfafYKUtFuXwJlbanGNeNU3D1SvjWWyW8saM=
Content-Type: multipart/mixed; boundary="===============6675728979033736061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2024.5.22 SUCCEEDED
Message-ID: <0101018fd4dd3533-d6e8f282-4af6-4246-b923-489f5af1aa35-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200132

--===============6675728979033736061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2024.5.22* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.5.17-2024.5.2.patch
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
From 33bd98a3cbf874368eb09b22d43613227cb242a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 09:35:22 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.5.17 -> 2024.5.22

---
 ...iers_2024.5.17.bb => python3-trove-classifiers_2024.5.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.5.17.bb => python3-trove-classifiers_2024.5.22.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
index 94c48ed102..8876b63e7d 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d47a6f1c48803091c3fc81f535fecfeef65b558f2b9e4e83df7a79d17bce8bbf"
+SRC_URI[sha256sum] = "8a6242bbb5c9ae88d34cf665e816b287d2212973c8777dfaef5ec18d72ac1d03"
 
 PYPI_PACKAGE = "trove_classifiers"
 
-- 
2.44.0


--===============6675728979033736061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1878 targets, 46 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 70 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-454a7e96b4ac6634d3a6e0644086bfcbd951776d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:454a7e96b4ac6634d3a6e0644086bfcbd951776d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 558 Local 535 Mirrors 0 Missed 23 Current 241 (95% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 250 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 258 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 278 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 280 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 281 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-69.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 282 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 283 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 284 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 286 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/69.5.1/temp/log.do_packagedata_setscene.3036761
NOTE: Running setscene task 292 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_package_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wcwidth-0.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-wcwidth-0.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 317 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_package_setscene)
NOTE: Running setscene task 327 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 338 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 339 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 450 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: Running task 397 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_recipe_qa)
NOTE: Running task 463 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_fetch)
NOTE: Running task 503 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_fetch: Started
NOTE: Running setscene task 461 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 470 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: Running task 514 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_unpack)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 472 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-69.5.1-r0: task do_package_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_package_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 518 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_recipe_qa: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 483 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: Running task 520 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_fetch)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 548 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_unpack)
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 532 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_unpack: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 540 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1054 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1080 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1144 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_patch)
NOTE: recipe python3-pytest-8.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-69.5.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 564 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 566 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 567 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1214 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1273 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1274 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-23.2.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-69.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1281 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-69.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1358 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_populate_lic)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1360 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1379 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_populate_lic unihash changed to b129e5fc5db77280bb2b939bbbba7ad39487cb464c82674422a719ac27b1c7da
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 654 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 655 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 665 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 685 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 694 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 700 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 703 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 713 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 718 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 722 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 726 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1476 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1492 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1523 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1568 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 1b604f225d19067d8d0793c66ad9e114e380bd5c6976c3afd5b314e7b378caed to wss://hashserv.yoctoproject.org/ws ({'taskhash': '62ca092cb0537c881f0b94e9bdc7c5ceafe11ade62d9996d7bbcbb1bce3cef19', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '1b604f225d19067d8d0793c66ad9e114e380bd5c6976c3afd5b314e7b378caed'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 62ca092cb0537c881f0b94e9bdc7c5ceafe11ade62d9996d7bbcbb1bce3cef19 -> 1b604f225d19067d8d0793c66ad9e114e380bd5c6976c3afd5b314e7b378caed as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1888 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1965 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2115 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2198 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_packagedata)
NOTE: Running task 2212 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-69.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-69.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2238 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_configure: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_compile)
NOTE: Running task 2243 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2244 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2245 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile)
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2246 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2248 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_install: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_install)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2251 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 2252 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_install_ptest_base)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-23.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_install_ptest_base: Started
NOTE: Running task 2254 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2255 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_package)
NOTE: Running task 2256 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_populate_sysroot)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package unihash changed to e25ba00cc6a976a8e80a852542772b721ea796ca03c6c69f07b58c357e3630b9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata became valid
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package: Succeeded
NOTE: Running task 2258 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_packagedata)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package unihash changed to 688c13b0a6f365a502000c78481c5fa90f867dcb050ef0cccdee5c29592983b4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_package_write_deb became valid
NOTE: Running setscene task 796 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 797 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 798 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.2.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.2.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2259 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_create_spdx)
NOTE: Running task 2260 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_package_write_ipk)
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2261 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_package_write_deb)
NOTE: Running task 2262 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_package_write_rpm)
NOTE: Running task 2263 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_package_qa)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package_write_ipk: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package_write_deb: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package_qa: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_create_spdx: Succeeded
NOTE: Running task 2268 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_create_runtime_spdx)
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package_qa: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-trove-classifiers-2024.5.22-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2269 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.22.bb:do_build)
NOTE: Tasks Summary: Attempted 2269 tasks of which 2216 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:70.0.0-r0 to 0:69.5.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:70.0.0-r0 to 0:69.5.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:70.0.0-r0 to 0:69.5.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:70.0.0-r0 to 0:69.5.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:70.0.0-r0 to 0:69.5.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:70.0.0-r0 to 0:69.5.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:70.0.0-r0 to 0:69.5.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:70.0.0-r0 to 0:69.5.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.5.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6675728979033736061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.5.17-2024.5.2.patch"

RnJvbSAzM2JkOThhM2NiZjg3NDM2OGViMDliMjJkNDM2MTMyMjdjYjI0MmE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAwOTozNToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHJvdmUtY2xhc3NpZmllcnM6IHVwZ3JhZGUgMjAyNC41LjE3IC0+IDIwMjQuNS4yMgoK
LS0tCiAuLi5pZXJzXzIwMjQuNS4xNy5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIw
MjQuNS4yMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjQuNS4xNy5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJz
XzIwMjQuNS4yMi5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC41LjE3LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuNS4yMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC41LjE3LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAy
NC41LjIyLmJiCmluZGV4IDk0YzQ4ZWQxMDIuLjg4NzZiNjNlN2QgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjUu
MTcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNs
YXNzaWZpZXJzXzIwMjQuNS4yMi5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6
Ly9naXRodWIuY29tL3B5cGEvdHJvdmUtY2xhc3NpZmllcnMiCiBMSUNFTlNFID0gIkFwYWNoZS0y
LjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT04NmQzZjNhOTVjMzI0
Yzk0NzliZDg5ODY5NjhmNDMyNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0N2E2ZjFjNDg4
MDMwOTFjM2ZjODFmNTM1ZmVjZmVlZjY1YjU1OGYyYjllNGU4M2RmN2E3OWQxN2JjZThiYmYiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOGE2MjQyYmJiNWM5YWU4OGQzNGNmNjY1ZTgxNmIyODdkMjIx
Mjk3M2M4Nzc3ZGZhZWY1ZWMxOGQ3MmFjMWQwMyIKIAogUFlQSV9QQUNLQUdFID0gInRyb3ZlX2Ns
YXNzaWZpZXJzIgogCi0tIAoyLjQ0LjAKCg==

--===============6675728979033736061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.5.17.tar.gz;downloadfilename=trove_classifiers-2024.5.17.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove_classifiers/trove_classifiers-2024.5.22.tar.gz;downloadfilename=trove_classifiers-2024.5.22.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.5.17" to "2024.5.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.5.17" to "2024.5.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.5.17" to "2024.5.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.5.17" to "2024.5.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.5.17" to "2024.5.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.5.17" to "2024.5.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.5.17" to "2024.5.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.5.17" to "2024.5.22"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 92564 to 92626 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.5.17 [default] to 2024.5.22 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.5.17" to "2024.5.22"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.17.dist-info moved to /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.17.dist-info moved to /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info

--===============6675728979033736061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.17.dist-info moved to /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.17.dist-info moved to /usr/lib/python3.12/site-packages/trove_classifiers-2024.5.22.dist-info

--===============6675728979033736061==--

