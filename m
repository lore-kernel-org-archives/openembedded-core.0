Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF91BC3DA41
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.174033.1692224344600870144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XzmHpcGe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CewWfYxk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a006e4eb3-11772e64-c992-4f53-98c6-88007e7aad2f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yD/BpLCwyhdswAqmcTC+5/ENGUhE9YooT05IVGWcXSc=;
	b=XzmHpcGezSA9sqTotvjQ80BF6iyHN4/AZZbbWSCyrfEJ4upFf4Jx9GPZN8JFL5pI
	Noskuu832WtYzE3SnkIcj4Y5H3Jkur1Hcb4yXMrMLxB+wfJ5UlPPBRn1IW7ZgqL+kKf
	NqdcWPH9We7VD+GwrRZCoFB6DKxXpSJhuger/10Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yD/BpLCwyhdswAqmcTC+5/ENGUhE9YooT05IVGWcXSc=;
	b=CewWfYxkBG72nS7xXjm0xAOa36OVmZX4GpdebynZvZdNLX59RFcqUDyAq2PQ1b1n
	x9VFyZI27l4pJl6McRMEnCe0VAIToqfigYRiJX+qMfTKkRGl8ZDRFXA9UHfLZ8SquBY
	UL5hi46f2nokW7pyIIPH/8MKL4BARkgdFA0WgTSA=
Content-Type: multipart/mixed; boundary="===============8943902618785036903=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.7 SUCCEEDED
Message-ID: <0101018a006e4eb3-11772e64-c992-4f53-98c6-88007e7aad2f-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186182

--===============8943902618785036903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.6.1-2023.7.patch
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
From f50ed82f7d3803b6207dbba109dd27eb53c515f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 05:12:28 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.6.1 -> 2023.7

