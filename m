Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76427C18E16
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.8651.1698848703647104781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CzuQAK7C;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ilbFQrhK;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b8b460626-a7d00ed3-8a84-47cd-aac2-9c3dfd8617f6-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vhEXGa3C91kECtlLvyYJ4WvdaHDhBg0RE1c8RgrkMdM=;
	b=CzuQAK7CWAtYH1AwksNNM503TA7buhFMeA+jSx1OzE809TTWY+0PMag6naG1giFY
	bOaDT94s5V1634IY3aRGcmq2M1uaIkjFEHcFJuQbPHackL+JjXLf3MBme3+QEO1mmRg
	Gp/Tq/IcMKhPkyY1EmGmdEAx5+YyKyfxEgfC/z7I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vhEXGa3C91kECtlLvyYJ4WvdaHDhBg0RE1c8RgrkMdM=;
	b=ilbFQrhKjg4N98sm85TYbxJW3B8lR42JTgdpvSAX/Zr0n4JuGbHDh1NLDIO03rHb
	jLGXThYhrsOk863gVFwYeEZAGELtHcfw3ghp7NW07G3UH07cAWEfaofJ6BHCwVoH8J9
	xtFOLGnaae9l5ttCPG+9U6bbBKyXoXUxCr8XZhTI=
Content-Type: multipart/mixed; boundary="===============1591428401339500627=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-spdx-tools: upgrading to 0.8.2 SUCCEEDED
Message-ID: <0101018b8b460626-a7d00ed3-8a84-47cd-aac2-9c3dfd8617f6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189958

--===============1591428401339500627==
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
From 31b64b0025d97c3adb46e34b27c6d87d9dfcae97 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 09:32:23 +0000
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


--===============1591428401339500627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-spdx-tools: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-64-poky-linux/python3-spdx-tools: PV changed from "0.8.1" to "0.8.2"
packages/core2-64-poky-linux/python3-spdx-tools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/spdx-tools/spdx-tools-0.8.1.tar.gz;downloadfilename=spdx-tools-0.8.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/spdx-tools/spdx-tools-0.8.2.tar.gz;downloadfilename=spdx-tools-0.8.2.tar.gz"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-dbg: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-dbg: PV changed from "0.8.1" to "0.8.2"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-dev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-dev: PV changed from "0.8.1" to "0.8.2"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-doc: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-doc: PV changed from "0.8.1" to "0.8.2"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-locale: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-locale: PV changed from "0.8.1" to "0.8.2"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-src: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-src: PV changed from "0.8.1" to "0.8.2"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-staticdev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools-staticdev: PV changed from "0.8.1" to "0.8.2"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools: PV changed from "0.8.1" to "0.8.2"
packages/core2-64-poky-linux/python3-spdx-tools/python3-spdx-tools: PKGSIZE changed from 1664188 to 1666903 (+0%)

