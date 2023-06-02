Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4A6CA9EC5
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.7536.1685693433804740635
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fM1+uHLH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101887b288474-43584a10-3225-4897-8e2e-46a321a511d3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=coyeUq4w50VByJZXQeeQaYsa21bvqr/7Q6G0g3XWtBk=;
	b=fM1+uHLHu3jQs9oSy2MxwmhesRQHP/H3EE4W5/mMLEQWpllkM5vQzcLRSBWk91fB
	CsKwNtHhs9AGDNP36j+eJE/oT5JSo31luuzujhTHTDHrRoDaeH/v0DLV1ORcy1qp0jO
	wsAYZqPBKmUE+RqUugJKMjfPDzwG1MVF9UVxrz3c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=coyeUq4w50VByJZXQeeQaYsa21bvqr/7Q6G0g3XWtBk=;
	b=IDxRTovB//ipIhBfjv3LvZMj8i2CyPYtyv5V47sA8ZxzwU1yKPptV5GhUF0Xxh/C
	gddb38/YN0HM5SG3bnbBkegTbEg1UEtTM1v0fAgNyx7ACLRN4XYIRc7buHri7PpiQvj
	2SKv3PwPNmf6RbqFS3J9qgqpohPeVx6X60gFfYx0=
Content-Type: multipart/mixed; boundary="===============0903987088697289916=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.6.0 SUCCEEDED
Message-ID: <010101887b288474-43584a10-3225-4897-8e2e-46a321a511d3-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182209

--===============0903987088697289916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-rust* to *1.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.5.2-1.6.0.patch
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
--===============0903987088697289916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0f93e70065f3562f7f7e731a55e5cbaab0ed98f6"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 8 Mirrors 0 Missed 32 Current 345 (20% match, 91% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_fetch)
NOTE: Running task 1129 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1130 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_unpack)
NOTE: Running task 1134 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_fetch)
NOTE: Running task 1135 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_fetch)
NOTE: Running task 1136 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1137 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1220 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1223 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_fetch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: Running task 1379 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_unpack)
NOTE: Running task 1380 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Started
NOTE: Running task 1381 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_unpack)
NOTE: Running task 1382 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1383 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: Running task 1384 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1385 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1388 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_unpack)
NOTE: Running task 1389 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1390 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_patch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1393 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_patch)
NOTE: Running task 1394 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: Running task 1395 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_gen_targets)
NOTE: Running task 1400 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Succeeded
NOTE: Running task 1401 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Started
NOTE: Running task 1402 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic unihash changed to 3f80c3d30b96faf02672effa85fb7fb41d57f750dba649b99de81397a3ad8e9b
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1404 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1405 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1406 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1407 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1408 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1409 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1410 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_configure)
NOTE: Running task 1411 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Started
NOTE: Running task 1412 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1413 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: Running task 1414 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_configure)
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_compile)
NOTE: Running task 1417 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1419 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: Running task 1420 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1421 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1422 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1423 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1425 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1426 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: Running task 1427 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1428 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 1429 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1430 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1431 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_configure)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1432 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_compile)
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_install)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1435 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1436 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_packagedata)
NOTE: Running task 1438 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Started
NOTE: Running task 1439 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1440 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: Running task 1441 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1442 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1443 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_install)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Succeeded
NOTE: Running task 1445 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_install: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Started
NOTE: Running task 1447 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package)
NOTE: Running task 1448 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1450 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package_write_rpm)
NOTE: Running task 1451 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package_qa)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Succeeded
NOTE: Running task 1452 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata)
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1452 tasks of which 1369 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pip/23.0.1-r0/temp/log.do_packagedata.2779172
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata) failed with exit code '1'

