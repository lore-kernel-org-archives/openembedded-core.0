Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E87C04AAA
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.102709.1697399114769493320
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OYb9DY1k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iR0t7Xq1;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b34df0944-e0c7962e-5b0b-4127-a50d-9eacbef244b9-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=leypfTyK6GDb/FX+PbatOxyLrii8pcyj3Vgv2GSlvNU=;
	b=OYb9DY1kmh3ndUHV0l1GDeXYR6VcY5IKx0nFHh3aiJx2uQRotDTThgXO7ULG4c8G
	CT9LpNjITJfntqtEAbh7l9YItPpMucvn5GKJQC2MnDnlI3AOh18WtSCu19ANOhwHjMr
	+JeCU+TyxxuDirOzijo2GEIp8MJaUlqXdvSJbwk8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=leypfTyK6GDb/FX+PbatOxyLrii8pcyj3Vgv2GSlvNU=;
	b=iR0t7Xq1/ebg7H92JqzaeozjabqD0X+9o42xxliDMI9KhoF/zzXtydGzmTtmhk3w
	pJTVDVNn1XFVu/SDgflPR8VcqzPURBVP86QU63y1ltfblY0Pr5N5NeTGoKT5H4ZdUks
	BqbhcWB1by1lhqEThRsJpym2Iv11kPfg6zO3eKZY=
Content-Type: multipart/mixed; boundary="===============3373686584494931040=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-spdx-tools: upgrading to 0.8.2 SUCCEEDED
Message-ID: <0101018b34df0944-e0c7962e-5b0b-4127-a50d-9eacbef244b9-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189199

--===============3373686584494931040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-spdx-tools* to *0.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-spdx-tools-upgrade-0.8.1-0.8.2.patch
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
From 7f7b52b4b7d937bcc19e328d8a4c58080b328260 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 12:08:16 +0000
Subject: [PATCH] python3-spdx-tools: upgrade 0.8.1 -> 0.8.2

