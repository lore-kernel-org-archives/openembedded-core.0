Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1774FC64E96
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.46824.1669908626823778299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GFu/x+PQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010184ce4f7a31-053d0403-befa-4a83-9d38-a0bdeeb11d2b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/UD7OV7YxgGM/8n5mDg6LfIwaSXWgHAItzpNeqhYPQk=;
	b=GFu/x+PQbLqSq8Vf6Wxsuuf9uG9LNbWBvng4JL1sOEmrSOzHjsiMfAci3U6XeJXY
	hbdBZi1nUEfmMoI+i0QtidRdT46QFcEoM0pL5bwR03s5gJw3/hety8P0PpfRLTDNBb1
	2pUXaalPxeYLt2xjKiUK89RJ313J52Jj8dfcrb9Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/UD7OV7YxgGM/8n5mDg6LfIwaSXWgHAItzpNeqhYPQk=;
	b=HS5uVuq63X0pxp3WLlOVKwGO6KdT9uZJfw/KgJj0eAwi/uGL/RsnqdNrpDX4zKWT
	aKLrx+A7dyoybX5jmdu3owDMATKcfXbGIcaST4RPdVYQMDJtsDJ8yukFo89WmKZkpLx
	g/Clkbl+8znIuRJAgzLgvyU39olB7DJSY4tz8BfI=
Content-Type: multipart/mixed; boundary="===============5389511626770129540=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.17.3 SUCCEEDED
Message-ID: <01010184ce4f7a31-053d0403-befa-4a83-9d38-a0bdeeb11d2b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174146

--===============5389511626770129540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.17.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.17.0-4.17.3.patch
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
--===============5389511626770129540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0700363ca43b4f33a382a10dcd893899bb7502cb"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 5 Mirrors 0 Missed 32 Current 337 (13% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene)
NOTE: Running task 958 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_fetch)
NOTE: Running task 959 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_fetch)
NOTE: Running task 1063 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: Running task 1116 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1117 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 1118 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_fetch)
NOTE: Running task 1119 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 1322 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1323 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_unpack)
NOTE: Running task 1324 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_unpack)
NOTE: Running task 1325 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1326 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1327 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1328 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 1329 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_unpack)
NOTE: Running task 1330 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_unpack)
NOTE: Running task 1331 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1332 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1333 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1334 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-importlib-metadata/5.0.0-r0/temp/log.do_packagedata_setscene.1505000
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 373 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_setscene)
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1335 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1336 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_patch)
NOTE: Running task 1337 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_patch)
NOTE: Running task 1338 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1339 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 1340 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_patch)
NOTE: Running task 1341 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_patch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1342 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1343 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1344 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1345 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1346 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1347 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1348 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1349 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic unihash changed to 6a3e38a6a04119e1d269fcebf6e4bd0bcd4951549ca663291d6155df591017db
NOTE: Running task 1350 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1351 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1352 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Started
NOTE: Running task 1353 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: Running task 1354 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: Running task 1355 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_configure)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: Running task 1356 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_configure)
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Succeeded
NOTE: Running setscene task 374 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1358 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 1359 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: Running task 1360 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: Running task 1361 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: Running task 1362 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_compile)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1363 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_compile)
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1365 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1374 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: Running task 1375 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1376 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1377 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 1378 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 1379 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Succeeded
NOTE: Running task 1380 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: Running task 1381 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Started
NOTE: Running task 1382 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile_ptest_base)
NOTE: Running task 1383 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1384 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install)
NOTE: Running task 1385 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 1386 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: Running task 1387 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Succeeded
NOTE: Running task 1388 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_sysroot)
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Started
NOTE: Running task 1389 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Succeeded
NOTE: Running task 1390 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install_ptest_base)
NOTE: Running task 1391 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install_ptest_base)
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1392 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package)
NOTE: Running task 1393 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Succeeded
NOTE: Running task 1394 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1395 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Running task 1396 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Succeeded
NOTE: Running task 1397 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1398 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Succeeded
NOTE: Running task 1399 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: Running task 1400 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1401 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: Running task 1402 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1403 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Succeeded
NOTE: Running task 1404 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1405 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package_write_rpm)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1406 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package_write_rpm)
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1408 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package_write_rpm)
NOTE: Running task 1409 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: Running task 1410 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_qa)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1411 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1411 tasks of which 1322 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5389511626770129540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jsonschema: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.17.0.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.17.3.tar.gz"
packages/core2-32-poky-linux/python3-jsonschema: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 462264 to 466705 (+1%)
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.17.0 [default] to 4.17.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.17.0" to "4.17.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 463083 to 470219 (+2%)
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.0.dist-info/licenses -> /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.0.dist-info -> /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info, removed "/usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies.json", added "/usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format
 -assertion /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content"
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.11/site-packages/jsonschema-4.17.0.dist-info moved to /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09 was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12 was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies.json was removed