--===============0903987088697289916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0f93e70065f3562f7f7e731a55e5cbaab0ed98f6"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 8 Mirrors 0 Missed 32 Current 345 (20% match, 91% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_fetch)
NOTE: Running task 1129 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1130 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_unpack)
NOTE: Running task 1134 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_fetch)
NOTE: Running task 1135 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1136 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_fetch)
NOTE: Running task 1137 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1220 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_fetch)
NOTE: Running task 1221 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1379 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_unpack)
NOTE: Running task 1380 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_unpack)
NOTE: Running task 1381 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Started
NOTE: Running task 1382 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: Running task 1383 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1384 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1385 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_unpack)
NOTE: Running task 1388 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1389 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1390 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_patch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: Running task 1392 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_patch)
NOTE: Running task 1393 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1394 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1395 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: Running task 1397 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_gen_targets)
NOTE: Running task 1400 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic)
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Succeeded
NOTE: Running task 1401 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_populate_sysroot)
NOTE: Running task 1402 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic unihash changed to 3f80c3d30b96faf02672effa85fb7fb41d57f750dba649b99de81397a3ad8e9b
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1404 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1405 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1406 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1407 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1408 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1409 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1410 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: Running task 1411 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1413 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_configure)
NOTE: Running task 1414 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_configure)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: Running task 1417 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 1419 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_compile)
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1420 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_compile)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1421 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1422 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1423 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1425 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1426 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1427 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 1428 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1429 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: Running task 1430 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1431 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_configure)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_compile)
NOTE: Running task 1433 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_install)
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Succeeded
NOTE: Running task 1435 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1436 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: Running task 1437 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1438 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_package)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1440 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1441 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1442 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1443 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package_write_rpm)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1445 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_packagedata)
NOTE: Running task 1446 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package)
NOTE: Running task 1447 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1448 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_package)
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1450 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package_write_rpm)
NOTE: Running task 1451 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package_qa)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Succeeded
NOTE: Running task 1452 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata)
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1452 tasks of which 1369 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pip/23.0.1-r0/temp/log.do_packagedata.2866076
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata) failed with exit code '1'

--===============0903987088697289916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_rust-1.5.2.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_rust-1.6.0.dist-info

--===============0903987088697289916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 31 recipes from the core2-32 sysroot...done.
Removing 47 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0f93e70065f3562f7f7e731a55e5cbaab0ed98f6"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 216 Local 178 Mirrors 0 Missed 38 Current 183 (82% match, 90% complete)
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 184 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 224 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 227 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 234 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 242 of 399 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyparsing-3.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 757 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_fetch)
NOTE: Running task 779 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_fetch)
NOTE: Running task 780 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_fetch)
NOTE: Running task 781 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 782 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 803 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_fetch)
NOTE: Running task 804 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 836 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running setscene task 243 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata_setscene)
NOTE: Running task 838 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_fetch)
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 852 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 246 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: Running task 865 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 866 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 867 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_unpack)
NOTE: Running task 868 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_unpack)
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 869 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 870 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: Running task 876 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_unpack)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 877 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 252 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 254 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 878 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe libstd-rs-1.69.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Started
NOTE: Running task 879 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_unpack)
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: Running task 880 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_patch)
NOTE: Running task 881 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 882 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: Running task 883 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_patch)
NOTE: Running setscene task 257 of 399 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: Running task 891 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: Running task 895 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 262 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 900 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_patch)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: Running task 901 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 265 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 907 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 909 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 910 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 914 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 916 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 917 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 279 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running task 936 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 937 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_gen_targets)
NOTE: Running task 938 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic unihash changed to 3f80c3d30b96faf02672effa85fb7fb41d57f750dba649b99de81397a3ad8e9b
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 327 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 399 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1277 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1357 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1358 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1359 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1388 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1433 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1434 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1435 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_configure)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1436 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1437 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Started
NOTE: Running task 1438 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1439 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1440 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_compile)
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1441 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_compile)
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1442 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_compile)
NOTE: Running task 1443 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1445 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1447 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: Running task 1448 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: Running task 1449 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1450 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: Running task 1451 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Succeeded
NOTE: Running task 1452 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: Running task 1453 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1454 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1455 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_install)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Succeeded
NOTE: Running task 1456 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Started
NOTE: Running task 1457 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: Running task 1458 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: Running task 1459 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1460 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1461 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_packagedata)
NOTE: Running task 1462 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1463 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package_write_rpm)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Succeeded
NOTE: Running task 1464 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_package)
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_unpack: Succeeded
NOTE: Running task 1466 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_patch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Succeeded
NOTE: Running task 1468 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_compile)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_install)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_install: Succeeded
NOTE: Running task 1471 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot)
NOTE: Running task 1472 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1473 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata)
NOTE: Running task 1474 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1475 of 1501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_configure)
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Failed
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1475 tasks of which 1388 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pip/23.0.1-r0/temp/log.do_packagedata.3018837
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata) failed with exit code '1'