---
 ...{python3-dtschema_2023.6.1.bb => python3-dtschema_2023.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.6.1.bb => python3-dtschema_2023.7.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb b/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.7.bb
index 0c2c156ec4..c1dc3e019a 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
+SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.2


--===============8943902618785036903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-32 sysroot...done.
Removing 68 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:92cc2786d141de83a523887464d7057ff23709aa"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 407 Local 341 Mirrors 0 Missed 66 Current 373 (83% match, 91% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 374 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 443 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 444 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 449 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 470 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_recipe_qa)
NOTE: Running task 471 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_recipe_qa)
NOTE: Running task 472 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_recipe_qa)
NOTE: Running task 482 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa)
NOTE: Running task 490 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_recipe_qa)
NOTE: Running task 491 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_recipe_qa)
NOTE: Running task 492 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_recipe_qa)
NOTE: Running task 507 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_recipe_qa)
NOTE: Running task 508 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_recipe_qa)
NOTE: Running task 509 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_recipe_qa)
NOTE: Running task 510 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_recipe_qa)
NOTE: Running task 511 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_recipe_qa)
NOTE: Running task 512 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 457 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 459 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 460 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe dtc-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 535 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_fetch)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 478 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 479 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 536 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_fetch)
NOTE: Running task 537 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_fetch)
NOTE: Running task 538 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 539 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 540 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_fetch)
NOTE: Running task 541 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: Running task 542 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_fetch)
NOTE: Running task 543 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_fetch)
NOTE: Running task 544 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_fetch)
NOTE: Running task 545 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_fetch)
NOTE: Running task 546 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 549 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Started
NOTE: Running task 551 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_unpack)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 552 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: Running task 553 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_unpack)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 554 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_unpack)
NOTE: Running task 555 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 556 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_unpack)
NOTE: Running task 557 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Succeeded
NOTE: Running task 558 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 559 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_unpack)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 560 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_unpack)
NOTE: Running task 561 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_unpack)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 563 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 495 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Started
NOTE: Running task 568 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_unpack)
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Started
NOTE: Running setscene task 502 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 517 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 537 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 562 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 565 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1176 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_patch)
NOTE: Running task 1179 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_patch)
NOTE: Running task 1180 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_patch)
NOTE: Running task 1200 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 1201 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_patch)
NOTE: Running task 1202 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: Running task 1203 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_patch)
NOTE: Running task 1265 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1266 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_patch)
NOTE: Running task 1267 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_patch)
NOTE: Running task 1268 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_patch)
NOTE: Running task 1269 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1270 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 603 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Started
NOTE: Running setscene task 618 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 620 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1358 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1359 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1360 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1361 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1362 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1363 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1364 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1365 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1366 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1367 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1368 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1369 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1370 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Started
NOTE: Running setscene task 636 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 645 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 646 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1422 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 664 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 666 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic unihash changed to 53014ef8e8b4c5333e294ce491d383b9d3f27596ffaaed1a4794bdd4311c2cc0
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 679 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 775 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1941 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1942 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1949 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1984 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1992 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1993 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1994 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2037 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_collect_spdx_deps)
NOTE: Running task 2068 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2069 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2070 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2071 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2072 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2073 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2117 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2118 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2119 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2120 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2129 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: Running task 2130 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2131 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2132 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_configure)
NOTE: Running task 2133 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2134 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2135 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_configure)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2136 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2137 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: Running task 2138 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: Running task 2139 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2140 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: Running task 2141 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Started
NOTE: Running task 2142 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure_ptest_base)
NOTE: Running task 2143 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_configure)
NOTE: Running task 2144 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Started
NOTE: Running task 2145 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: Running task 2146 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2147 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile)
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Started
NOTE: Running task 2148 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: Running task 2149 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_compile)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Succeeded
NOTE: Running task 2150 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2151 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: Running task 2152 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: Running task 2153 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_compile)
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2154 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Started
NOTE: Running task 2155 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Started
NOTE: Running task 2156 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2157 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2158 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_install)
NOTE: Running task 2159 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: Running task 2160 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile_ptest_base)
NOTE: Running task 2161 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: Running task 2162 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: Running task 2163 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_install)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: Running task 2164 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_install)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2165 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install)
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: Running task 2166 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile_ptest_base)
NOTE: Running task 2167 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Started
NOTE: Running task 2168 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 2169 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Succeeded
NOTE: Running task 2170 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 2171 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install)
NOTE: Running task 2172 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: Running task 2174 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_install)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Succeeded
NOTE: Running task 2175 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_package)
NOTE: Running task 2176 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: Running task 2177 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2178 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2179 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_install)
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Started
NOTE: Running task 2180 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_install)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2181 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install_ptest_base)
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Succeeded
NOTE: Running task 2182 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2183 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Succeeded
NOTE: Running task 2184 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_package)
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Started
NOTE: Running task 2185 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Running task 2186 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Succeeded
NOTE: Running task 2187 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 2188 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2189 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx)
NOTE: Running task 2190 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: Running task 2191 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Succeeded
NOTE: Running task 2192 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2193 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Started
NOTE: Running task 2194 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2195 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_create_spdx)
NOTE: Running task 2196 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2197 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Succeeded
NOTE: Running task 2198 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata)
NOTE: Running task 2199 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Succeeded
NOTE: Running task 2200 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_packagedata)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Succeeded
NOTE: Running task 2201 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_install)
NOTE: Running task 2202 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2203 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2204 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2205 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_create_spdx)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Succeeded
NOTE: Running task 2206 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_package)
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Succeeded
NOTE: Running task 2207 of 2213 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2207 tasks of which 2044 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-dtc/1.6.1+gitAUTOINC+c001fc01a4/temp/log.do_packagedata.3504184
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============8943902618785036903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:92cc2786d141de83a523887464d7057ff23709aa"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 24 Mirrors 0 Missed 66 Current 681 (26% match, 91% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1522 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_recipe_qa)
NOTE: Running task 1533 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_recipe_qa)
NOTE: Running task 1534 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_recipe_qa)
NOTE: Running task 1589 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa)
NOTE: Running task 1641 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_recipe_qa)
NOTE: Running task 1642 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_recipe_qa)
NOTE: Running task 1643 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_recipe_qa)
NOTE: Running task 1809 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa)
NOTE: Running task 1810 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_recipe_qa)
NOTE: Running task 1811 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_recipe_qa)
NOTE: Running task 1812 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_recipe_qa)
NOTE: Running task 1813 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_recipe_qa)
NOTE: Running task 1814 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_recipe_qa)
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2040 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_fetch)
NOTE: Running task 2041 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_fetch)
NOTE: Running task 2042 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2043 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_fetch)
NOTE: Running task 2044 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_fetch)
NOTE: Running task 2045 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2046 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: Running task 2047 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2048 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2049 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_fetch)
NOTE: Running task 2050 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_fetch)
NOTE: Running task 2051 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_fetch)
NOTE: Running task 2052 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_fetch)
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Started
NOTE: Running task 2053 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_unpack)
NOTE: Running task 2054 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 2055 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_unpack)
NOTE: Running task 2056 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: Running task 2057 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 2058 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Started
NOTE: Running task 2059 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_unpack)
NOTE: Running task 2060 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2061 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_unpack)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: Running task 2062 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 2063 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Succeeded
NOTE: Running task 2064 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_unpack)
NOTE: Running task 2065 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2066 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_patch)
NOTE: Running task 2067 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_patch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: Running task 2068 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 2069 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2070 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: Running task 2071 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_patch)
NOTE: Running task 2072 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_unpack)
NOTE: Running task 2073 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 2074 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_unpack)
NOTE: Running task 2075 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_unpack)
NOTE: Running task 2076 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_patch)
NOTE: Running task 2077 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_unpack)
NOTE: Running task 2078 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 2079 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Started
NOTE: Running task 2080 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: Running task 2081 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2082 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Started
NOTE: Running task 2083 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Started
NOTE: Running task 2084 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Started
NOTE: Running task 2085 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Started
NOTE: Running task 2086 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 2087 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_patch)
NOTE: Running task 2088 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 2089 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_patch)
NOTE: Running task 2090 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_patch)
NOTE: Running task 2091 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2092 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_patch)
NOTE: Running task 2093 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_patch)
NOTE: Running task 2094 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2095 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_patch)
NOTE: Running task 2097 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Succeeded
NOTE: Running task 2098 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2099 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2100 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2101 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 2102 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2103 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: Running task 2104 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 2105 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2106 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2107 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic unihash changed to 53014ef8e8b4c5333e294ce491d383b9d3f27596ffaaed1a4794bdd4311c2cc0
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Succeeded
NOTE: Running task 2108 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2109 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2110 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2111 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2112 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2113 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure)
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2114 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2115 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Started
NOTE: Running task 2116 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2117 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_configure)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: Running task 2118 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: Running task 2119 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2120 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_configure)
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Started
NOTE: Running task 2121 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_configure)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_compile)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Started
NOTE: Running task 2123 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2124 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: Running task 2125 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_compile)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Started
NOTE: Running task 2126 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure_ptest_base)
NOTE: Running task 2127 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_configure)
NOTE: Running task 2128 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Started
NOTE: Running task 2129 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure_ptest_base)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Started
NOTE: Running task 2130 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Started
NOTE: Running task 2131 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: Running task 2132 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_compile)
NOTE: Running task 2133 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2134 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Succeeded
NOTE: Running task 2135 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_compile)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Started
NOTE: Running task 2136 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: Running task 2137 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Started
NOTE: Running task 2138 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2139 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_install)
NOTE: Running task 2142 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_install)
NOTE: Running task 2143 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile_ptest_base)
NOTE: Running task 2144 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_install)
NOTE: Running task 2145 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: Running task 2146 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2147 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2148 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile_ptest_base)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: Running task 2149 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2150 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install)
NOTE: Running task 2151 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package)
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Succeeded
NOTE: Running task 2152 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_package)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: Running task 2153 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Started
NOTE: Running task 2155 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package)
NOTE: Running task 2156 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Started
NOTE: Running task 2157 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Succeeded
NOTE: Running task 2158 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_install)
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Started
NOTE: Running task 2159 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: Running task 2160 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_install)
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Started
NOTE: Running task 2161 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_install)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Started
NOTE: Running task 2162 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Succeeded
NOTE: Running task 2163 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install_ptest_base)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Succeeded
NOTE: Running task 2164 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Succeeded
NOTE: Running task 2165 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_package)
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Succeeded
NOTE: Running task 2166 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package)
NOTE: Running task 2167 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_package)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Succeeded
NOTE: Running task 2168 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Running task 2169 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2171 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx)
NOTE: Running task 2172 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: Running task 2173 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_packagedata)
NOTE: Running task 2174 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata)
NOTE: Running task 2175 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: Running task 2176 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2177 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_create_spdx)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2178 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package_write_rpm)
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Succeeded
NOTE: Running task 2179 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Started
NOTE: Running task 2180 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2181 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Started
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx)
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Succeeded
NOTE: Running task 2183 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Started
NOTE: Running task 2184 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_packagedata)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Succeeded
NOTE: Running task 2185 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2186 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2187 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_create_spdx)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_package)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Succeeded
NOTE: Running task 2189 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2189 tasks of which 2026 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-dtc/1.6.1+gitAUTOINC+c001fc01a4/temp/log.do_packagedata.3373031
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============8943902618785036903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.6.1.tar.gz;downloadfilename=dtschema-2023.6.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.7.tar.gz;downloadfilename=dtschema-2023.7.tar.gz"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2023.6.1" to "2023.7"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2023.6.1 [default] to 2023.7 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 299334 to 299328 (-0%)
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/WHEEL was removed