--===============1591428401339500627==
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
DISTRO_VERSION       = "4.3+snapshot-28450663fa7c2a40f6e3c5ee594dc0a8a57e9483"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:28450663fa7c2a40f6e3c5ee594dc0a8a57e9483"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 102 Local 33 Mirrors 0 Missed 69 Current 640 (32% match, 90% complete)
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 711 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pytest/7.4.2/temp/log.do_packagedata_setscene.3778258
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 740 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_setscene)
NOTE: Running task 1340 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_recipe_qa)
NOTE: Running task 1341 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_recipe_qa)
NOTE: Running task 1342 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_recipe_qa)
NOTE: Running task 1465 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_recipe_qa)
NOTE: Running task 1548 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_recipe_qa)
NOTE: Running task 1549 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_recipe_qa)
NOTE: Running task 1550 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_recipe_qa)
NOTE: Running task 1552 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_recipe_qa)
NOTE: Running task 1553 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_recipe_qa)
NOTE: Running task 1651 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-ply-3.11-r0: task do_recipe_qa: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Started
NOTE: Running task 1713 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_recipe_qa)
NOTE: Running task 1714 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_recipe_qa)
NOTE: recipe python3-click-8.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1850 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_fetch)
NOTE: Running task 1851 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_fetch)
NOTE: Running task 1854 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_fetch)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1915 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_fetch)
NOTE: recipe python3-uritools-4.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1916 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_fetch)
NOTE: Running task 1917 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_fetch)
NOTE: Running task 1918 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_fetch)
NOTE: Running task 1919 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_fetch)
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1920 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_fetch)
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1921 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_unpack)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Started
NOTE: Running task 1922 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_unpack)
NOTE: Running task 1923 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_unpack)
NOTE: Running task 1924 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Started
NOTE: recipe python3-ply-3.11-r0: task do_fetch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 1925 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-uritools-4.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_fetch: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-beartype-0.16.2-r0: task do_fetch: Started
NOTE: Running task 1926 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-beartype-0.16.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Started
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1927 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_patch)
NOTE: Running task 1928 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_patch)
NOTE: Running task 1929 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_patch)
NOTE: Running task 1930 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_unpack)
NOTE: Running task 1931 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_unpack)
NOTE: Running task 1932 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_unpack)
NOTE: Running task 1933 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_unpack)
NOTE: Running task 1934 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_unpack)
NOTE: Running task 1935 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_unpack)
NOTE: Running task 1936 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1937 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1938 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1939 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 742 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1940 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1941 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1942 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_fetch)
NOTE: Running task 1943 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_fetch)
NOTE: Running task 1944 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_collect_spdx_deps)
NOTE: Running task 1945 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Started
NOTE: recipe python3-ply-3.11-r0: task do_unpack: Started
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_unpack: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Started
NOTE: Running task 1946 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1947 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_patch)
NOTE: recipe python3-ply-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ply-3.11-r0: task do_unpack: Succeeded
NOTE: Running task 1948 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-pytest-7.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1949 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_patch)
NOTE: Running task 1953 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1954 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_patch)
NOTE: Running task 1957 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-beartype-0.16.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-beartype-0.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1958 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_patch)
NOTE: Running task 1959 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_patch)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1960 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Started
NOTE: Running task 1961 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1962 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1963 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_unpack)
NOTE: Running task 1964 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Started
NOTE: Running task 1975 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_unpack)
NOTE: Running task 1976 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata)
NOTE: Running task 1977 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1978 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 1979 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-ply-3.11-r0: task do_patch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_patch: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1980 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_patch)
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1981 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_patch)
NOTE: recipe python3-click-8.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-click-8.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1982 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1983 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1984 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure)
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_patch: Succeeded
NOTE: Running task 1985 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1986 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_lic)
NOTE: recipe python3-uritools-4.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1987 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_patch)
NOTE: Running task 1988 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-beartype-0.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1989 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-beartype-0.16.2-r0: task do_patch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1990 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1991 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1992 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-click-8.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Started
NOTE: Running task 1993 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-ply-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1994 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-booleanpy-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1995 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1996 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-booleanpy-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1997 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1998 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1999 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_configure)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2000 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_configure)
NOTE: Running task 2001 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_configure)
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ply-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2002 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_configure)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_configure: Succeeded
NOTE: Running task 2003 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2004 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_configure_ptest_base)
NOTE: Running task 2005 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2006 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-beartype-0.16.2-r0: task do_configure: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Started
NOTE: Running task 2007 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-ply-3.11-r0: task do_configure: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Started
NOTE: Running task 2008 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_configure)
NOTE: recipe python3-booleanpy-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2009 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_configure)
NOTE: Running task 2010 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_configure)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-click-8.1.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_configure: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2011 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_compile)
NOTE: recipe python3-ply-3.11-r0: task do_configure: Succeeded
NOTE: Running task 2012 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile)
NOTE: Running task 2013 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_compile)
NOTE: Running task 2014 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_compile)
NOTE: Running task 2015 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_compile)
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Started
NOTE: Running task 2016 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb:do_compile)
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_compile: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Started
NOTE: recipe python3-ply-3.11-r0: task do_compile: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2017 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_compile)
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3f47b5ed9eb8441973c4ab548f6730c1607013d772c0621215c8eb30a3b8334f
NOTE: recipe python3-booleanpy-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2021 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_compile)
NOTE: recipe python3-isodate-0.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2022 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_compile)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_compile_ptest_base)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-ply-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2024 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2025 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install)
NOTE: recipe python3-click-8.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2026 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_compile_ptest_base)
NOTE: recipe python3-uritools-4.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2027 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_install)
NOTE: recipe python3-ply-3.11-r0: task do_install: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_compile: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Started
NOTE: Running task 2028 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_install)
NOTE: recipe python3-booleanpy-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2029 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_install)
NOTE: Running task 2030 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install)
NOTE: recipe python3-beartype-0.16.2-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_install)
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_install: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2032 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_install)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_install)
NOTE: recipe python3-ply-3.11-r0: task do_install: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package)
NOTE: Running task 2035 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_install_ptest_base)
NOTE: recipe python3-uritools-4.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Started
NOTE: Running task 2036 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Started
NOTE: recipe python3-ply-3.11-r0: task do_package: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2037 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-booleanpy-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_install: Succeeded
NOTE: Running task 2038 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_package)
NOTE: Running task 2039 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_package)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2040 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package)
NOTE: recipe python3-click-8.1.7-r0: task do_install: Succeeded
NOTE: Running task 2041 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_install_ptest_base)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Started
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2042 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Started
NOTE: recipe python3-click-8.1.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2043 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package)
NOTE: recipe python3-click-8.1.7-r0: task do_package: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_install: Succeeded
NOTE: Running task 2044 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_package)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_install: Succeeded
NOTE: Running task 2045 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install: Succeeded
NOTE: Running task 2046 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-beartype-0.16.2-r0: task do_package: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_install: Succeeded
NOTE: Running task 2047 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_package)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Started
NOTE: Running task 2048 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_populate_sysroot)
NOTE: recipe python3-ply-3.11-r0: task do_package: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Started
NOTE: Running task 2049 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_packagedata)
NOTE: Running task 2050 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package)
NOTE: recipe python3-uritools-4.0.2-r0: task do_package: Succeeded
NOTE: Running task 2051 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_packagedata)
NOTE: recipe python3-ply-3.11-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_package: Succeeded
NOTE: Running task 2052 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-booleanpy_4.0.bb:do_packagedata)
NOTE: recipe python3-isodate-0.6.1-r0: task do_package: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package: Succeeded
NOTE: Running task 2053 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-isodate_0.6.1.bb:do_packagedata)
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Started
NOTE: Running task 2054 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_packagedata)
NOTE: recipe python3-ply-3.11-r0: task do_packagedata: Succeeded
NOTE: Running task 2055 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_create_spdx)
NOTE: recipe python3-uritools-4.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2056 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_create_spdx)
NOTE: Running task 2057 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ply_3.11.bb:do_package_write_rpm)
NOTE: Running task 2058 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-uritools_4.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Started
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-booleanpy-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-isodate-0.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2059 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_create_spdx)
NOTE: Running task 2060 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-xmltodict_0.13.0.bb:do_package_write_rpm)
NOTE: recipe python3-ply-3.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package: Succeeded
NOTE: Running task 2061 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_packagedata)
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-uritools-4.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Started
NOTE: recipe python3-ply-3.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package: Succeeded
NOTE: Running task 2062 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_packagedata)
NOTE: recipe python3-click-8.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2063 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_create_spdx)
NOTE: Running task 2064 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-click_8.1.7.bb:do_package_write_rpm)
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Started
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Started
NOTE: recipe python3-xmltodict-0.13.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package: Succeeded
NOTE: Running task 2065 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_packagedata)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2066 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_create_spdx)
NOTE: Running task 2067 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb:do_package_write_rpm)
NOTE: recipe python3-click-8.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2068 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_create_spdx)
NOTE: Running task 2069 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-license-expression-30.1.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-beartype-0.16.2-r0: task do_package: Succeeded
NOTE: Running task 2070 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_packagedata)
NOTE: recipe python3-rdflib-7.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-beartype-0.16.2-r0: task do_packagedata: Started
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_package: Succeeded
NOTE: recipe python3-click-8.1.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2071 of 2083 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb:do_packagedata)
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Started
NOTE: recipe python3-beartype-0.16.2-r0: task do_packagedata: Failed
NOTE: recipe python3-spdx-tools-0.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-license-expression-30.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-rdflib-7.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyyaml-6.0.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2071 tasks of which 1917 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.4.3-r0 to 0:7.4.2-r0) [version-going-backwards]
ERROR: python3-pytest-7.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.4.3-r0 to 0:7.4.2-r0) [version-going-backwards]
ERROR: python3-pytest-7.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.4.3-r0 to 0:7.4.2-r0) [version-going-backwards]
ERROR: python3-pytest-7.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.4.3-r0 to 0:7.4.2-r0) [version-going-backwards]
ERROR: python3-pytest-7.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.4.3-r0 to 0:7.4.2-r0) [version-going-backwards]
ERROR: python3-pytest-7.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.4.3-r0 to 0:7.4.2-r0) [version-going-backwards]
ERROR: python3-pytest-7.4.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.4.3-r0 to 0:7.4.2-r0) [version-going-backwards]
ERROR: python3-pytest-7.4.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-beartype-0.16.2-r0 do_packagedata: QA Issue: Package version for package python3-beartype-src went backwards which would break package feeds (from 0:0.16.4-r0 to 0:0.16.2-r0) [version-going-backwards]
ERROR: python3-beartype-0.16.2-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dbg went backwards which would break package feeds (from 0:0.16.4-r0 to 0:0.16.2-r0) [version-going-backwards]
ERROR: python3-beartype-0.16.2-r0 do_packagedata: QA Issue: Package version for package python3-beartype-staticdev went backwards which would break package feeds (from 0:0.16.4-r0 to 0:0.16.2-r0) [version-going-backwards]
ERROR: python3-beartype-0.16.2-r0 do_packagedata: QA Issue: Package version for package python3-beartype-dev went backwards which would break package feeds (from 0:0.16.4-r0 to 0:0.16.2-r0) [version-going-backwards]
ERROR: python3-beartype-0.16.2-r0 do_packagedata: QA Issue: Package version for package python3-beartype-doc went backwards which would break package feeds (from 0:0.16.4-r0 to 0:0.16.2-r0) [version-going-backwards]
ERROR: python3-beartype-0.16.2-r0 do_packagedata: QA Issue: Package version for package python3-beartype-locale went backwards which would break package feeds (from 0:0.16.4-r0 to 0:0.16.2-r0) [version-going-backwards]
ERROR: python3-beartype-0.16.2-r0 do_packagedata: QA Issue: Package version for package python3-beartype went backwards which would break package feeds (from 0:0.16.4-r0 to 0:0.16.2-r0) [version-going-backwards]
ERROR: python3-beartype-0.16.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-beartype/0.16.2/temp/log.do_packagedata.3793429
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-beartype_0.16.2.bb:do_packagedata) failed with exit code '1'