--===============0903987088697289916==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.5.2-1.6.0.patch"

RnJvbSAzMGFlNjYwODJiYTQ0OGY2Zjk1ZGRkY2I0MmFjZDQ2YTk5NjljYTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjo0Mzo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuNS4yIC0+IDEuNi4wCgotLS0KIC4uLmV0
dXB0b29scy1ydXN0XzEuNS4yLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuNi4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuNS4yLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuNi4wLmJifSAoOTIlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRv
b2xzLXJ1c3RfMS41LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy1ydXN0XzEuNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS41
LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXJ1c3RfMS42LjAuYmIKaW5kZXggMDFlMjljYzZkOC4uZjFkYTRiNTBlNyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtcnVz
dF8xLjUuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuNi4wLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTAxMWNkOTJlNzAyZGQ5ZTZiMWEyNjE1N2I2ZmQ1M2Y1Igog
U1JDX1VSSSA9ICIke1BZUElfU1JDX1VSSX0gXAogICAgICAgICAgICBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjcvMDgvZTFhYTJjNTgyYzYyYWM3NmU0ZDYwZjhlNDU0
YmQzYmJhOTMzNzgxYTA2YTg4YjRlMzg3OTc0NDU4MjJhL3NldHVwdG9vbHMtcnVzdC0ke1BWfS50
YXIuZ3ogXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDhkYWNjYjE0ZGMw
ZWFlMWI2YjZlYjNlY2VmNzk2NzViZDM3YjQwNjUzNjlmNzljMzUzOTNkZDVjNTU2NTJjNyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJjODZlNzM0ZGVhYzMzMDU5Nzk5OGJmYmMwOGRhNDUxODdlNmIy
NzgzN2UyM2JkOTFlYWRiMzIwNzMyMzkyMjYyIgogCiBpbmhlcml0IGNhcmdvIHB5cGkgcHl0aG9u
X3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjM5LjIKCg==

--===============0903987088697289916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0f93e70065f3562f7f7e731a55e5cbaab0ed98f6"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 8 Mirrors 0 Missed 32 Current 345 (20% match, 91% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_fetch)
NOTE: Running task 1129 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1130 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_unpack)
NOTE: Running task 1134 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1135 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1136 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_fetch)
NOTE: Running task 1137 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_fetch)
NOTE: Running task 1220 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1223 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_fetch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1379 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1380 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_unpack)
NOTE: Running task 1381 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1382 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: Running task 1383 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_unpack)
NOTE: Running task 1384 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Started
NOTE: Running task 1385 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1387 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1388 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1389 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_unpack)
NOTE: Running task 1390 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Started
NOTE: Running task 1391 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_patch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1392 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 1393 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_patch)
NOTE: Running task 1394 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1395 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Started
NOTE: Running task 1396 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: Running task 1397 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_patch)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_gen_targets)
NOTE: Running task 1400 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic)
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Started
NOTE: Running task 1401 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_populate_sysroot)
NOTE: Running task 1402 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1404 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic unihash changed to 3f80c3d30b96faf02672effa85fb7fb41d57f750dba649b99de81397a3ad8e9b
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1405 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1407 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1408 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1409 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1410 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1411 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1413 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1414 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: Running task 1416 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_compile)
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1417 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: Running task 1418 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_compile)
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1419 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1420 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_compile)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1421 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_install)
NOTE: Running task 1422 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1423 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1425 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1426 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 1427 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Succeeded
NOTE: Running task 1428 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: Running task 1429 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1430 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1431 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_configure)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1432 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_compile)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_install)
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_install)
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Succeeded
NOTE: Running task 1435 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1436 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1437 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 1438 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Succeeded
NOTE: Running task 1439 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1440 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_packagedata)
NOTE: Running task 1441 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1442 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1443 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package_write_rpm)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_install: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Succeeded
NOTE: Running task 1445 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package)
NOTE: Running task 1447 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Succeeded
NOTE: Running task 1448 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1450 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package_write_rpm)
NOTE: Running task 1451 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package_qa)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Succeeded
NOTE: Running task 1452 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata)
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1452 tasks of which 1369 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pip/23.0.1-r0/temp/log.do_packagedata.2938215
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata) failed with exit code '1'

