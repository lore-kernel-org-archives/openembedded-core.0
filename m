Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613D4CD5BB1
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:36 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34833.1778851234760561502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ogDndVmb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dnGKfSlM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e2bcbc13b-df06aaf0-22f8-4b51-b51f-6e95a8c428aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xgfj5Ppj3iDF62aMWNPLLRoBcUE5jgcWVZLyGbhAumU=;
	b=ogDndVmb9FuKpwN3moXcra7GvhhygbblYhd1C4mSU+W0ljmbNDJYQ++4K3B2VlGE
	atKRMRgKx5OfxAzAKYGpc/toTFwmyPNReUVX20PNHyPhD7yoi2nXO1Cm2Wt4gJs32V0
	ukkpF1VOXqREQQ2x5JH3dYjbDsLGk0C6m3f5a+60=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851234;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xgfj5Ppj3iDF62aMWNPLLRoBcUE5jgcWVZLyGbhAumU=;
	b=dnGKfSlMXxr3BMhdluIoJeKLBExTjdd6LJXMRPwVPY6uqToo2zf4r8FUYZCg6Ajt
	OC3uPKQqdSreO6qsva3t0CnT8kXl1yLYNHtvayOaGbNM597sI1/uSCzeE8alLgZtyOy
	ap+29BlGeuQfzaSZ8OB/H6yxsCc1DZWUkQGRIbu0=
Content-Type: multipart/mixed; boundary="===============1253506009035002581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-requests: upgrading to 2.34.2 SUCCEEDED
Message-ID: <0101019e2bcbc13b-df06aaf0-22f8-4b51-b51f-6e95a8c428aa-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237127

--===============1253506009035002581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-requests* to *2.34.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-requests-upgrade-2.33.1-2.34.2.patch
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
From 2b12e2daf8989703a93249d0e438403f959aeb0f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 09:03:02 +0000
Subject: [PATCH] python3-requests: upgrade 2.33.1 -> 2.34.2