--===============5389511626770129540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1670 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1668 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0700363ca43b4f33a382a10dcd893899bb7502cb"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 5 Mirrors 0 Missed 32 Current 337 (13% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene)
NOTE: Running task 958 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_fetch)
NOTE: Running task 959 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_fetch)
NOTE: Running task 1063 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: Running task 1116 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_fetch)
NOTE: Running task 1117 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 1118 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_fetch)
NOTE: Running task 1119 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 1322 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1323 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_unpack)
NOTE: Running task 1324 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_unpack)
NOTE: Running task 1325 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1326 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1327 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_unpack)
NOTE: Running task 1328 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 1329 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_unpack)
NOTE: Running task 1330 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1331 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1332 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1333 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1334 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-importlib-metadata/5.0.0-r0/temp/log.do_packagedata_setscene.1495076
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: Running setscene task 373 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_setscene)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1335 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_patch)
NOTE: Running task 1336 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_patch)
NOTE: Running task 1337 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: Running task 1338 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_patch)
NOTE: Running task 1339 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 1340 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_patch)
NOTE: Running task 1341 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1344 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1345 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1346 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1347 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1348 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic unihash changed to 6a3e38a6a04119e1d269fcebf6e4bd0bcd4951549ca663291d6155df591017db
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1350 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1351 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure)
NOTE: Running task 1352 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: Running task 1353 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_configure)
NOTE: Running task 1354 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: Running task 1355 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1356 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_configure)
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Succeeded
NOTE: Running task 1358 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1359 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: Running task 1360 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_compile)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Succeeded
NOTE: Running task 1361 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: Running task 1362 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1363 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_compile)
NOTE: Running setscene task 374 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: Running task 1364 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Started
NOTE: Running task 1365 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1375 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1376 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1377 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 1378 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Succeeded
NOTE: Running task 1379 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: Running task 1380 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_install)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Succeeded
NOTE: Running task 1381 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile_ptest_base)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Started
NOTE: Running task 1382 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1383 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: Running task 1384 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1385 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 1386 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: Running task 1387 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_sysroot)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: Running task 1388 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package)
NOTE: Running task 1389 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Succeeded
NOTE: Running task 1390 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install_ptest_base)
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Succeeded
NOTE: Running task 1391 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install_ptest_base)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1392 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1393 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Succeeded
NOTE: Running task 1394 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1395 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Succeeded
NOTE: Running task 1396 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: Running task 1397 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: Running task 1398 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Succeeded
NOTE: Running task 1399 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: Running task 1400 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1401 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: Running task 1402 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Succeeded
NOTE: Running task 1403 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_packagedata)
NOTE: Running task 1404 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1405 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1406 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package_write_rpm)
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1408 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package_write_rpm)
NOTE: Running task 1409 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: Running task 1410 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_qa)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1411 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1411 tasks of which 1322 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5389511626770129540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.0.dist-info -> /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info, directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.0.dist-info/licenses -> /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info/licenses, removed "/usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies.json", added "/usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/forma
 t-annotation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation"
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.11/site-packages/jsonschema-4.17.0.dist-info moved to /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09 was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12 was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies.json was removed