---
 ...{python3-spdx-tools_0.8.1.bb => python3-spdx-tools_0.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-spdx-tools_0.8.1.bb => python3-spdx-tools_0.8.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb b/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb
rename to meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
index f58a138430..53263ca032 100644
--- a/meta/recipes-devtools/python/python3-spdx-tools_0.8.1.bb
+++ b/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/spdx/tools-python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dc7f21ccff0f672f2a7cd6f412ae627d"
 
-SRC_URI[sha256sum] = "c83652cd65b5726058dcbdaab85839dbe484c43ea6f61046137516aa1b8428ae"
+SRC_URI[sha256sum] = "aea4ac9c2c375e7f439b1cef5ff32ef34914c083de0f61e08ed67cd3d9deb2a9"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


--===============3373686584494931040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 50 skipped, 0 masked, 0 errors.
Removing 42 recipes from the core2-32 sysroot...done.
Removing 74 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-64aecbf7235e3fd9a245d8d7877feea5a22deff7"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:64aecbf7235e3fd9a245d8d7877feea5a22deff7"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 444 Local 373 Mirrors 0 Missed 71 Current 298 (84% match, 90% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 299 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 376 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 379 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ply-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 399 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_recipe_qa)
NOTE: Running task 400 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_recipe_qa)
NOTE: Running task 401 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_recipe_qa)
NOTE: Running task 413 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_recipe_qa)
NOTE: Running task 418 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_recipe_qa)
NOTE: Running task 419 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_recipe_qa)
NOTE: Running task 420 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa)
NOTE: Running task 421 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_recipe_qa)
NOTE: Running task 422 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_recipe_qa)
NOTE: Running task 441 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_recipe_qa)
NOTE: Running task 442 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_recipe_qa)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe python3-ply-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_setscene)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyparsing-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 405 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 428 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 458 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_fetch)
NOTE: Running task 459 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_fetch)
NOTE: Running task 460 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_fetch)
NOTE: Running task 461 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_fetch)
NOTE: Running task 462 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_fetch)
NOTE: Running task 463 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_fetch)
NOTE: Running task 464 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 465 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_fetch)
NOTE: Running task 466 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_fetch)
NOTE: Running task 473 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_fetch)
NOTE: Running task 475 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 478 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_unpack)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 479 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_unpack)
NOTE: Running task 480 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 481 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_unpack)
NOTE: Running task 482 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_unpack)
NOTE: Running task 483 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_unpack)
NOTE: Running task 484 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_unpack)
NOTE: Running task 485 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_unpack)
NOTE: Running task 486 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_unpack)
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 487 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 491 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Started
NOTE: Running setscene task 453 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 478 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-ply-3.11-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 492 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running task 522 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 516 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 517 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1006 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_patch)
NOTE: Running task 1007 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_patch)
NOTE: Running task 1008 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_patch)
NOTE: Running task 1039 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_patch)
NOTE: Running task 1045 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1049 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_patch)
NOTE: Running task 1050 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_patch)
NOTE: Running task 1051 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: Running task 1052 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1057 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_patch)
NOTE: Running task 1065 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1096 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_patch)
NOTE: Running task 1098 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-ply-3.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Started
NOTE: Running setscene task 541 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 543 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Started
NOTE: Running setscene task 545 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ply-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1176 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1178 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1181 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1182 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1183 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1184 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1185 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_lic)
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_fetch)
NOTE: Running task 1188 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1189 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1190 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 560 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1212 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_fetch: Started
NOTE: recipe python3-ply-3.11-r0: task do_fetch: Succeeded
NOTE: Running task 1218 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_unpack)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_lic unihash changed to 088679d6da668cdfe143d096f484414abfa7c6ff85c0e1b62aa9b60978729eb5
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 586 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-ply-3.11-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1230 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 626 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1257 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 652 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 656 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 661 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 663 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 664 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running setscene task 667 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1334 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 704 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 708 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1380 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 65b6804f18b5304f7fc6bf26f99eb080c6989c489e5ea6be5abbbd4524adf075
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 737 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1726 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1727 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1728 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1818 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1841 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1842 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1843 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1844 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1845 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1906 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1929 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1931 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1977 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1978 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_collect_spdx_deps)
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1979 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_collect_spdx_deps)
NOTE: Running task 1980 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1981 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1982 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1983 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 1984 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1985 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1995 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_rpm)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1997 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_create_spdx)
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1998 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure)
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1999 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2000 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2001 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_configure)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2002 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2003 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_configure)
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2004 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_configure)
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2005 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_configure)
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2006 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_configure)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2007 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Started
NOTE: Running task 2008 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_configure)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Started
NOTE: Running task 2010 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2011 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_compile)
NOTE: Running task 2013 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2014 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_compile)
NOTE: Running task 2015 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_compile)
NOTE: Running task 2016 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_compile)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Started
NOTE: Running task 2017 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_compile)
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2018 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_compile)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2019 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_compile)
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Started
NOTE: Running task 2020 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Started
NOTE: Running task 2021 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Started
NOTE: Running task 2022 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Started
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2024 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_install)
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2025 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_install)
NOTE: Running task 2026 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Succeeded
NOTE: Running task 2027 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile_ptest_base)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Started
NOTE: Running task 2028 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2029 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2030 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2031 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_install)
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Started
NOTE: Running task 2033 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 2034 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_install)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package)
NOTE: Running task 2036 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package)
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: Running task 2037 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_package)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Succeeded
NOTE: Running task 2038 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-click-8.1.7-r0: task do_install: Succeeded
NOTE: Running task 2039 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2040 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2041 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package)
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 2042 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2043 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_package: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package)
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Started
NOTE: Running task 2045 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_package)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Succeeded
NOTE: Running task 2046 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_package)
NOTE: Running task 2047 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_sysroot)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2048 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Succeeded
NOTE: Running task 2049 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_packagedata)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Started
NOTE: Running task 2050 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: Running task 2051 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Started
NOTE: Running task 2052 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2053 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2054 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: Running task 2055 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package)
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2056 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_create_spdx)
NOTE: Running task 2057 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Succeeded
NOTE: Running task 2058 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_packagedata)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2059 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_create_spdx)
NOTE: Running task 2060 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_rpm)
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2061 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2062 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_create_spdx)
NOTE: Running task 2063 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_rpm)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Started
NOTE: Running task 2064 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_packagedata)
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2065 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_packagedata)
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2066 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_create_spdx)
NOTE: Running task 2067 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2068 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_create_spdx)
NOTE: Running task 2069 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Succeeded
NOTE: Running task 2070 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata)
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_packagedata)
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2071 tasks of which 1907 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-src went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dbg went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-staticdev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-doc went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-locale went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-beartype/0.15.0/temp/log.do_packagedata.2388584
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata) failed with exit code '1'