---
 .../{python3-requests_2.33.1.bb => python3-requests_2.34.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.33.1.bb => python3-requests_2.34.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.33.1.bb b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-requests_2.33.1.bb
rename to meta/recipes-devtools/python/python3-requests_2.34.2.bb
index e9c6fe4e97..79ce30feef 100644
--- a/meta/recipes-devtools/python/python3-requests_2.33.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.34.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "18817f8c57c6263968bc123d237e3b8b08ac046f5456bd1e307ee8f4250d3517"
+SRC_URI[sha256sum] = "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
 
 SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 
-- 
2.47.1


--===============1253506009035002581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1974 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-057422a38b61392d9966ab4b790bce4dadf2d968"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:057422a38b61392d9966ab4b790bce4dadf2d968"
meta-yocto-bsp       
meta-poky            = "master:0247a9ac12ffbb645d84c671ef34858c3307f01e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 521 Local 456 Mirrors 0 Missed 65 Current 312 (87% match, 92% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 342 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 343 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 374 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 380 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 413 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 474 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 475 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_recipe_qa_setscene)
NOTE: recipe python3-requests-2.34.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-certifi-2026.4.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 494 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 509 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.29.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 882 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_fetch)
NOTE: Running task 923 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 924 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_recipe_qa)
NOTE: Running task 928 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_fetch)
NOTE: Running task 929 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_fetch)
NOTE: Running task 930 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_fetch)
NOTE: recipe python3-3.14.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatchling-native-1.29.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 511 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.13-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_fetch: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.13-r0: task do_fetch: Succeeded
NOTE: Running setscene task 517 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.11.bb:do_packagedata_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hatchling-native-1.29.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 536 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.4.28.13.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 537 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 538 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 540 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.4.28.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 545 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 565 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1041 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_unpack)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1051 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_fetch)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1061 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1062 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_unpack)
NOTE: recipe python3-trove-classifiers-native-2026.4.28.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 578 of 833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1076 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1081 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_unpack)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-idna-3.13-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_fetch: Started
NOTE: recipe coreutils-9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-requests-2.34.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-idna-3.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: Running setscene task 593 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Started
NOTE: Running setscene task 597 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-certifi-2026.4.22-r0: task do_unpack: Started
NOTE: Running setscene task 600 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 602 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 606 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 615 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1162 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_patch)
NOTE: Running task 1194 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.13-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: Running setscene task 637 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 649 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 651 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 655 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 657 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.13-r0: task do_patch: Succeeded
NOTE: Running setscene task 658 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 660 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1221 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 691 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1257 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1260 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_unpack)
NOTE: Running task 1261 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1272 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_patch)
NOTE: Running task 1273 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_patch)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running task 1306 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1311 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_check_backend)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1320 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-idna-3.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_unpack: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_patch: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1322 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_patch)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Started
NOTE: recipe libgcrypt-1.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-requests-2.34.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Succeeded
NOTE: Running setscene task 707 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_patch: Succeeded
NOTE: Running setscene task 708 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_patch: Started
NOTE: Running setscene task 711 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 713 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 714 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-idna-3.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_deploy_source_date_epoch unihash changed to a91e06df2404a2c1c3db64960d4dff6916cba5731edc9c62dad0b1a8cce2ad7d
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch unihash changed to 6297db971db6fce87553fa432abd290d0793628a8382c103283480e86ffe5fec
NOTE: recipe python3-requests-2.34.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running task 1358 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1359 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1360 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_deploy_source_date_epoch)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 745 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 750 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 755 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 761 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1371 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1382 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1399 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1400 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_create_recipe_spdx)
NOTE: Running task 1406 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_create_recipe_spdx)
NOTE: Running task 1407 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_create_recipe_spdx)
NOTE: Running task 1408 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_create_recipe_spdx)
NOTE: recipe libgpg-error-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2026.4.22-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1414 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_recipe_spdx)
NOTE: Running setscene task 777 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 779 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 784 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_deploy_source_date_epoch unihash changed to 674570e17fc08cf93da7c1c165b578f9305965a409d0f67e1e0fe48d1b168324
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-idna-3.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1435 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_deploy_source_date_epoch unihash changed to ab2f13d42271edd294eaf117cc842c669c4ade94464f3f4277d7deea46cf2ffe
NOTE: recipe python3-certifi-2026.4.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_deploy_source_date_epoch unihash changed to aab9456b19d3250de79bcab9abe5b6674336c1a31c862f61b33a3c98a104429b
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-certifi-2026.4.22-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1452 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 806 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1470 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 833 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1790 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1878 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1879 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1880 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1881 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1882 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2010 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_configure)
NOTE: Running task 2011 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_configure)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2012 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_configure)
NOTE: Running task 2013 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.13-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_configure: Started
NOTE: Running task 2014 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_configure)
NOTE: Running task 2015 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_configure)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.13-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_configure: Started
NOTE: Running task 2016 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_compile)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Started
NOTE: Running task 2017 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_configure_ptest_base)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_configure: Succeeded
NOTE: Running task 2018 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2019 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-requests-2.34.2-r0: task do_compile: Started
NOTE: recipe python3-idna-3.13-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_configure: Succeeded
NOTE: Running task 2020 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_compile)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_compile: Started
NOTE: Running task 2021 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-idna-3.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2022 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_compile)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_compile: Started
NOTE: recipe python3-idna-3.13-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2023 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-idna-3.13-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_compile: Succeeded
NOTE: Running task 2030 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_compile_ptest_base)
NOTE: Running task 2032 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_install)
NOTE: recipe python3-idna-3.13-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-idna-3.13-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Started
NOTE: Running task 2034 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_install)
NOTE: recipe python3-idna-3.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_compile: Succeeded
NOTE: Running task 2035 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_install)
NOTE: recipe python3-requests-2.34.2-r0: task do_compile: Succeeded
NOTE: Running task 2036 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_install)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 2037 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 2038 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.34.2-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 2039 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2040 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.13-r0: task do_install: Succeeded
NOTE: Running task 2041 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_install_ptest_base)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_install: Succeeded
NOTE: Running task 2042 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package)
NOTE: Running task 2043 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.13-r0: task do_install_ptest_base: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package: Started
NOTE: recipe python3-idna-3.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2044 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_install: Succeeded
NOTE: Running task 2045 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_populate_sysroot)
NOTE: Running task 2046 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_package)
NOTE: Running task 2047 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.13-r0: task do_package: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2026.4.22-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-idna-3.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_packagedata)
NOTE: Running task 2050 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata unihash changed to e1a0cd46ec8995017f7e614380b045a85731ac9bc2f674b5a0f5a1a2943ca377
NOTE: recipe python3-certifi-2026.4.22-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 2051 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_create_spdx)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_install: Succeeded
NOTE: Running task 2052 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_ipk)
NOTE: recipe python3-urllib3-2.6.3-r0: task do_packagedata: Started
NOTE: Running task 2053 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_deb)
NOTE: Running task 2054 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_package)
NOTE: Running task 2055 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_populate_sysroot)
NOTE: Running task 2056 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm)
NOTE: Running task 2057 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_qa)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Started
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.34.2-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-idna-3.13-r0: task do_package: Succeeded
NOTE: Running task 2058 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_packagedata)
NOTE: Running task 2059 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_packagedata unihash changed to 5a0e042632c93aec79f6293b3b4261ec6b4bdbcf1c2d3657af8cbbb377f3b304
NOTE: recipe python3-requests-2.34.2-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_packagedata unihash changed to dfef1076db56ad8840b264d637ba79c3cd5a3eff9849455c8f0d3e329ca86959
NOTE: recipe python3-idna-3.13-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 2060 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_create_spdx)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2061 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb:do_create_spdx)
NOTE: Running task 2062 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package_write_ipk)
NOTE: Running task 2063 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package_write_deb)
NOTE: Running task 2064 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package_write_rpm)
NOTE: Running task 2065 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package_qa)
NOTE: recipe python3-certifi-2026.4.22-r0: task do_create_spdx: Started
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_spdx: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package_write_ipk: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package_write_deb: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package_qa: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_qa unihash changed to db0a5b130c3ed87d3a49312151f4367a355ff99df1dad8822ce50b129b1e9c90
NOTE: recipe python3-requests-2.34.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_ipk unihash changed to 9acd4b5fc9dd845fa9b2a59bdd9b69e4d2a9cb1b28b682e42dfc8a7210a23e16
NOTE: Running task 2066 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.34.2.bb:do_create_spdx)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_deb unihash changed to 539a2f766bdfe9753bb7c6db2b86c52c148b992f7fe4cecc11b15ba68334b1ec
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2026.4.22-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-requests-2.34.2-r0: task do_create_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-2.6.3-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package_write_rpm unihash changed to e2b25c221675f060ff82b681051b5fdece095c2ab927ae0a6abdf2e1f2c8d933
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package_qa unihash changed to 878c5d3c0d9c03af581b4d3d245e0a230cb10824c0b2c16c143072734e871859
NOTE: recipe python3-requests-2.34.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package_write_ipk unihash changed to a2a2d7a08433c0e4ccfe16fdebc7a18c35764983a9e0a75524618973e5c01742
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package_write_deb unihash changed to cb78063dd7f93ff7527f4e45d2f5d6308453d987b85844b5d20b21a3f7f5b736
NOTE: recipe python3-certifi-2026.4.22-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb:do_package_write_rpm unihash changed to 01bf153c87b7cbb41fc9c4389cf4a8a0515e435baeaf036a27497975ccc32175
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_package: Succeeded
NOTE: Running task 2067 of 2087 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata)
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.13-r0: task do_packagedata: Failed
NOTE: recipe python3-chardet-6.0.0.post1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2067 tasks of which 1969 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515090239.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260515090239.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-idna/3.13/temp/log.do_packagedata.1973613
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-chardet/6.0.0.post1/temp/log.do_packagedata.1975061
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: python3-idna-3.13-r0 do_packagedata: QA Issue: Package version for package python3-idna-src went backwards which would break package feeds (from 0:3.15-r0 to 0:3.13-r0) [version-going-backwards]
ERROR: python3-idna-3.13-r0 do_packagedata: QA Issue: Package version for package python3-idna-dbg went backwards which would break package feeds (from 0:3.15-r0 to 0:3.13-r0) [version-going-backwards]
ERROR: python3-idna-3.13-r0 do_packagedata: QA Issue: Package version for package python3-idna-ptest went backwards which would break package feeds (from 0:3.15-r0 to 0:3.13-r0) [version-going-backwards]
ERROR: python3-idna-3.13-r0 do_packagedata: QA Issue: Package version for package python3-idna-staticdev went backwards which would break package feeds (from 0:3.15-r0 to 0:3.13-r0) [version-going-backwards]
ERROR: python3-idna-3.13-r0 do_packagedata: QA Issue: Package version for package python3-idna-dev went backwards which would break package feeds (from 0:3.15-r0 to 0:3.13-r0) [version-going-backwards]
ERROR: python3-idna-3.13-r0 do_packagedata: QA Issue: Package version for package python3-idna-doc went backwards which would break package feeds (from 0:3.15-r0 to 0:3.13-r0) [version-going-backwards]
ERROR: python3-idna-3.13-r0 do_packagedata: QA Issue: Package version for package python3-idna-locale went backwards which would break package feeds (from 0:3.15-r0 to 0:3.13-r0) [version-going-backwards]
ERROR: python3-idna-3.13-r0 do_packagedata: QA Issue: Package version for package python3-idna went backwards which would break package feeds (from 0:3.15-r0 to 0:3.13-r0) [version-going-backwards]
ERROR: python3-idna-3.13-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-src went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dbg went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-cli went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-staticdev went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-dev went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-doc went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet-locale went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: QA Issue: Package version for package python3-chardet went backwards which would break package feeds (from 0:7.4.3-r0 to 0:6.0.0.post1-r0) [version-going-backwards]
ERROR: python3-chardet-6.0.0.post1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-idna/3.13/temp/log.do_packagedata.1973613
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.13.bb:do_packagedata) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-chardet/6.0.0.post1/temp/log.do_packagedata.1975061
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb:do_packagedata) failed with exit code '1'