--===============5389511626770129540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0700363ca43b4f33a382a10dcd893899bb7502cb"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 5 Mirrors 0 Missed 32 Current 337 (13% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene)
NOTE: Running task 958 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_fetch)
NOTE: Running task 959 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_fetch)
NOTE: Running task 1063 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: Running task 1115 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_fetch)
NOTE: Running task 1116 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1118 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 1119 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 1322 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1323 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_unpack)
NOTE: Running task 1324 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_unpack)
NOTE: Running task 1325 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1326 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1327 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_unpack)
NOTE: Running task 1328 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1329 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 1330 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_unpack)
NOTE: Running task 1331 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1332 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1333 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1334 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-importlib-metadata/5.0.0-r0/temp/log.do_packagedata_setscene.1524855
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: Running setscene task 373 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_setscene)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1335 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_patch)
NOTE: Running task 1336 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_patch)
NOTE: Running task 1337 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: Running task 1338 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_patch)
NOTE: Running task 1339 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1340 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 1341 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_patch)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1342 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1344 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1345 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1346 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1347 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1348 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic unihash changed to 6a3e38a6a04119e1d269fcebf6e4bd0bcd4951549ca663291d6155df591017db
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1350 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1351 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1352 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1353 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1354 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_configure)
NOTE: Running task 1355 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: Running task 1356 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_configure)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure_ptest_base)
NOTE: Running task 1358 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 1359 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Succeeded
NOTE: Running task 1360 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1361 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_compile)
NOTE: Running setscene task 374 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1362 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: Running task 1363 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_compile)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Started
NOTE: Running task 1364 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile)
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: Running task 1365 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1375 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1376 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1377 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 1378 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Succeeded
NOTE: Running task 1379 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_install)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 1380 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Succeeded
NOTE: Running task 1381 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile_ptest_base)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: Running task 1382 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile_ptest_base)
NOTE: Running task 1383 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1384 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1385 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: Running task 1386 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: Running task 1387 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package)
NOTE: Running task 1388 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_sysroot)
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Started
NOTE: Running task 1389 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Succeeded
NOTE: Running task 1390 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install_ptest_base)
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Succeeded
NOTE: Running task 1391 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install_ptest_base)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1392 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1393 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Succeeded
NOTE: Running task 1394 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_install)
NOTE: Running task 1395 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Running task 1396 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: Running task 1397 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: Running task 1398 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Succeeded
NOTE: Running task 1399 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package)
NOTE: Running task 1400 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1401 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1402 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Succeeded
NOTE: Running task 1403 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_packagedata)
NOTE: Running task 1404 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1405 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package_write_rpm)
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1406 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package_write_rpm)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1408 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package_write_rpm)
NOTE: Running task 1409 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: Running task 1410 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_qa)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1411 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1411 tasks of which 1322 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5389511626770129540==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.17.0-4.17.3.patch"

RnJvbSAzZWUzMTIyNTFhMjk5YmI2ZGZmNzdlMDBjMmQ4NDJjZjA5NjI1NDdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOTozMjo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjE3LjAgLT4gNC4xNy4zCgotLS0KIC4uLnl0aG9u
My1qc29uc2NoZW1hXzQuMTcuMC5iYiA9PiBweXRob24zLWpzb25zY2hlbWFfNC4xNy4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnNjaGVtYV80LjE3
LjAuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMTcuMy5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE3LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE3
LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xNy4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE3LjMuYmIKaW5kZXgg
MDIzMzdmZTg1Yi4uMzkyYjk1ODRhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xNy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMTcuMy5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT03YTYwYTgxYzE0NmVjMjU1OTlhM2UxZGFiYjg2MTBhOCBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9qc29uL0xJQ0VOU0U7bWQ1PTlkNGRlNDMxMTFkMzM1NzBjOGZlNDliNGNiMGUwMWFm
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWJmY2YyYmNhMTZhMDg3YWRlMTdlMDJiMjgyZDM0
YWY3Y2NkNzQ5ZWY3NjI0MWU3ZjliZDdjMGNiOGE5NDI0ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIwZjg2NDQzN2FiOGI2MDc2YmE2NzA3NDUzZWY4Zjk4YTZhMGQ1MTJhODBlOTNmOGFiZGI2NzZm
NzM3ZWNiNjBkIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjMxLjEK
Cg==