--===============8943902618785036903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:92cc2786d141de83a523887464d7057ff23709aa"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 24 Mirrors 0 Missed 66 Current 681 (26% match, 91% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1522 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_recipe_qa)
NOTE: Running task 1533 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_recipe_qa)
NOTE: Running task 1534 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_recipe_qa)
NOTE: Running task 1589 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa)
NOTE: Running task 1641 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_recipe_qa)
NOTE: Running task 1642 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_recipe_qa)
NOTE: Running task 1643 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_recipe_qa)
NOTE: Running task 1809 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa)
NOTE: Running task 1810 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_recipe_qa)
NOTE: Running task 1811 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_recipe_qa)
NOTE: Running task 1812 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_recipe_qa)
NOTE: Running task 1813 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_recipe_qa)
NOTE: Running task 1814 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_recipe_qa)
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2040 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_fetch)
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2041 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2042 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_fetch)
NOTE: Running task 2043 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_fetch)
NOTE: Running task 2044 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2045 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_fetch)
NOTE: Running task 2046 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2047 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_fetch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2048 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2049 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2050 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_fetch)
NOTE: Running task 2051 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_fetch)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2052 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_fetch)
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: Running task 2053 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_unpack)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Started
NOTE: Running task 2054 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2055 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_unpack)
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Started
NOTE: Running task 2056 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 2057 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 2058 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Started
NOTE: Running task 2059 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_unpack)
NOTE: Running task 2060 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_unpack)
NOTE: Running task 2061 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 2062 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2063 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_unpack)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: Running task 2064 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2065 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_patch)
NOTE: Running task 2066 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 2067 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_patch)
NOTE: Running task 2068 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_patch)
NOTE: Running task 2069 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: Running task 2070 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 2071 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_patch)
NOTE: Running task 2072 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2073 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: Running task 2074 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_unpack)
NOTE: Running task 2075 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_unpack)
NOTE: Running task 2076 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 2077 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_unpack)
NOTE: Running task 2078 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_unpack)
NOTE: Running task 2079 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_collect_spdx_deps)
NOTE: Running task 2080 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2081 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Started
NOTE: Running task 2082 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: Running task 2083 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Started
NOTE: Running task 2084 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2085 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Started
NOTE: Running task 2086 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_collect_spdx_deps)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2087 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Started
NOTE: Running task 2088 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2089 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_patch)
NOTE: Running task 2090 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_patch)
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2091 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_patch)
NOTE: Running task 2092 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 2093 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_patch)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 2095 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2096 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_patch)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2098 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2099 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2100 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2101 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic)
NOTE: Running task 2102 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_patch)
NOTE: Running task 2103 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2104 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2105 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_configure)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2106 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Started
NOTE: Running task 2107 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2108 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2109 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Succeeded
NOTE: Running task 2110 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2111 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic unihash changed to 53014ef8e8b4c5333e294ce491d383b9d3f27596ffaaed1a4794bdd4311c2cc0
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Succeeded
NOTE: Running task 2112 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Succeeded
NOTE: Running task 2113 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Succeeded
NOTE: Running task 2114 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2115 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure_ptest_base)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2116 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_compile)
NOTE: Running task 2117 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure)
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2118 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_configure)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Started
NOTE: Running task 2119 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Started
NOTE: Running task 2120 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2121 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_configure)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2123 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile)
NOTE: Running task 2124 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2125 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_configure)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2126 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: Running task 2127 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2128 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Started
NOTE: Running task 2129 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure_ptest_base)
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: Running task 2130 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2131 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_compile)
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 2132 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_compile)
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Started
NOTE: Running task 2133 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2134 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Succeeded
NOTE: Running task 2135 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Started
NOTE: Running task 2136 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_compile)
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2137 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_compile)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Succeeded
NOTE: Running task 2138 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Succeeded
NOTE: Running task 2139 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: Running task 2141 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: Running task 2142 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile_ptest_base)
NOTE: Running task 2143 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_install)
NOTE: Running task 2144 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: Running task 2145 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_install)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2147 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install)
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Succeeded
NOTE: Running task 2148 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: Running task 2149 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2150 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 2151 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: Running task 2152 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package)
NOTE: Running task 2153 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Started
NOTE: Running task 2154 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2155 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install)
NOTE: Running task 2156 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_package)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Started
NOTE: Running task 2157 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_sysroot)
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: Running task 2158 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install_ptest_base)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Succeeded
NOTE: Running task 2159 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_install)
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2160 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_install)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2161 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package)
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2162 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_install)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Succeeded
NOTE: Running task 2163 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install_ptest_base)
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Succeeded
NOTE: Running task 2164 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Succeeded
NOTE: Running task 2165 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package)
NOTE: Running task 2166 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_package)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Started
NOTE: Running task 2167 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Running task 2168 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata)
NOTE: Running task 2169 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2171 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx)
NOTE: Running task 2172 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Started
NOTE: Running task 2173 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2174 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: Running task 2175 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Succeeded
NOTE: Running task 2176 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2177 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_create_spdx)
NOTE: Running task 2178 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2179 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Succeeded
NOTE: Running task 2180 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata)
NOTE: Running task 2181 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Succeeded
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Succeeded
NOTE: Running task 2183 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_packagedata)
NOTE: Running task 2184 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2185 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_install)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2186 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2187 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_create_spdx)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_package)
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Succeeded
NOTE: Running task 2189 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2189 tasks of which 2026 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-dtc/1.6.1+gitAUTOINC+c001fc01a4/temp/log.do_packagedata.3236950
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============8943902618785036903==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.6.1-2023.7.patch"