--===============3373686584494931040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1849 entries from dependency cache.
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
DISTRO_VERSION       = "4.2+snapshot-64aecbf7235e3fd9a245d8d7877feea5a22deff7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:64aecbf7235e3fd9a245d8d7877feea5a22deff7"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 109 Local 38 Mirrors 0 Missed 71 Current 615 (34% match, 90% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1337 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_recipe_qa)
NOTE: Running task 1338 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_recipe_qa)
NOTE: Running task 1339 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_recipe_qa)
NOTE: Running task 1448 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_recipe_qa)
NOTE: Running task 1508 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_recipe_qa)
NOTE: Running task 1509 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_recipe_qa)
NOTE: Running task 1510 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa)
NOTE: Running task 1511 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_recipe_qa)
NOTE: Running task 1512 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_recipe_qa)
NOTE: Running task 1615 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1618 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_fetch)
NOTE: Running task 1619 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_fetch)
NOTE: Running task 1620 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_fetch)
NOTE: Running task 1621 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_fetch)
NOTE: Running task 1622 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_fetch)
NOTE: Running task 1623 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_fetch)
NOTE: Running task 1624 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1625 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_fetch)
NOTE: Running task 1626 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_fetch)
NOTE: Running task 1687 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_recipe_qa)
NOTE: Running task 1688 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_recipe_qa)
NOTE: Running task 1875 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_collect_spdx_deps)
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1888 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_rpm)
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1889 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_unpack)
NOTE: Running task 1890 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_unpack)
NOTE: Running task 1891 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_unpack)
NOTE: Running task 1892 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: Running task 1893 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1894 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_unpack)
NOTE: Running task 1895 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_unpack)
NOTE: Running task 1896 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_unpack)
NOTE: Running task 1897 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1898 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1900 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_unpack)
NOTE: Running task 1901 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_unpack)
NOTE: Running task 1902 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1903 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1905 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Started
NOTE: Running task 1906 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1907 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_fetch)
NOTE: Running task 1908 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_fetch)
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Started
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Started
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: Running task 1910 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Started
NOTE: Running task 1911 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_patch)
NOTE: Running task 1912 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1913 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_patch)
NOTE: Running task 1914 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_patch)
NOTE: Running task 1915 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_patch)
NOTE: Running task 1916 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_patch)
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1917 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_patch)
NOTE: Running task 1918 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_patch)
NOTE: Running task 1919 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1920 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Started
NOTE: Running task 1921 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1922 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_unpack)
NOTE: Running task 1923 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1924 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_unpack)
NOTE: Running task 1925 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1926 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Started
NOTE: Running task 1927 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Started
NOTE: Running task 1928 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1929 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_create_spdx)
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1930 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_patch)
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1934 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1937 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_patch)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1938 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1939 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_patch)
NOTE: Running task 1940 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1941 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_lic)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1943 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1944 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1945 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1946 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1947 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1948 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1949 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1950 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1951 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1952 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_configure)
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1953 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure)
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1954 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_configure)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1955 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure)
NOTE: Running task 1956 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1957 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_configure)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Started
NOTE: Running task 1958 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure)
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1959 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_configure)
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Started
NOTE: Running task 1960 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_configure)
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: Running task 1961 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_configure)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1962 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_compile)
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1964 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure_ptest_base)
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1965 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_compile)
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1966 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1967 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Started
NOTE: Running task 1968 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_compile)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Started
NOTE: Running task 1969 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1970 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_compile)
NOTE: Running task 1972 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_compile)
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Succeeded
NOTE: Running task 1973 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_compile)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: Running task 1974 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile)
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Started
NOTE: Running task 1975 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_compile)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1976 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1977 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile)
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 41de79a8e5aa4adff5c84d9689e46f868ca74cfd324d8705ad647ed0c045a6a1
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_install)
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_install)
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1985 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile_ptest_base)
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Started
NOTE: Running task 1986 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_install)
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Started
NOTE: Running task 1988 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1989 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Started
NOTE: Running task 1990 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1991 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_install)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Started
NOTE: Running task 1992 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Started
NOTE: Running task 1993 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Succeeded
NOTE: Running task 1994 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package)
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: Running task 1995 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_package)
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Succeeded
NOTE: Running task 1996 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-click-8.1.7-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Started
NOTE: Running task 1998 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1999 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2000 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2001 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package)
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Succeeded
NOTE: Running task 2002 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_package)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Started
NOTE: Running task 2003 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Succeeded
NOTE: Running task 2004 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_package)
NOTE: Running task 2005 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_sysroot)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Succeeded
NOTE: Running task 2006 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: Running task 2007 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Succeeded
NOTE: Running task 2008 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Succeeded
NOTE: Running task 2009 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Succeeded
NOTE: Running task 2010 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2011 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2012 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx)
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Started
NOTE: Running task 2013 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2014 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_create_spdx)
NOTE: Running task 2015 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Succeeded
NOTE: Running task 2016 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_packagedata)
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2017 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_create_spdx)
NOTE: Running task 2018 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_rpm)
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2019 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_packagedata)
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2020 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_create_spdx)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Succeeded
NOTE: Running task 2021 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_rpm)
NOTE: Running task 2022 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_packagedata)
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Succeeded
NOTE: Running task 2023 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2024 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_create_spdx)
NOTE: Running task 2025 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2026 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_create_spdx)
NOTE: Running task 2027 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Succeeded
NOTE: Running task 2029 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_packagedata)
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2029 tasks of which 1873 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-src went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dbg went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-staticdev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-doc went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-locale went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.15.0/temp/log.do_packagedata.2311580
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata) failed with exit code '1'