--===============5389511626770129540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1669 targets, 49 skipped, 0 masked, 0 errors.
Removing 29 recipes from the core2-32 sysroot...done.
Removing 45 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0700363ca43b4f33a382a10dcd893899bb7502cb"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 186 Local 154 Mirrors 0 Missed 32 Current 184 (82% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 185 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.10.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 668 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_fetch)
NOTE: Running task 669 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_fetch)
NOTE: Running task 720 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: Running task 771 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_fetch)
NOTE: Running task 772 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_fetch)
NOTE: Running task 773 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 774 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.10.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Succeeded
NOTE: Running task 829 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 830 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_unpack)
NOTE: Running task 831 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_unpack)
NOTE: Running task 832 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_unpack)
NOTE: Running task 833 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_unpack)
NOTE: Running task 834 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 835 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-zipp-3.10.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 224 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.10.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-importlib-metadata/5.0.0-r0/temp/log.do_packagedata_setscene.1534903
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 227 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_setscene)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-zipp-3.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 229 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 239 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 836 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_patch)
NOTE: Running task 837 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_patch)
NOTE: Running task 842 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: Running task 848 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_patch)
NOTE: Running task 849 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_patch)
NOTE: Running task 850 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 851 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Succeeded
NOTE: Running task 871 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 872 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 873 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 874 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 875 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 876 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic)
NOTE: Running task 877 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Succeeded
NOTE: Running task 878 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 253 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic unihash changed to 6a3e38a6a04119e1d269fcebf6e4bd0bcd4951549ca663291d6155df591017db
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 260 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 269 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 270 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 281 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 298 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 325 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 345 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 367 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 370 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1225 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1226 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1253 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1267 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1268 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1269 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1270 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1288 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1345 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1346 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure)
NOTE: Running task 1347 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1348 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_configure)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1349 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: Running task 1350 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_configure)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1351 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: Running task 1352 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Succeeded
NOTE: Running task 1353 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure_ptest_base)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Succeeded
NOTE: Running task 1354 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure_ptest_base)
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1355 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_compile)
NOTE: Running task 1356 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_compile)
NOTE: Running task 1358 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: Running task 1359 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: Running task 1360 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile)
NOTE: Running task 1361 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1362 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 1363 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Succeeded
NOTE: Running task 1364 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_install)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: Running task 1365 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Succeeded
NOTE: Running task 1366 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile_ptest_base)
NOTE: Running task 1367 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile_ptest_base)
NOTE: Running task 1368 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1369 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install)
NOTE: Running task 1370 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Succeeded
NOTE: Running task 1371 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Started
NOTE: Running task 1372 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 1373 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: Running task 1374 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_sysroot)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Succeeded
NOTE: Running task 1375 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install_ptest_base)
NOTE: Running task 1376 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install_ptest_base)
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1377 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package)
NOTE: Running task 1378 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Succeeded
NOTE: Running task 1379 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1380 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: Running task 1381 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_packagedata)
NOTE: Running task 1382 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: Running task 1383 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Succeeded
NOTE: Running task 1384 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package)
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1385 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: Running task 1386 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package_write_rpm)
NOTE: Running task 1387 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Succeeded
NOTE: Running task 1388 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_packagedata)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1389 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1390 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1391 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package_write_rpm)
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Succeeded
NOTE: Running task 1392 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1393 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package_write_rpm)
NOTE: Running task 1394 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: Running task 1395 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_qa)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1396 of 1396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1396 tasks of which 1307 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5389511626770129540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1668 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0700363ca43b4f33a382a10dcd893899bb7502cb"
workspace            = "master:a0dcf93bc919757b23a52597eacb1777df4adf24"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 5 Mirrors 0 Missed 32 Current 337 (13% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 347 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene)
NOTE: Running task 958 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_fetch)
NOTE: Running task 959 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_fetch)
NOTE: Running task 1063 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_fetch)
NOTE: Running task 1115 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_fetch)
NOTE: Running task 1116 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_fetch)
NOTE: Running task 1118 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_fetch)
NOTE: Running task 1119 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_unpack)
NOTE: Running task 1322 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_unpack)
NOTE: Running task 1323 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1324 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_unpack)
NOTE: Running task 1325 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_unpack)
NOTE: Running task 1326 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1327 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1328 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_unpack)
NOTE: Running task 1329 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_unpack)
NOTE: Running task 1330 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1331 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1332 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1333 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1334 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-importlib-metadata/5.0.0-r0/temp/log.do_packagedata_setscene.1514924
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 373 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_setscene)
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1335 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_patch)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1336 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_patch)
NOTE: Running task 1337 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_patch)
NOTE: Running task 1338 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_patch)
NOTE: Running task 1339 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_patch)
NOTE: Running task 1340 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_patch)
NOTE: Running task 1341 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_patch: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1344 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1345 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1346 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1347 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1348 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_lic unihash changed to 6a3e38a6a04119e1d269fcebf6e4bd0bcd4951549ca663291d6155df591017db
NOTE: recipe python3-webcolors-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1350 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1351 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure)
NOTE: Running task 1352 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_configure)
NOTE: Running task 1353 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_configure)
NOTE: Running task 1354 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_configure)
NOTE: Running task 1355 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1356 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_configure)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure: Succeeded
NOTE: Running task 1357 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_configure_ptest_base)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_configure: Succeeded
NOTE: Running task 1358 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_configure_ptest_base)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_configure: Succeeded
NOTE: Running task 1359 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_compile)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: Running task 1360 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_compile)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_configure: Succeeded
NOTE: Running task 1361 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_compile)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1362 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_compile)
NOTE: Running setscene task 374 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1363 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_compile)
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_compile: Started
NOTE: Running task 1364 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile)
NOTE: Running task 1365 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1375 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1376 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_compile: Succeeded
NOTE: Running task 1377 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_compile: Succeeded
NOTE: Running task 1378 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_compile: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_compile: Succeeded
NOTE: Running task 1379 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_install)
NOTE: Running task 1380 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_install)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile: Succeeded
NOTE: Running task 1381 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_compile_ptest_base)
NOTE: Running task 1382 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_compile_ptest_base)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_install: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Started
NOTE: Running task 1383 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1384 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install)
NOTE: Running task 1385 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_install: Succeeded
NOTE: Running task 1386 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package)
NOTE: Running task 1387 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_populate_sysroot)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_install: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_install: Succeeded
NOTE: Running task 1388 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package)
NOTE: Running task 1389 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_install: Succeeded
NOTE: Running task 1390 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_install_ptest_base)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install: Succeeded
NOTE: Running task 1391 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_install_ptest_base)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1392 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package)
NOTE: Running task 1393 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package)
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_compile: Succeeded
NOTE: Running task 1394 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_package: Succeeded
NOTE: Running task 1395 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package: Succeeded
NOTE: Running task 1396 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata)
NOTE: Running task 1397 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_packagedata)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Started
NOTE: Running task 1398 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_install: Succeeded
NOTE: Running task 1399 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1400 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Started
NOTE: Running task 1401 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm)
NOTE: Running task 1402 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb:do_package_write_rpm)
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package: Succeeded
NOTE: Running task 1403 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package: Succeeded
NOTE: Running task 1404 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_packagedata)
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-strict-rfc3339-0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1405 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.12.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1406 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.3.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_packagedata)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Started
NOTE: recipe python3-webcolors-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1408 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb:do_package_write_rpm)
NOTE: Running task 1409 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_write_rpm)
NOTE: Running task 1410 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_package_qa)
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyrsistent-0.19.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1411 of 1411 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1411 tasks of which 1322 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.1.0-r0 to 0:5.0.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-5.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5389511626770129540==--