--===============1253506009035002581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-requests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/requests/requests-2.33.1.tar.gz;downloadfilename=requests-2.33.1.tar.gz" to "https://files.pythonhosted.org/packages/source/r/requests/requests-2.34.2.tar.gz;downloadfilename=requests-2.34.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-requests: PKGV changed from 2.33.1 [default] to 2.34.2 [default]
packages/x86-64-v3-poky-linux/python3-requests: PV changed from "2.33.1" to "2.34.2"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dbg: PKGV changed from 2.33.1 [default] to 2.34.2 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dbg: PV changed from "2.33.1" to "2.34.2"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dev: PKGV changed from 2.33.1 [default] to 2.34.2 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-dev: PV changed from "2.33.1" to "2.34.2"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-doc: PKGV changed from 2.33.1 [default] to 2.34.2 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-doc: PV changed from "2.33.1" to "2.34.2"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-locale: PKGV changed from 2.33.1 [default] to 2.34.2 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-locale: PV changed from "2.33.1" to "2.34.2"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-src: PKGV changed from 2.33.1 [default] to 2.34.2 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-src: PV changed from "2.33.1" to "2.34.2"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-staticdev: PKGV changed from 2.33.1 [default] to 2.34.2 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests-staticdev: PV changed from "2.33.1" to "2.34.2"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: FILELIST: directory renamed /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/requests-2.34.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info -> /usr/lib/python3.14/site-packages/requests-2.34.2.dist-info, added "/usr/lib/python3.14/site-packages/requests/py.typed /usr/lib/python3.14/site-packages/requests/__pycache__/_types.cpython-314.pyc /usr/lib/python3.14/site-packages/requests/_types.py"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PKGV changed from 2.33.1 [default] to 2.34.2 [default]
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 414081 to 513781 (+24%)
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PV changed from "2.33.1" to "2.34.2"
Changes to packages/x86-64-v3-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info moved to /usr/lib/python3.14/site-packages/requests-2.34.2.dist-info
  /usr/lib/python3.14/site-packages/requests/__pycache__/_types.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/requests/py.typed was added
  /usr/lib/python3.14/site-packages/requests/_types.py was added

