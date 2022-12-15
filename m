Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92922C678DE
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.145439.1671136351788403793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lrFugfaM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185177d156a-849e4495-98b1-4658-8776-890bf95d9f68-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hbtmW4hKjoJjb6CSIehFVycZlxWsFJuBnfrebgR8wWU=;
	b=lrFugfaMHfSiyJ6dOTCwdhh9BvJ3iFoQQzC7znxBylxs9qvO1DHt+4QnIp+6IjVU
	LzQyjPLA/RZWSE8Ik9XOWupe30D2HaAyzBwv47zCuRO6Ix52XENLfbwNNdhpASSOx/J
	Sv1o/hDxHzy7hxFpfS9Ym5sypx2PhV0RaM6RJsqc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hbtmW4hKjoJjb6CSIehFVycZlxWsFJuBnfrebgR8wWU=;
	b=BFcMkdKJmqomVVIuOxncCep/z3L6Tmvx0YgYVNT9EcGIf3WcS4j0KCVJhELseIa9
	KXO7K4HqQaCpnr+CZZykYvC5eA7URygx09Sa6PVTOtEG4zJTaPzJWuyPtlOhVe/tkYW
	G9Bn2r6xd6z6TG+scJzziKjwdQuqgtfRgxi9U4jk=
Content-Type: multipart/mixed; boundary="===============3382963928997786665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 1.26.13 SUCCEEDED
Message-ID: <01010185177d156a-849e4495-98b1-4658-8776-890bf95d9f68-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174659

--===============3382963928997786665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *1.26.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.12-1.26.13.patch
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
--===============3382963928997786665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 71 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f7e4b6a5a22d89edabafa9a901112493f95298e"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 12 Mirrors 0 Missed 18 Current 363 (40% match, 95% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1162 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1163 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: Running task 1435 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1436 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1437 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1438 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1439 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1569363
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 390 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1569364
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running task 1440 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1441 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1442 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 1445 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1446 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1448 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1450 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1463 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 393 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1478 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1480 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1481 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1482 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1483 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1486 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1488 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1490 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1494 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1494 tasks of which 1458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.1571484
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============3382963928997786665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1674 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f7e4b6a5a22d89edabafa9a901112493f95298e"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 12 Mirrors 0 Missed 18 Current 363 (40% match, 95% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1161 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1163 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1435 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1436 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1437 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1438 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1558384
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 390 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1558385
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running task 1440 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1441 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1442 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 1444 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1445 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1446 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1448 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1450 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1463 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 393 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1478 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1480 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1481 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1482 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1483 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: Running task 1486 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1488 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1490 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1493 tasks of which 1458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.1560506
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============3382963928997786665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f7e4b6a5a22d89edabafa9a901112493f95298e"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 12 Mirrors 0 Missed 18 Current 363 (40% match, 95% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1161 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 1162 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1435 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1436 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1437 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1438 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1565682
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 390 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1565683
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running task 1440 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1441 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: Running task 1442 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1444 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: Running task 1445 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1446 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1448 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1450 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1463 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 393 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1478 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1480 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1481 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1482 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1483 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1486 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1488 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1490 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1494 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1494 tasks of which 1458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.1567797
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============3382963928997786665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.12.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.13.tar.gz"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 901170 to 902709 (+0%)
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "1.26.12" to "1.26.13"
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.12.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info

--===============3382963928997786665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 25 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f7e4b6a5a22d89edabafa9a901112493f95298e"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 215 Local 197 Mirrors 0 Missed 18 Current 192 (91% match, 95% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 195 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 200 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 229 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running task 830 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 831 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 832 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 835 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_fetch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 234 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1573111
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 242 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1573120
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_fetch: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 244 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 246 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running setscene task 259 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 889 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 894 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 896 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 911 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 940 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: Running task 941 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 950 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 951 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 952 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: Running task 953 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 273 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 281 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_patch: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 292 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 293 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.65.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.65.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.65.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.65.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.65.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.65.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 311 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 333 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 334 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 341 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 350 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 374 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1394 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1395 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1409 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1411 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1447 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1516 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1525 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1526 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: Running task 1527 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: Running task 1529 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1530 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1531 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1532 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1534 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1537 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1538 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1539 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1540 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1540 tasks of which 1502 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.1581078
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============3382963928997786665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f7e4b6a5a22d89edabafa9a901112493f95298e"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 12 Mirrors 0 Missed 18 Current 363 (40% match, 95% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1160 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1162 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1163 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1435 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1436 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1437 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1438 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1439 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata_setscene.1561960
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 390 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-cryptography/38.0.3-r0/temp/log.do_packagedata_setscene.1561961
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running task 1440 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: Running task 1441 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1442 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 1443 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1444 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1445 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to 1cb8ec72ab80865af01daba9887098fb27701382027276890da0e40aad723ca5
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1447 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1448 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1449 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1450 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1463 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 393 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1478 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata)
NOTE: Running task 1480 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1481 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1482 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1483 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: Running task 1484 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1486 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1488 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1490 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1491 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: Running task 1494 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1494 tasks of which 1458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.4-r0 to 0:38.0.3-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.1564131
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============3382963928997786665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.12.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info

--===============3382963928997786665==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.12-1.26.13.patch"

RnJvbSA5OGQ3YjQyMmU4M2YyYWZkNzVlNzcwNTcwNzIyNDczNzMxYWM0NzIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6NTc6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMS4yNi4xMiAtPiAxLjI2LjEzCgotLS0KIC4uLi97cHl0
aG9uMy11cmxsaWIzXzEuMjYuMTIuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmJ9ICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJsbGliM18xLjI2LjEy
LmJiID0+IHB5dGhvbjMtdXJsbGliM18xLjI2LjEzLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTIuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18xLjI2LjEzLmJiCnNp
bWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmIKaW5kZXggMWNkNjliY2IxMC4u
N2FmOTUxMTdjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXVybGxpYjNfMS4yNi4xMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdXJsbGliM18xLjI2LjEzLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL2dpdGh1Yi5jb20vc2hhem93L3VybGxpYjMiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1jMjgyM2NiOTk1NDM5Yzk4NGZk
NjJhOTczZDc5ODE1YyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNmYTk2Y2Y0MjNlNjk4Nzk5
N2ZjMzI2YWU4ZGYzOTZkYjJhOGI3YzY2Nzc0N2Q0N2RkZDhlY2JhOTFmNGE3NGUiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYzA4M2RkMGRjZTY4ZGJmYmUxMTI5ZDUyNzFjYjkwZjk0NDdkZWE3ZDUy
MDk3YzZlMDEyNjEyMGM1MjFkZGVhOCIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0g
CjIuMzcuMwoK

--===============3382963928997786665==--