--===============3373686584494931040==
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
DISTRO_VERSION       = "4.2+snapshot-64aecbf7235e3fd9a245d8d7877feea5a22deff7"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:64aecbf7235e3fd9a245d8d7877feea5a22deff7"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 39 Mirrors 0 Missed 71 Current 614 (35% match, 90% complete)
Removing 2 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1337 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_recipe_qa)
NOTE: Running task 1338 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_recipe_qa)
NOTE: Running task 1339 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_recipe_qa)
NOTE: Running task 1448 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_recipe_qa)
NOTE: Running task 1507 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_recipe_qa)
NOTE: Running task 1508 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa)
NOTE: Running task 1509 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_recipe_qa)
NOTE: Running task 1510 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_recipe_qa)
NOTE: Running task 1512 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_recipe_qa)
NOTE: Running task 1614 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1617 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_fetch)
NOTE: Running task 1618 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_fetch)
NOTE: Running task 1619 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_fetch)
NOTE: Running task 1620 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_fetch)
NOTE: Running task 1621 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_fetch)
NOTE: Running task 1622 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1623 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_fetch)
NOTE: Running task 1624 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_fetch)
NOTE: Running task 1625 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_fetch)
NOTE: Running task 1687 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_recipe_qa)
NOTE: Running task 1689 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_recipe_qa)
NOTE: Running task 1875 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_collect_spdx_deps)
NOTE: Running task 1888 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1889 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: Running task 1890 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_unpack)
NOTE: Running task 1891 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_unpack)
NOTE: Running task 1892 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1893 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_unpack)
NOTE: Running task 1894 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_unpack)
NOTE: Running task 1895 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_unpack)
NOTE: Running task 1896 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1897 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1898 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_unpack)
NOTE: Running task 1900 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_unpack)
NOTE: Running task 1901 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_unpack)
NOTE: Running task 1902 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1903 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1905 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1907 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_fetch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Started
NOTE: Running task 1908 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_fetch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1909 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: Running task 1910 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1911 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_create_spdx)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1912 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_patch)
NOTE: Running task 1913 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_patch)
NOTE: Running task 1914 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_patch)
NOTE: Running task 1915 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_patch)
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1916 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1917 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_patch)
NOTE: Running task 1918 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1919 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1920 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_patch)
NOTE: Running task 1921 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_patch)
NOTE: Running task 1922 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_unpack)
NOTE: Running task 1923 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_unpack)
NOTE: Running task 1924 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: Running task 1925 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Started
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Started
NOTE: Running task 1926 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Started
NOTE: Running task 1927 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Started
NOTE: Running task 1928 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1929 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1933 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1936 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_patch)
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1937 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Started
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1938 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_patch)
NOTE: Running task 1939 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1940 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1941 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1942 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1943 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_lic)
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1944 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1945 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1946 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1947 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1948 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1949 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1950 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1951 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1952 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1953 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure)
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1954 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_configure)
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1955 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_configure)
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1956 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1957 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: Running task 1958 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_configure)
NOTE: Running task 1959 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_configure)
NOTE: Running task 1960 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_configure)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Started
NOTE: Running task 1961 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1962 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_configure)
NOTE: Running task 1963 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_configure)
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Succeeded
NOTE: Running task 1964 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure_ptest_base)
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1965 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_compile)
NOTE: Running task 1966 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_compile)
NOTE: Running task 1967 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1968 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: Running task 1969 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_compile)
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Started
NOTE: Running task 1970 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure_ptest_base)
NOTE: Running task 1971 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_compile)
NOTE: Running task 1972 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_compile)
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Started
NOTE: Running task 1973 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_compile)
NOTE: Running task 1974 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Started
NOTE: Running task 1975 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_compile)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Started
NOTE: Running task 1976 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1977 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile)
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 92d337ef06d6815edfae603f3065f50a80d7a4e3b16f348bd050c3d4b458d813
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_install)
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_install)
NOTE: Running task 1984 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1985 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Started
NOTE: Running task 1986 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_install)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1989 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Started
NOTE: Running task 1990 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 1991 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1992 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_install: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Succeeded
NOTE: Running task 1993 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Succeeded
NOTE: Running task 1994 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_package)
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Succeeded
NOTE: Running task 1996 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-click-8.1.7-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install_ptest_base)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1998 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1999 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2000 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Succeeded
NOTE: Running task 2001 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package)
NOTE: Running task 2002 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package)
NOTE: Running task 2003 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_package)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Succeeded
NOTE: Running task 2005 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_package)
NOTE: Running task 2006 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_sysroot)
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Succeeded
NOTE: Running task 2007 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Succeeded
NOTE: Running task 2008 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install_ptest_base)
NOTE: Running task 2009 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2010 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx)
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Started
NOTE: Running task 2011 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Started
NOTE: Running task 2012 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_packagedata)
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2013 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_create_spdx)
NOTE: Running task 2014 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Started
NOTE: Running task 2015 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package)
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Succeeded
NOTE: Running task 2016 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_packagedata)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2017 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_create_spdx)
NOTE: Running task 2018 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_rpm)
NOTE: recipe python3-click-8.1.7-r0: task do_package: Succeeded
NOTE: Running task 2019 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_packagedata)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2020 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_packagedata)
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2021 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_create_spdx)
NOTE: Running task 2022 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_rpm)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Succeeded
NOTE: Running task 2023 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2024 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_create_spdx)
NOTE: Running task 2025 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2026 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_create_spdx)
NOTE: Running task 2027 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2028 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata)
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2029 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_packagedata)
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2029 tasks of which 1873 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-src went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dbg went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-staticdev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-doc went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-locale went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-beartype/0.15.0/temp/log.do_packagedata.2345333
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata) failed with exit code '1'