--===============1591428401339500627==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-spdx-tools-upgrade-0.8.1-0.8.2.patch"

RnJvbSAzMWI2NGIwMDI1ZDk3YzNhZGI0NmUzNGIyN2M2ZDg3ZDlkZmNhZTk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwOTozMjoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BkeC10b29sczogdXBncmFkZSAwLjguMSAtPiAwLjguMgoKLS0tCiAuLi57cHl0aG9u
My1zcGR4LXRvb2xzXzAuOC4xLmJiID0+IHB5dGhvbjMtc3BkeC10b29sc18wLjguMi5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwZHgtdG9vbHNfMC44LjEu
YmIgPT4gcHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4yLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4xLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwZHgtdG9vbHNfMC44LjIuYmIK
c2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXNwZHgtdG9vbHNfMC44LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4yLmJiCmluZGV4IGY1OGExMzg0
MzAuLjUzMjYzY2EwMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zcGR4LXRvb2xzXzAuOC4yLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFH
RSA9ICJodHRwczovL2dpdGh1Yi5jb20vc3BkeC90b29scy1weXRob24iCiBMSUNFTlNFID0gIkFw
YWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1kYzdmMjFj
Y2ZmMGY2NzJmMmE3Y2Q2ZjQxMmFlNjI3ZCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4MzY1
MmNkNjViNTcyNjA1OGRjYmRhYWI4NTgzOWRiZTQ4NGM0M2VhNmY2MTA0NjEzNzUxNmFhMWI4NDI4
YWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWVhNGFjOWMyYzM3NWU3ZjQzOWIxY2VmNWZmMzJl
ZjM0OTE0YzA4M2RlMGY2MWUwOGVkNjdjZDNkOWRlYjJhOSIKIAogQkJDTEFTU0VYVEVORCA9ICJu
YXRpdmUgbmF0aXZlc2RrIgogCi0tIAoyLjM5LjIKCg==

--===============1591428401339500627==--