--===============1253506009035002581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-requests/python3-requests: FILELIST: directory renamed /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info -> /usr/lib/python3.14/site-packages/requests-2.34.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/requests-2.34.2.dist-info/licenses, added "/usr/lib/python3.14/site-packages/requests/py.typed /usr/lib/python3.14/site-packages/requests/_types.py /usr/lib/python3.14/site-packages/requests/__pycache__/_types.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-requests/python3-requests: PKGSIZE changed from 414081 to 513781 (+24%)
Changes to packages/x86-64-v3-poky-linux/python3-requests (sysroot):
  /usr/lib/python3.14/site-packages/requests-2.33.1.dist-info moved to /usr/lib/python3.14/site-packages/requests-2.34.2.dist-info
  /usr/lib/python3.14/site-packages/requests/__pycache__/_types.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/requests/py.typed was added
  /usr/lib/python3.14/site-packages/requests/_types.py was added

--===============1253506009035002581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-requests-upgrade-2.33.1-2.34.2.patch"

RnJvbSAyYjEyZTJkYWY4OTg5NzAzYTkzMjQ5ZDBlNDM4NDAzZjk1OWFlYjBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDk6MDM6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJlcXVlc3RzOiB1cGdyYWRlIDIuMzMuMSAtPiAyLjM0LjIKCi0tLQogLi4uL3tweXRo
b24zLXJlcXVlc3RzXzIuMzMuMS5iYiA9PiBweXRob24zLXJlcXVlc3RzXzIuMzQuMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1yZXF1ZXN0c18yLjMzLjEu
YmIgPT4gcHl0aG9uMy1yZXF1ZXN0c18yLjM0LjIuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzMuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1yZXF1ZXN0c18yLjM0LjIuYmIKc2lt
aWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXJlcXVlc3RzXzIuMzMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXJlcXVlc3RzXzIuMzQuMi5iYgppbmRleCBlOWM2ZmU0ZTk3Li43
OWNlMzBmZWVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcmVxdWVzdHNfMi4zMy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1yZXF1ZXN0c18yLjM0LjIuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTM0NDAwYjY4MDcyZDcxMGZlY2QwYTI5NDBhMGQxNjU4
IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMTg4MTdmOGM1N2M2MjYzOTY4YmMxMjNkMjM3ZTNiOGIwOGFjMDQ2ZjU0
NTZiZDFlMzA3ZWU4ZjQyNTBkMzUxNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMjg4OTI0Y2Fl
NGUyOTQ2MzY5OGQ2ZDYwYmM2YTRkYTY5Yzg5MTg1YWQxZTBiY2M0MTA0ZjU4NGU5NjBiOWVkIgog
CiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIGZpbGU6Ly9lbnZpcm9ubWVudC5k
LXB5dGhvbjMtcmVxdWVzdHMuc2giCiAKLS0gCjIuNDcuMQoK

--===============1253506009035002581==--