--===============3373686584494931040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-spdx-tools: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/python3-spdx-tools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/spdx-tools/spdx-tools-0.8.1.tar.gz;downloadfilename=spdx-tools-0.8.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/spdx-tools/spdx-tools-0.8.2.tar.gz;downloadfilename=spdx-tools-0.8.2.tar.gz"
packages/core2-32-poky-linux/python3-spdx-tools: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-dbg: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-dbg: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-dev: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-dev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-doc: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-doc: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-locale: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-locale: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-src: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-src: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-staticdev: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools-staticdev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools: PKGSIZE changed from 1664188 to 1666903 (+0%)
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools: PV changed from "0.8.1" to "0.8.2"
packages/core2-32-poky-linux/python3-spdx-tools/python3-spdx-tools: PKGV changed from 0.8.1 [default] to 0.8.2 [default]

--===============3373686584494931040==
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
DISTRO_VERSION       = "4.2+snapshot-64aecbf7235e3fd9a245d8d7877feea5a22deff7"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:64aecbf7235e3fd9a245d8d7877feea5a22deff7"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 109 Local 38 Mirrors 0 Missed 71 Current 615 (34% match, 90% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1337 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_recipe_qa)
NOTE: Running task 1338 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_recipe_qa)
NOTE: Running task 1339 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_recipe_qa)
NOTE: Running task 1448 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_recipe_qa)
NOTE: Running task 1507 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_recipe_qa)
NOTE: Running task 1508 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_recipe_qa)
NOTE: Running task 1509 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_recipe_qa)
NOTE: Running task 1511 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_recipe_qa)
NOTE: Running task 1512 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa)
NOTE: Running task 1615 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1618 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_fetch)
NOTE: Running task 1619 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_fetch)
NOTE: Running task 1620 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_fetch)
NOTE: Running task 1621 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_fetch)
NOTE: Running task 1622 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_fetch)
NOTE: Running task 1623 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_fetch)
NOTE: Running task 1624 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_fetch)
NOTE: Running task 1625 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_fetch)
NOTE: Running task 1626 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1687 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_recipe_qa)
NOTE: Running task 1688 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_recipe_qa)
NOTE: Running task 1875 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1888 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_rpm)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1889 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_unpack)
NOTE: Running task 1890 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_unpack)
NOTE: Running task 1891 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_unpack)
NOTE: Running task 1892 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1893 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1894 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1895 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_unpack)
NOTE: Running task 1896 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_unpack)
NOTE: Running task 1897 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_unpack)
NOTE: Running task 1898 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_unpack)
NOTE: Running task 1899 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_unpack)
NOTE: Running task 1900 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: Running task 1901 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1902 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1903 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1905 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Started
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Started
NOTE: Running task 1906 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1907 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_fetch)
NOTE: Running task 1908 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_fetch)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1909 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_patch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Started
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1910 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_patch)
NOTE: Running task 1912 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_patch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1913 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_patch)
NOTE: Running task 1914 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1915 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1916 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_patch)
NOTE: Running task 1917 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Started
NOTE: Running task 1918 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_patch)
NOTE: Running task 1919 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_patch)
NOTE: Running task 1920 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1921 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_unpack)
NOTE: Running task 1922 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_unpack)
NOTE: Running task 1923 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1924 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Started
NOTE: Running task 1925 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1926 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1927 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Started
NOTE: Running task 1928 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1929 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1933 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1936 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_patch)
NOTE: Running task 1937 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_patch)
NOTE: Running task 1938 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_create_spdx)
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1939 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_patch)
NOTE: Running task 1940 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1941 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1942 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Succeeded
NOTE: Running task 1943 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1944 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_lic)
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Started
NOTE: Running task 1945 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1946 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1947 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1948 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1949 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1950 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1951 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1952 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1953 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure)
NOTE: Running task 1954 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure)
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1955 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_configure)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1956 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1957 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: Running task 1958 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure)
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1959 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_configure)
NOTE: Running task 1960 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_configure)
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Started
NOTE: Running task 1961 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_configure)
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1962 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_configure)
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure_ptest_base)
NOTE: Running task 1964 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1965 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_compile)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Succeeded
NOTE: Running task 1966 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_compile)
NOTE: Running task 1967 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1968 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1969 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_compile)
NOTE: Running task 1970 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_compile)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1971 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 1972 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_compile)
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1973 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1974 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Started
NOTE: Running task 1975 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1976 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile)
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1977 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_compile)
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 200bb33903ec133f456f3590c1839eabe64198ee0b7808a12285742dded5600b
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_install)
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Started
NOTE: Running task 1985 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1986 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_install)
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 1987 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_install)
NOTE: Running task 1988 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1990 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Started
NOTE: Running task 1991 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install)
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1992 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_install)
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Succeeded
NOTE: Running task 1993 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Succeeded
NOTE: Running task 1994 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package)
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_package)
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Started
NOTE: Running task 1996 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-click-8.1.7-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1998 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1999 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package)
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2000 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2001 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Succeeded
NOTE: Running task 2002 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package)
NOTE: Running task 2003 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_package)
NOTE: recipe python3-click-8.1.7-r0: task do_package: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Succeeded
NOTE: Running task 2005 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_package)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: Running task 2006 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_sysroot)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Succeeded
NOTE: Running task 2007 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2008 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx)
NOTE: Running task 2009 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Succeeded
NOTE: Running task 2010 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Started
NOTE: Running task 2011 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Succeeded
NOTE: Running task 2012 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_create_spdx)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Started
NOTE: Running task 2013 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package_write_rpm)
NOTE: Running task 2014 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_packagedata)
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2015 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Succeeded
NOTE: Running task 2016 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_packagedata)
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2017 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_create_spdx)
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2018 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_rpm)
NOTE: recipe python3-click-8.1.7-r0: task do_package: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Started
NOTE: Running task 2019 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_packagedata)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2020 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_create_spdx)
NOTE: Running task 2021 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_rpm)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Succeeded
NOTE: Running task 2022 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_packagedata)
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2023 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_create_spdx)
NOTE: Running task 2024 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_packagedata)
NOTE: Running task 2025 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2026 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_create_spdx)
NOTE: Running task 2027 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Started
NOTE: Running task 2028 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2029 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_packagedata)
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2029 tasks of which 1873 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-src went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dbg went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-staticdev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-doc went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-locale went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-beartype/0.15.0/temp/log.do_packagedata.2362411
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata) failed with exit code '1'