RnJvbSBmNTBlZDgyZjdkMzgwM2I2MjA3ZGJiYTEwOWRkMjdlYjUzYzUxNWY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDU6MTI6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjMuNi4xIC0+IDIwMjMuNwoKLS0tCiAuLi57cHl0
aG9uMy1kdHNjaGVtYV8yMDIzLjYuMS5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjMuNy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjMu
Ni4xLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJifSAoODUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjYuMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcu
YmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiCmluZGV4IDBjMmMx
NTZlYzQuLmMxZGMzZTAxOWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiCkBAIC03LDcgKzcsNyBAQCBpbmhl
cml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZDlkYzExY2VhNmE0NmFlMmVlNWFjNGE1YTFjN2RhN2NiMzcwNDQx
N2NiMzkwODgxODIwNDYwZjdjNjFlYjc4NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkZTdjZDcz
YTM1MjQ0Y2Y3NmE4Y2RkOTkxOWJiZWIzMWYzNjJhYTU3NDRmM2M3NmM4MGUwZTYxMjQ4OWRkMGMw
IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJERVBFTkRT
OiR7UE59ICs9ICJcCi0tIAoyLjM5LjIKCg==

--===============8943902618785036903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:92cc2786d141de83a523887464d7057ff23709aa"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 24 Mirrors 0 Missed 66 Current 681 (26% match, 91% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1522 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_recipe_qa)
NOTE: Running task 1533 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_recipe_qa)
NOTE: Running task 1534 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_recipe_qa)
NOTE: Running task 1589 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa)
NOTE: Running task 1641 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_recipe_qa)
NOTE: Running task 1642 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_recipe_qa)
NOTE: Running task 1643 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_recipe_qa)
NOTE: Running task 1809 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_recipe_qa)
NOTE: Running task 1810 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_recipe_qa)
NOTE: Running task 1811 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa)
NOTE: Running task 1812 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_recipe_qa)
NOTE: Running task 1813 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_recipe_qa)
NOTE: Running task 1814 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_recipe_qa)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2040 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_fetch)
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2041 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_fetch)
NOTE: Running task 2042 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_fetch)
NOTE: Running task 2043 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_fetch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2044 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2045 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: Running task 2046 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_fetch)
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2047 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2048 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_fetch)
NOTE: Running task 2049 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_fetch)
NOTE: Running task 2050 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_fetch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2051 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_fetch)
NOTE: Running task 2052 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2053 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_unpack)
NOTE: Running task 2054 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 2055 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_unpack)
NOTE: Running task 2056 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_unpack)
NOTE: Running task 2057 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_unpack)
NOTE: Running task 2058 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Started
NOTE: Running task 2059 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 2060 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 2061 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_unpack)
NOTE: Running task 2062 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2063 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_patch)
NOTE: Running task 2064 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2065 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2066 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2067 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2068 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_unpack)
NOTE: Running task 2069 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_unpack)
NOTE: Running task 2070 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: Running task 2071 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_unpack)
NOTE: Running task 2072 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_unpack)
NOTE: Running task 2073 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 2074 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2075 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Started
NOTE: Running task 2076 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2077 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2078 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Succeeded
NOTE: Running task 2079 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 2080 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 2081 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: Running task 2082 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_patch)
NOTE: Running task 2083 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_patch)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: Running task 2084 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_patch)
NOTE: Running task 2085 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2086 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_collect_spdx_deps)
NOTE: Running task 2087 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Succeeded
NOTE: Running task 2088 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_patch)
NOTE: Running task 2089 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_patch)
NOTE: Running task 2090 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_patch)
NOTE: Running task 2091 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_patch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2092 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_patch)
NOTE: Running task 2093 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 2094 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2095 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Succeeded
NOTE: Running task 2096 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_patch)
NOTE: Running task 2097 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Succeeded
NOTE: Running task 2098 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2099 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Started
NOTE: Running task 2100 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Succeeded
NOTE: Running task 2102 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2103 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic)
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2104 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Started
NOTE: Running task 2105 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2106 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2107 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 2108 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2109 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2110 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2111 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2112 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2113 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic unihash changed to 53014ef8e8b4c5333e294ce491d383b9d3f27596ffaaed1a4794bdd4311c2cc0
NOTE: Running task 2114 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2115 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_configure)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2116 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_configure)
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2117 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_configure)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2118 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2119 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: Running task 2120 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_configure)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2121 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile)
NOTE: Running task 2122 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Started
NOTE: Running task 2123 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_configure)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Started
NOTE: Running task 2124 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 2125 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_configure)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2126 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure_ptest_base)
NOTE: Running task 2127 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2128 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Succeeded
NOTE: Running task 2129 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_compile)
NOTE: Running task 2130 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_compile)
NOTE: Running task 2131 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_compile)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: Running task 2132 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_compile)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: Running task 2133 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2134 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Started
NOTE: Running task 2135 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Started
NOTE: Running task 2136 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_compile)
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Started
NOTE: Running task 2137 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Started
NOTE: Running task 2138 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Succeeded
NOTE: Running task 2139 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile_ptest_base)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2141 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_install)
NOTE: Running task 2142 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: Running task 2143 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install)
NOTE: Running task 2144 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_install)
NOTE: Running task 2145 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: Running task 2146 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Succeeded
NOTE: Running task 2147 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_install)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2148 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile_ptest_base)
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Succeeded
NOTE: Running task 2149 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: Running task 2150 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_install)
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Succeeded
NOTE: Running task 2151 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Succeeded
NOTE: Running task 2152 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install_ptest_base)
NOTE: Running task 2153 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Started
NOTE: Running task 2155 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: Running task 2156 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Started
NOTE: Running task 2157 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Succeeded
NOTE: Running task 2158 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_install)
NOTE: Running task 2159 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_package)
NOTE: Running task 2160 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Started
NOTE: Running task 2161 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2162 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_install)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Succeeded
NOTE: Running task 2163 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install_ptest_base)
NOTE: Running task 2164 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Succeeded
NOTE: Running task 2165 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2166 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Started
NOTE: Running task 2167 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Succeeded
NOTE: Running task 2168 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: Running task 2169 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Succeeded
NOTE: Running task 2171 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: Running task 2172 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2173 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Started
NOTE: Running task 2174 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Started
NOTE: Running task 2175 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Started
NOTE: Running task 2176 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2177 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_create_spdx)
NOTE: Running task 2178 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_packagedata)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2179 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package_write_rpm)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Started
NOTE: Running task 2180 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx)
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Started
NOTE: Running task 2181 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Succeeded
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_install)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Succeeded
NOTE: Running task 2183 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_packagedata)
NOTE: Running task 2184 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Succeeded
NOTE: Running task 2185 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2186 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Succeeded
NOTE: Running task 2187 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_package)
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2188 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_create_spdx)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Succeeded
NOTE: Running task 2189 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2189 tasks of which 2026 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-dtc/1.6.1+gitAUTOINC+c001fc01a4/temp/log.do_packagedata.3080324
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============8943902618785036903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1807 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:92cc2786d141de83a523887464d7057ff23709aa"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 22 Mirrors 0 Missed 66 Current 683 (25% match, 91% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1522 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_recipe_qa)
NOTE: Running task 1533 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_recipe_qa)
NOTE: Running task 1534 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_recipe_qa)
NOTE: Running task 1589 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_recipe_qa)
NOTE: Running task 1641 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_recipe_qa)
NOTE: Running task 1642 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_recipe_qa)
NOTE: Running task 1643 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_recipe_qa)
NOTE: Running task 1809 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_recipe_qa)
NOTE: Running task 1810 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_recipe_qa)
NOTE: Running task 1811 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_recipe_qa)
NOTE: Running task 1812 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_recipe_qa)
NOTE: Running task 1813 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_recipe_qa)
NOTE: Running task 1814 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_recipe_qa)
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2040 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_fetch)
NOTE: Running task 2041 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_fetch)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2042 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_fetch)
NOTE: Running task 2043 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 2044 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_fetch)
NOTE: Running task 2045 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2046 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: recipe python3-idna-3.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2047 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-zipp-3.16.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2048 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_fetch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2049 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_fetch)
NOTE: Running task 2050 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_fetch)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2051 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: Running task 2052 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_fetch)
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 2053 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_unpack)
NOTE: Running task 2054 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_unpack)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Started
NOTE: Running task 2055 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: Running task 2056 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_unpack)
NOTE: Running task 2057 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 2058 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 2059 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_unpack)
NOTE: Running task 2060 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: Running task 2061 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 2062 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Started
NOTE: Running task 2063 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2064 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_fetch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 2065 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_unpack)
NOTE: Running task 2066 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_unpack)
NOTE: Running task 2067 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: Running task 2068 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 2069 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Started
NOTE: Running task 2070 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_unpack)
NOTE: Running task 2071 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2072 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: Running task 2073 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_unpack)
NOTE: Running task 2074 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_unpack)
NOTE: Running task 2075 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2076 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2077 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtschema-2023.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2078 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Started
NOTE: Running task 2079 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_patch)
NOTE: Running task 2080 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2081 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_patch)
NOTE: Running task 2082 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_patch)
NOTE: Running task 2083 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_collect_spdx_deps)
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2084 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 2085 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2086 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_patch)
NOTE: Running task 2087 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 2088 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2089 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_patch)
NOTE: Running task 2090 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_patch)
NOTE: Running task 2091 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 2092 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_patch)
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2093 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_patch)
NOTE: Running task 2094 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_patch)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_patch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_patch: Succeeded
NOTE: Running task 2095 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2096 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2097 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 2098 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2099 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2100 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_unpack: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_patch: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_patch: Succeeded
NOTE: Running task 2102 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2103 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2104 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_patch)
NOTE: Running task 2105 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_patch: Succeeded
NOTE: Running task 2106 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2107 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2108 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2109 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_lic unihash changed to 53014ef8e8b4c5333e294ce491d383b9d3f27596ffaaed1a4794bdd4311c2cc0
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2110 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2111 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_configure)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2112 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_patch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2113 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure)
NOTE: Running task 2114 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure)
NOTE: Running task 2115 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2116 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Started
NOTE: Running task 2117 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Started
NOTE: Running task 2118 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_configure)
NOTE: recipe python3-zipp-3.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2119 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: Running task 2120 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Started
NOTE: Running task 2121 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Started
NOTE: Running task 2122 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_configure: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_configure: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Started
NOTE: Running task 2123 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_compile)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 2124 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Started
NOTE: Running task 2125 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: Running task 2126 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2127 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_configure_ptest_base)
NOTE: Running task 2128 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Started
NOTE: Running task 2129 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: Running task 2130 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_compile)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_configure: Succeeded
NOTE: Running task 2131 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: Running task 2132 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_configure: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Started
NOTE: Running task 2133 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2134 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Started
NOTE: Running task 2135 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2136 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile)
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: Running task 2137 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_configure: Succeeded
NOTE: Running task 2138 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_compile)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_compile: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 2139 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_install)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_compile: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: Running task 2141 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: Running task 2142 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_compile_ptest_base)
NOTE: Running task 2143 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_install)
NOTE: Running task 2144 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_install)
NOTE: Running task 2145 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-dtschema-2023.7-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_install)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Started
NOTE: Running task 2147 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install)
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2148 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile_ptest_base)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_compile: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2149 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_install)
NOTE: Running task 2150 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: Running task 2151 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_install: Succeeded
NOTE: Running task 2152 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package)
NOTE: recipe python3-attrs-23.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_install: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Started
NOTE: Running task 2153 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_package)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_install: Succeeded
NOTE: Running task 2155 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_populate_sysroot)
NOTE: Running task 2156 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: Running task 2157 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Started
NOTE: Running task 2158 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2159 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Started
NOTE: Running task 2160 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_install)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Started
NOTE: Running task 2161 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_install)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Started
NOTE: Running task 2162 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_install: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_install: Succeeded
NOTE: Running task 2163 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_install_ptest_base)
NOTE: recipe python3-dtschema-2023.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2164 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_install: Succeeded
NOTE: Running task 2165 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_package)
NOTE: recipe python3-webcolors-1.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2166 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package)
NOTE: recipe python3-zipp-3.16.2-r0: task do_install: Succeeded
NOTE: Running task 2167 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_package)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Started
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Running task 2168 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata)
NOTE: Running task 2169 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2171 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata)
NOTE: Running task 2172 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx)
NOTE: Running task 2173 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Started
NOTE: Running task 2174 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_compile: Succeeded
NOTE: Running task 2175 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: Running task 2176 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_install)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: Running task 2177 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_package: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_packagedata: Succeeded
NOTE: Running task 2178 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.16.2.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_package: Succeeded
NOTE: Running task 2179 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_create_spdx)
NOTE: Running task 2180 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.32.bb:do_package_write_rpm)
NOTE: Running task 2181 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.13-r0: task do_package: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx)
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Started
NOTE: Running task 2183 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata)
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Started
NOTE: Running task 2184 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_install: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_package: Succeeded
NOTE: recipe python3-zipp-3.16.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2185 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_package)
NOTE: Running task 2186 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2187 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2188 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.7.bb:do_create_spdx)
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Started
NOTE: recipe python3-dtschema-2023.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_package: Succeeded
NOTE: Running task 2189 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata)
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Started
NOTE: recipe python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2189 tasks of which 2026 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: QA Issue: Package version for package python3-dtc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.1+git0+c001fc01a4-r0) [version-going-backwards]
ERROR: python3-dtc-1.6.1+gitAUTOINC+c001fc01a4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-dtc/1.6.1+gitAUTOINC+c001fc01a4/temp/log.do_packagedata.2916151
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtc_1.6.1.bb:do_packagedata) failed with exit code '1'

--===============8943902618785036903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/LICENSE.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/METADATA was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/RECORD was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/dtschema-2023.7.dist-info/WHEEL was added
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/METADATA was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/RECORD was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/top_level.txt was removed
  /usr/lib/python3.11/site-packages/dtschema-2023.6.1.dist-info/WHEEL was removed

--===============8943902618785036903==--