--===============0903987088697289916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:0f93e70065f3562f7f7e731a55e5cbaab0ed98f6"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 8 Mirrors 0 Missed 32 Current 345 (20% match, 91% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1080 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_fetch)
NOTE: Running task 1129 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1130 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_unpack)
NOTE: Running task 1134 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_fetch)
NOTE: Running task 1135 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_fetch)
NOTE: Running task 1136 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1137 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_fetch)
NOTE: Running task 1222 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_fetch)
NOTE: Running task 1223 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_fetch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1379 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_unpack)
NOTE: Running task 1380 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_unpack)
NOTE: Running task 1381 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_unpack)
NOTE: Running task 1382 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Started
NOTE: Running task 1383 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1384 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1385 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1387 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_unpack)
NOTE: Running task 1388 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_unpack)
NOTE: Running task 1389 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1390 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Started
NOTE: Running task 1391 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_patch)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_patch)
NOTE: Running task 1393 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_patch)
NOTE: Running task 1394 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_patch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1395 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1396 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_patch)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_patch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_gen_targets)
NOTE: Running task 1400 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic)
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Succeeded
NOTE: Running task 1401 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_populate_sysroot)
NOTE: Running task 1402 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_lic unihash changed to 3f80c3d30b96faf02672effa85fb7fb41d57f750dba649b99de81397a3ad8e9b
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_patch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1404 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-tomli-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pip-23.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1407 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1408 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1409 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_configure)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1410 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1411 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_configure)
NOTE: recipe python3-tomli-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: Running task 1413 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_configure)
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Started
NOTE: Running task 1414 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_configure)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_compile)
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1417 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_compile)
NOTE: Running task 1418 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-tomli-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1419 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_compile)
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Started
NOTE: Running task 1420 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1421 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1422 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_install)
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1423 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_install)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1425 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1426 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_package)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_install: Succeeded
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Started
NOTE: Running task 1427 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1428 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-wheel-0.40.0-r0: task do_install: Succeeded
NOTE: Running task 1429 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_create_wrappers: Started
NOTE: Running task 1430 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1431 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_compile)
NOTE: Running task 1433 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Succeeded
NOTE: Running task 1434 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1435 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_install)
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Started
NOTE: recipe python3-tomli-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Started
NOTE: Running task 1436 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-tomli_2.0.1.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 1437 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1438 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-tomli-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb:do_package_write_rpm)
NOTE: Running task 1440 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_package)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package: Succeeded
NOTE: Running task 1441 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_packagedata)
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1442 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wheel-0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1443 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.40.0.bb:do_package_write_rpm)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-semantic-version-2.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_install)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_install: Started
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_package: Succeeded
NOTE: Running task 1445 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.1.0.bb:do_packagedata)
NOTE: recipe python3-wheel-0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_install: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package)
NOTE: Running task 1447 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_package)
NOTE: Running task 1448 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_sysroot)
NOTE: recipe python3-setuptools-scm-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_packagedata)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1450 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package_write_rpm)
NOTE: Running task 1451 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_package_qa)
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_qa: Started
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-setuptools-rust-1.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pip-23.0.1-r0: task do_package: Succeeded
NOTE: Running task 1452 of 1454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata)
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pip-23.0.1-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1452 tasks of which 1369 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:23.1.2-r0 to 0:23.0.1-r0) [version-going-backwards]
ERROR: python3-pip-23.0.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pip/23.0.1-r0/temp/log.do_packagedata.2960291
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pip_23.0.1.bb:do_packagedata) failed with exit code '1'

--===============0903987088697289916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-rust: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz;downloadfilename=setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz;downloadfilename=setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.5.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.6.0.tar.gz;downloadfilename=setuptools-rust-1.6.0.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.6.0.tar.gz;downloadfilename=setuptools-rust-1.6.0.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.6.0.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-rust: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 154279 to 156404 (+1%)
Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_rust-1.5.2.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_rust-1.6.0.dist-info

--===============0903987088697289916==--