--===============3373686584494931040==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-spdx-tools-upgrade-0.8.1-0.8.2.patch"

RnJvbSA3ZjdiNTJiNGI3ZDkzN2JjYzE5ZTMyOGQ4YTRjNTgwODBiMzI4MjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTI6MDg6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwZHgtdG9vbHM6IHVwZ3JhZGUgMC44LjEgLT4gMC44LjIKCi0tLQogLi4ue3B5dGhv
bjMtc3BkeC10b29sc18wLjguMS5iYiA9PiBweXRob24zLXNwZHgtdG9vbHNfMC44LjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4x
LmJiID0+IHB5dGhvbjMtc3BkeC10b29sc18wLjguMi5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BkeC10b29sc18wLjguMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4yLmJi
CnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BkeC10b29sc18wLjguMi5iYgppbmRleCBmNThhMTM4
NDMwLi41MzI2M2NhMDMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc3BkeC10b29sc18wLjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc3BkeC10b29sc18wLjguMi5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBB
R0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3NwZHgvdG9vbHMtcHl0aG9uIgogTElDRU5TRSA9ICJB
cGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZGM3ZjIx
Y2NmZjBmNjcyZjJhN2NkNmY0MTJhZTYyN2QiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjODM2
NTJjZDY1YjU3MjYwNThkY2JkYWFiODU4MzlkYmU0ODRjNDNlYTZmNjEwNDYxMzc1MTZhYTFiODQy
OGFlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFlYTRhYzljMmMzNzVlN2Y0MzliMWNlZjVmZjMy
ZWYzNDkxNGMwODNkZTBmNjFlMDhlZDY3Y2QzZDlkZWIyYTkiCiAKIEJCQ0xBU1NFWFRFTkQgPSAi
bmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi4zOS4yCgo=

--===============3373686584494931040==
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
DISTRO_VERSION       = "4.2+snapshot-64aecbf7235e3fd9a245d8d7877feea5a22deff7"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:64aecbf7235e3fd9a245d8d7877feea5a22deff7"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 109 Local 38 Mirrors 0 Missed 71 Current 615 (34% match, 90% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1337 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_recipe_qa)
NOTE: Running task 1338 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_recipe_qa)
NOTE: Running task 1339 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_recipe_qa)
NOTE: Running task 1448 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_recipe_qa)
NOTE: Running task 1507 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_recipe_qa)
NOTE: Running task 1508 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_recipe_qa)
NOTE: Running task 1509 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_recipe_qa)
NOTE: Running task 1511 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_recipe_qa)
NOTE: Running task 1512 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_recipe_qa)
NOTE: Running task 1614 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1617 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_fetch)
NOTE: Running task 1618 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_fetch)
NOTE: Running task 1619 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_fetch)
NOTE: Running task 1620 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_fetch)
NOTE: Running task 1621 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_fetch)
NOTE: Running task 1622 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_fetch)
NOTE: Running task 1623 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_fetch)
NOTE: Running task 1624 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_fetch)
NOTE: Running task 1625 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1686 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_recipe_qa)
NOTE: Running task 1688 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_recipe_qa)
NOTE: Running task 1875 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_collect_spdx_deps)
NOTE: Running task 1888 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_rpm)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1889 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_unpack)
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1890 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_unpack)
NOTE: Running task 1891 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_unpack)
NOTE: Running task 1892 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1893 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_unpack)
NOTE: Running task 1894 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_unpack)
NOTE: Running task 1895 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_unpack)
NOTE: Running task 1896 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1897 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1898 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_unpack)
NOTE: Running task 1900 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_unpack)
NOTE: Running task 1901 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: Running task 1902 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1903 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Started
NOTE: Running task 1905 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1906 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1907 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_fetch)
NOTE: Running task 1908 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_fetch)
NOTE: Running task 1909 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_patch)
NOTE: Running task 1910 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Started
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1911 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_create_spdx)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: Running task 1912 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_patch)
NOTE: Running task 1913 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1914 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_patch)
NOTE: Running task 1915 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_patch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1916 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_patch)
NOTE: Running task 1917 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1918 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1919 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_patch)
NOTE: Running task 1920 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-beartype-0.15.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Started
NOTE: Running task 1921 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1922 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_patch)
NOTE: Running task 1923 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Started
NOTE: Running task 1924 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_unpack)
NOTE: Running task 1925 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1926 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: Running task 1927 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_unpack)
NOTE: Running task 1928 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1929 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1933 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1936 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_patch)
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1937 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_patch)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Started
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Succeeded
NOTE: Running task 1938 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1939 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_lic)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1940 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_patch)
NOTE: Running task 1941 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1942 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1943 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1944 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1945 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1946 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1947 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1948 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1949 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1950 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1951 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_configure)
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1952 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1953 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1954 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure)
NOTE: Running task 1955 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure)
NOTE: recipe python3-beartype-0.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1956 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_configure)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1957 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_configure)
NOTE: Running task 1958 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_configure)
NOTE: Running task 1959 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1960 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_configure)
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_compile)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1962 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_configure)
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1963 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_configure)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1964 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure_ptest_base)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1965 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure_ptest_base)
NOTE: Running task 1966 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure_ptest_base)
NOTE: Running task 1967 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_compile)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1968 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_compile)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1969 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_compile)
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1970 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: Running task 1971 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_compile)
NOTE: Running task 1972 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1973 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: Running task 1974 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile)
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Started
NOTE: Running task 1975 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile)
NOTE: Running task 1976 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_compile)
NOTE: Running task 1977 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_compile)
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2572f28bd6d6ab3b8d5d65dea143291e7936867d7b6c5b21c4c3d1e3b7a8e7fe
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1982 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Succeeded
NOTE: Running task 1983 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1984 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile_ptest_base)
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Started
NOTE: Running task 1985 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile_ptest_base)
NOTE: Running task 1986 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_install)
NOTE: recipe python3-beartype-0.15.0-r0: task do_compile: Succeeded
NOTE: Running task 1987 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_install)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1988 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_install)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 1989 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_install)
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Started
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1990 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1991 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 1992 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Succeeded
NOTE: Running task 1993 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Started
NOTE: Running task 1994 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package)
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Succeeded
NOTE: Running task 1995 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_package)
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Succeeded
NOTE: Running task 1996 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-click-8.1.7-r0: task do_install: Succeeded
NOTE: Running task 1997 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install_ptest_base)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1998 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1999 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2000 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Succeeded
NOTE: Running task 2001 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package)
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_install: Succeeded
NOTE: Running task 2002 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Started
NOTE: Running task 2003 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_package)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_package: Started
NOTE: Running task 2004 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_package)
NOTE: Running task 2005 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_sysroot)
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 2006 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_packagedata)
NOTE: Running task 2007 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Succeeded
NOTE: Running task 2008 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Succeeded
NOTE: Running task 2009 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Succeeded
NOTE: Running task 2010 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_packagedata)
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2011 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_create_spdx)
NOTE: Running task 2012 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package)
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Started
NOTE: Running task 2013 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2014 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_create_spdx)
NOTE: Running task 2015 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Succeeded
NOTE: Running task 2016 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_packagedata)
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2017 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_create_spdx)
NOTE: recipe python3-click-8.1.7-r0: task do_package: Succeeded
NOTE: Running task 2018 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_rpm)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2019 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_packagedata)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Succeeded
NOTE: Running task 2020 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_packagedata)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2021 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_create_spdx)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Started
NOTE: Running task 2022 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_rpm)
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Succeeded
NOTE: Running task 2023 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_packagedata)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2024 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_create_spdx)
NOTE: Running task 2025 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2026 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_create_spdx)
NOTE: Running task 2027 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_package: Succeeded
NOTE: Running task 2028 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata)
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Succeeded
NOTE: Running task 2029 of 2041 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_packagedata)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-beartype-0.15.0-r0: task do_packagedata: Failed
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2029 tasks of which 1873 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-src went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dbg went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-staticdev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dev went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-doc went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype-locale went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: QA Issue: Package version for package python3-beartype went backwards which would break package feeds (from 0:0.16.3-r0 to 0:0.15.0-r0) [version-going-backwards]
ERROR: python3-beartype-0.15.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-beartype/0.15.0/temp/log.do_packagedata.2328397
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.15.0.bb:do_packagedata) failed with exit code '1'

--===============3373686584494931040==--

