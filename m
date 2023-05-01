Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4189ECA9ED9
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.107426.1682976350180551352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Alh0L37m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010187d935241a-22619e1b-429a-4f2a-b6e6-d3b1dfcc1d17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GKLmL6eeTUCCYGHC+boh62HzSdX4Ht4FAoq8/20COIM=;
	b=Alh0L37meBDyAqWL9f8eZBMmnpxufjf4csQHiP/uoigRbGzVrJRHBemj0ii5puTM
	YiKddRYEbpFc5gz+cy8yPRHfC55iE4gpaqyqoIY7nCA3G2xF44/iBidt4NKd0iCYm7H
	5UYaA+B1pK/BKViB6u0Uy/QNnHyPfMVSfoFO4MQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GKLmL6eeTUCCYGHC+boh62HzSdX4Ht4FAoq8/20COIM=;
	b=PZlIiqViIEwUABUu58XvGLfshDqAKhHN5Na5oIier0BKJQXieSQ2VRghREqSPMUx
	DSiZSlw8rdP1d973RwgwWn50XsuSAS1nokrmxF7+lHe9RYEJ7WnwQ8bKsAjOHnp+1xZ
	5QekNrkruCDmyYLBSsGfEsPb793dxZSNWRacavec=
Content-Type: multipart/mixed; boundary="===============8945207958268282487=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 7.0.0 SUCCEEDED
Message-ID: <01010187d935241a-22619e1b-429a-4f2a-b6e6-d3b1dfcc1d17-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180647

--===============8945207958268282487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *7.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-6.1.3-7.0.0.patch
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
--===============8945207958268282487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:978d14165ed567c250170301728b5cd13d7030d7"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 12 Mirrors 0 Missed 76 Current 367 (13% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 386 of 455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1149 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1150 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1172 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_fetch)
NOTE: Running task 1179 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1180 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1181 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1182 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1183 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1184 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1185 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1186 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1187 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1189 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1190 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 1191 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1192 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1270 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1450 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: Running task 1452 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1453 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1454 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1456 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_unpack)
NOTE: Running task 1457 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1458 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1459 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1460 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1461 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1462 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1463 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1464 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1465 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1466 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1467 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1468 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1469 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: Running task 1470 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1471 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1472 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1473 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1474 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1475 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1476 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1477 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1478 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: Running task 1479 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: Running task 1480 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: Running task 1481 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: Running task 1482 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1483 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1484 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1485 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1486 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1487 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 1488 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1489 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1490 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1492 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1493 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1494 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1495 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: Running task 1496 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1497 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1498 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1499 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1500 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1501 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1528 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: Running task 1540 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: Running task 1542 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1544 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: Running task 1545 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1546 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1547 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1548 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1550 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1552 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1553 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1554 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1555 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1556 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1557 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1558 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1559 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Started
NOTE: Running task 1560 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1561 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1562 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1564 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1565 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1566 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1568 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic unihash changed to 2db6295ac419fddd365b805b0801030a7cdb3d18e870d4286ab40c0e2f13fbf1
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1569 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1570 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1571 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1572 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: Running task 1573 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_configure)
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1575 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1576 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1577 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1578 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1579 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1580 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: Running task 1581 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1582 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: Running task 1583 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Started
NOTE: Running task 1584 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: Running task 1585 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1586 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Running task 1587 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_compile)
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1589 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: Running task 1591 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: Running task 1592 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: Running task 1594 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Started
NOTE: Running task 1595 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1597 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: Running task 1598 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1600 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: Running task 1601 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1602 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: Running task 1603 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1604 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1605 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1607 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1610 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: Running task 1612 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1613 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1614 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1615 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1616 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: Running task 1617 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1618 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1619 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1620 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1621 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1622 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1623 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: Running task 1624 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1625 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: Running task 1626 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 1627 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: Running task 1628 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1629 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: Running task 1630 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: Running task 1631 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1632 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: Running task 1633 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1634 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1636 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1638 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: Running task 1639 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1640 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1641 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: Running task 1642 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1643 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1644 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: Running task 1645 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Succeeded
NOTE: Running task 1646 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: Running task 1647 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: Running task 1648 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1649 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: Running task 1651 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: Running task 1652 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1653 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1654 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: Running task 1655 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Failed
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1655 tasks of which 1470 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-requests/2.28.2-r0/temp/log.do_packagedata.3104426
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata) failed with exit code '1'

--===============8945207958268282487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:978d14165ed567c250170301728b5cd13d7030d7"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 12 Mirrors 0 Missed 76 Current 367 (13% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 386 of 455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1149 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1150 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1172 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_fetch)
NOTE: Running task 1179 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1180 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1181 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1182 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1183 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1184 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1185 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 1186 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1187 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1189 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1190 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1191 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1192 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1275 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1448 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: Running task 1449 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_unpack)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: Running task 1450 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1451 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1452 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1453 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1454 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1456 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1457 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1458 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1459 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1460 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1461 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1462 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: Running task 1463 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1464 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1465 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1466 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1467 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1468 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1469 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Started
NOTE: Running task 1470 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1471 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: Running task 1472 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: Running task 1473 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: Running task 1474 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: Running task 1475 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: Running task 1476 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1477 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1480 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1481 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1482 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1483 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1484 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: Running task 1485 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1486 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1488 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1489 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 1490 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1492 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1493 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1494 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_patch)
NOTE: Running task 1495 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1496 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1497 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: Running task 1498 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1499 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1528 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: Running task 1541 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1543 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: Running task 1544 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1545 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: Running task 1546 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1547 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: Running task 1548 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1549 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1550 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1551 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 1552 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1553 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1554 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic)
NOTE: Running task 1555 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1556 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: Running task 1557 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1558 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1559 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1560 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1561 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1562 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1563 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1565 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: Running task 1566 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1568 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1569 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic unihash changed to 2db6295ac419fddd365b805b0801030a7cdb3d18e870d4286ab40c0e2f13fbf1
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1570 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1571 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: Running task 1573 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1575 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1576 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1577 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1581 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1582 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: Running task 1583 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1584 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: Running task 1585 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: Running task 1586 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1587 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_compile)
NOTE: Running task 1589 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: Running task 1590 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: Running task 1591 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: Running task 1592 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1594 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: Running task 1595 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 1597 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1598 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1599 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1600 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: Running task 1601 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1602 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1603 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: Running task 1604 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: Running task 1607 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1610 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: Running task 1613 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: Running task 1614 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1616 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: Running task 1618 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1619 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1620 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: Running task 1621 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: Running task 1622 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1623 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1624 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: Running task 1625 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: Running task 1626 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: Running task 1627 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: Running task 1629 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1630 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1631 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1632 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: Running task 1633 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: Running task 1634 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1636 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1637 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1639 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1640 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: Running task 1641 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1642 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1643 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1644 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: Running task 1645 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1646 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: Running task 1647 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Succeeded
NOTE: Running task 1648 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_package)
NOTE: Running task 1649 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1650 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: Running task 1651 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1652 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1653 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Failed
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1653 tasks of which 1470 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-requests/2.28.2-r0/temp/log.do_packagedata.3201496
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata) failed with exit code '1'

--===============8945207958268282487==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-6.1.3-7.0.0.patch"

RnJvbSBlZjA5YWVmZDYxNzdiMzRmMzA2MjY2MDdlMDAzYWMxYjA3NWViOTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMTo1MzoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDYuMS4zIC0+IDcuMC4wCgotLS0KIC4uLnBoaW54XzYuMS4z
LmJiID0+IHB5dGhvbjMtc3BoaW54XzcuMC4wLmJifSB8IDk3ICsrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzYuMS4zLmJiID0+
IHB5dGhvbjMtc3BoaW54XzcuMC4wLmJifSAoMTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNi4xLjMuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzcuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
MTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhp
bnhfNi4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zcGhpbnhfNy4wLjAuYmIKaW5kZXggMGRlMTlhZjhkOS4uZTU0NmQyZGY5OSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF82LjEuMy5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzcuMC4wLmJi
CkBAIC0xLDEyICsxLDEwNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysr
IExJQ0VOU0UKKyMgQEAgLTM0LDc5ICszNCw2IEBACisjICBMaWNlbnNlcyBmb3IgaW5jb3Jwb3Jh
dGVkIHNvZnR3YXJlCisjICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjICAK
KyMgLVRoZSBpbmNsdWRlZCBzbWFydHlwYW50cyBtb2R1bGUsIGluY2x1ZGVkIGFzIHNwaGlueC51
dGlsLnNtYXJ0eXBhbnRzLAorIyAtaXMgYXZhaWxhYmxlIHVuZGVyIHRoZSBmb2xsb3dpbmcgbGlj
ZW5zZToKKyMgLQorIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorIyAtU21hcnR5UGFudHNfIGxpY2Vuc2U6Ogor
IyAtCisjIC0gICAgQ29weXJpZ2h0IChjKSAyMDAzIEpvaG4gR3J1YmVyCisjIC0gICAgKGh0dHBz
Oi8vZGFyaW5nZmlyZWJhbGwubmV0L3Byb2plY3RzL3NtYXJ0eXBhbnRzLykKKyMgLSAgICBBbGwg
cmlnaHRzIHJlc2VydmVkLgorIyAtCisjIC0gICAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBz
b3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIC0gICAgbW9kaWZpY2F0
aW9uLCBhcmUgcGVybWl0dGVkIHByb3ZpZGVkIHRoYXQgdGhlIGZvbGxvd2luZyBjb25kaXRpb25z
CisjIC0gICAgYXJlIG1ldDoKKyMgLQorIyAtICAgICogICBSZWRpc3RyaWJ1dGlvbnMgb2Ygc291
cmNlIGNvZGUgbXVzdCByZXRhaW4gdGhlIGFib3ZlIGNvcHlyaWdodAorIyAtICAgICAgICBub3Rp
Y2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nIGRpc2NsYWltZXIu
CisjIC0KKyMgLSAgICAqICAgUmVkaXN0cmlidXRpb25zIGluIGJpbmFyeSBmb3JtIG11c3QgcmVw
cm9kdWNlIHRoZSBhYm92ZQorIyAtICAgICAgICBjb3B5cmlnaHQgbm90aWNlLCB0aGlzIGxpc3Qg
b2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZworIyAtICAgICAgICBkaXNjbGFpbWVyIGlu
IHRoZSBkb2N1bWVudGF0aW9uIGFuZC9vciBvdGhlciBtYXRlcmlhbHMKKyMgLSAgICAgICAgcHJv
dmlkZWQgd2l0aCB0aGUgZGlzdHJpYnV0aW9uLgorIyAtCisjIC0gICAgKiAgIE5laXRoZXIgdGhl
IG5hbWUgIlNtYXJ0eVBhbnRzIiBub3IgdGhlIG5hbWVzIG9mIGl0cworIyAtICAgICAgICBjb250
cmlidXRvcnMgbWF5IGJlIHVzZWQgdG8gZW5kb3JzZSBvciBwcm9tb3RlIHByb2R1Y3RzCisjIC0g
ICAgICAgIGRlcml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Ig
d3JpdHRlbgorIyAtICAgICAgICBwZXJtaXNzaW9uLgorIyAtCisjIC0gICAgVGhpcyBzb2Z0d2Fy
ZSBpcyBwcm92aWRlZCBieSB0aGUgY29weXJpZ2h0IGhvbGRlcnMgYW5kCisjIC0gICAgY29udHJp
YnV0b3JzICJhcyBpcyIgYW5kIGFueSBleHByZXNzIG9yIGltcGxpZWQgd2FycmFudGllcywKKyMg
LSAgICBpbmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZCB0bywgdGhlIGltcGxpZWQgd2FycmFudGll
cyBvZgorIyAtICAgIG1lcmNoYW50YWJpbGl0eSBhbmQgZml0bmVzcyBmb3IgYSBwYXJ0aWN1bGFy
IHB1cnBvc2UgYXJlCisjIC0gICAgZGlzY2xhaW1lZC4gSW4gbm8gZXZlbnQgc2hhbGwgdGhlIGNv
cHlyaWdodCBvd25lciBvciBjb250cmlidXRvcnMKKyMgLSAgICBiZSBsaWFibGUgZm9yIGFueSBk
aXJlY3QsIGluZGlyZWN0LCBpbmNpZGVudGFsLCBzcGVjaWFsLAorIyAtICAgIGV4ZW1wbGFyeSwg
b3IgY29uc2VxdWVudGlhbCBkYW1hZ2VzIChpbmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZAorIyAt
ICAgIHRvLCBwcm9jdXJlbWVudCBvZiBzdWJzdGl0dXRlIGdvb2RzIG9yIHNlcnZpY2VzOyBsb3Nz
IG9mIHVzZSwKKyMgLSAgICBkYXRhLCBvciBwcm9maXRzOyBvciBidXNpbmVzcyBpbnRlcnJ1cHRp
b24pIGhvd2V2ZXIgY2F1c2VkIGFuZCBvbgorIyAtICAgIGFueSB0aGVvcnkgb2YgbGlhYmlsaXR5
LCB3aGV0aGVyIGluIGNvbnRyYWN0LCBzdHJpY3QgbGlhYmlsaXR5LCBvcgorIyAtICAgIHRvcnQg
KGluY2x1ZGluZyBuZWdsaWdlbmNlIG9yIG90aGVyd2lzZSkgYXJpc2luZyBpbiBhbnkgd2F5IG91
dCBvZgorIyAtICAgIHRoZSB1c2Ugb2YgdGhpcyBzb2Z0d2FyZSwgZXZlbiBpZiBhZHZpc2VkIG9m
IHRoZSBwb3NzaWJpbGl0eSBvZgorIyAtICAgIHN1Y2ggZGFtYWdlLgorIyAtCisjIC0KKyMgLXNt
YXJ0eXBhbnRzLnB5IGxpY2Vuc2U6OgorIyAtCisjIC0gICAgc21hcnR5cGFudHMucHkgaXMgYSBk
ZXJpdmF0aXZlIHdvcmsgb2YgU21hcnR5UGFudHMuCisjIC0KKyMgLSAgICBSZWRpc3RyaWJ1dGlv
biBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMg
LSAgICBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlkZWQgdGhhdCB0aGUgZm9sbG93
aW5nIGNvbmRpdGlvbnMKKyMgLSAgICBhcmUgbWV0OgorIyAtCisjIC0gICAgKiAgIFJlZGlzdHJp
YnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJpZ2h0Cisj
IC0gICAgICAgIG5vdGljZSwgdGhpcyBsaXN0IG9mIGNvbmRpdGlvbnMgYW5kIHRoZSBmb2xsb3dp
bmcgZGlzY2xhaW1lci4KKyMgLQorIyAtICAgICogICBSZWRpc3RyaWJ1dGlvbnMgaW4gYmluYXJ5
IGZvcm0gbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlCisjIC0gICAgICAgIGNvcHlyaWdodCBub3Rp
Y2UsIHRoaXMgbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9sbG93aW5nCisjIC0gICAgICAg
IGRpc2NsYWltZXIgaW4gdGhlIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscwor
IyAtICAgICAgICBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uCisjIC0KKyMgLSAgICBU
aGlzIHNvZnR3YXJlIGlzIHByb3ZpZGVkIGJ5IHRoZSBjb3B5cmlnaHQgaG9sZGVycyBhbmQKKyMg
LSAgICBjb250cmlidXRvcnMgImFzIGlzIiBhbmQgYW55IGV4cHJlc3Mgb3IgaW1wbGllZCB3YXJy
YW50aWVzLAorIyAtICAgIGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0aGUgaW1wbGll
ZCB3YXJyYW50aWVzIG9mCisjIC0gICAgbWVyY2hhbnRhYmlsaXR5IGFuZCBmaXRuZXNzIGZvciBh
IHBhcnRpY3VsYXIgcHVycG9zZSBhcmUKKyMgLSAgICBkaXNjbGFpbWVkLiBJbiBubyBldmVudCBz
aGFsbCB0aGUgY29weXJpZ2h0IG93bmVyIG9yIGNvbnRyaWJ1dG9ycworIyAtICAgIGJlIGxpYWJs
ZSBmb3IgYW55IGRpcmVjdCwgaW5kaXJlY3QsIGluY2lkZW50YWwsIHNwZWNpYWwsCisjIC0gICAg
ZXhlbXBsYXJ5LCBvciBjb25zZXF1ZW50aWFsIGRhbWFnZXMgKGluY2x1ZGluZywgYnV0IG5vdCBs
aW1pdGVkCisjIC0gICAgdG8sIHByb2N1cmVtZW50IG9mIHN1YnN0aXR1dGUgZ29vZHMgb3Igc2Vy
dmljZXM7IGxvc3Mgb2YgdXNlLAorIyAtICAgIGRhdGEsIG9yIHByb2ZpdHM7IG9yIGJ1c2luZXNz
IGludGVycnVwdGlvbikgaG93ZXZlciBjYXVzZWQgYW5kIG9uCisjIC0gICAgYW55IHRoZW9yeSBv
ZiBsaWFiaWxpdHksIHdoZXRoZXIgaW4gY29udHJhY3QsIHN0cmljdCBsaWFiaWxpdHksIG9yCisj
IC0gICAgdG9ydCAoaW5jbHVkaW5nIG5lZ2xpZ2VuY2Ugb3Igb3RoZXJ3aXNlKSBhcmlzaW5nIGlu
IGFueSB3YXkgb3V0IG9mCisjIC0gICAgdGhlIHVzZSBvZiB0aGlzIHNvZnR3YXJlLCBldmVuIGlm
IGFkdmlzZWQgb2YgdGhlIHBvc3NpYmlsaXR5IG9mCisjIC0gICAgc3VjaCBkYW1hZ2UuCisjIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCisjIC0KKyMgIFRoZSBpbmNsdWRlZCBpbXBsZW1lbnRhdGlvbiBvZiBOdW1w
eURvY3N0cmluZy5fcGFyc2VfbnVtcHlkb2Nfc2VlX2Fsc29fc2VjdGlvbgorIyAgd2FzIGRlcml2
ZWQgZnJvbSBjb2RlIHVuZGVyIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgIAorIyAKKyMKKwog
U1VNTUFSWSA9ICJQeXRob24gZG9jdW1lbnRhdGlvbiBnZW5lcmF0b3IiCiBIT01FUEFHRSA9ICJo
dHRwOi8vc3BoaW54LWRvYy5vcmcvIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNF
ID0gIkJTRC0yLUNsYXVzZSAmIE1JVCAmIEJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA2NmRhNTFhYjczMjMxOWEwNmJlYWU0ZjEwNzg4NTc3Igor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NWViNmFjMWIxMTVhMWVkMjRh
MTJkOWYxNWI2MzM5OTMiCiAKIFBZUElfUEFDS0FHRSA9ICJTcGhpbngiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICIwZGFjM2I2OTg1MzhmZmVmNDE3MTZjZjk3YmEyNmMxYzc3ODhkYmE3M2NlNmYx
NTBjMWZmNWI0NzIwNzg2ZGQyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI4M2M0NGFhMjg5MjJi
YjQyMjM3NzdiNDRhYzBkNTlhZjUwYTI3OWFjNzY5MGRmZTk0NWJiMmI5NTc1ZGM0MWIiCiAKIGlu
aGVyaXQgcHl0aG9uX2ZsaXRfY29yZSBweXBpCiAKLS0gCjIuMzkuMgoK

--===============8945207958268282487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: PV changed from "6.1.3" to "7.0.0"
packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-6.1.3.tar.gz;downloadfilename=Sphinx-6.1.3.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-7.0.0.tar.gz;downloadfilename=Sphinx-7.0.0.tar.gz"
packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "6.1.3" to "7.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "6.1.3" to "7.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "6.1.3" to "7.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "6.1.3" to "7.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "6.1.3" to "7.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "6.1.3" to "7.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "6.1.3" to "7.0.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info -> /usr/lib/python3.11/site-packages/sphinx-7.0.0.dist-info, removed "/usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/setup_command.py /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py", added "/usr/lib/python3.11/site-packages/sph
 inx/themes/basic/searchfield.html"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 6.1.3 [default] to 7.0.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 14957001 to 14755308 (-1%)
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.0.0.dist-info
  /usr/lib/python3.11/site-packages/sphinx/themes/basic/searchfield.html was added
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py was removed
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/setup_command.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__ was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc was removed

--===============8945207958268282487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 39 recipes from the core2-32 sysroot...done.
Removing 64 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:978d14165ed567c250170301728b5cd13d7030d7"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 281 Local 205 Mirrors 0 Missed 76 Current 188 (72% match, 83% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 189 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_package_setscene)
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 208 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 212 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 214 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 216 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 804 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 805 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 806 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 807 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_fetch)
NOTE: Running task 808 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 809 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 810 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 811 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 812 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 813 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 814 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 815 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 816 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 817 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 818 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 819 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 820 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 834 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 837 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: Running setscene task 307 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 920 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: Running task 921 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 922 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 923 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: Running task 924 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 926 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 927 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 928 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 929 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 930 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: Running task 931 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 932 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 933 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_unpack)
NOTE: Running task 934 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 935 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 936 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 937 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 938 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: Running task 940 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 941 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: Running task 942 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 943 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 313 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_package_setscene: Started
NOTE: Running task 944 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 945 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 946 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Started
NOTE: Running task 947 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: Running task 948 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: Running task 949 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 950 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 951 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 952 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: Running task 953 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 954 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.68.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 321 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: Running setscene task 323 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 973 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 974 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 975 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: Running task 976 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 977 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 978 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 979 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: Running task 980 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running task 981 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: Running setscene task 327 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 982 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: Running task 983 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 984 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 985 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 986 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 329 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 332 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running task 991 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 992 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 993 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: Running task 994 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1010 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1011 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic)
NOTE: recipe python3-packaging-23.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1024 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1025 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 343 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic unihash changed to 2db6295ac419fddd365b805b0801030a7cdb3d18e870d4286ab40c0e2f13fbf1
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 355 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 362 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 370 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 387 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 469 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1426 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1467 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1480 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1481 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1483 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1484 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1485 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1486 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1487 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1488 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1489 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1490 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1493 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1549 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1553 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1598 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: Running task 1607 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1609 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1610 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: Running task 1611 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1612 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1614 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1615 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1616 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1617 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1618 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: Running task 1619 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1620 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1621 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: Running task 1622 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 1623 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: Running task 1624 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: Running task 1625 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: Running task 1626 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: Running task 1627 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Started
NOTE: Running task 1628 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1629 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1630 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: Running task 1631 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: Running task 1632 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1633 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1634 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1635 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1636 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1637 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: Running task 1638 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_compile)
NOTE: Running task 1639 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1640 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: Running task 1641 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1642 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: Running task 1643 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1644 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Started
NOTE: Running task 1645 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1646 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: Running task 1647 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: Running task 1648 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: Running task 1649 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1650 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1651 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1652 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1653 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1654 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: Running task 1655 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1656 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: Running task 1657 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: Running task 1658 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1659 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1660 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1662 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1663 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: Running task 1664 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1665 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1666 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1667 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: Running task 1669 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: Running task 1670 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1671 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1672 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1673 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: Running task 1674 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1675 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: Running task 1676 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: Running task 1677 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: Running task 1678 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1679 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1680 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: Running task 1681 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1682 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1683 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1684 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1685 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: Running task 1686 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: Running task 1687 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: Running task 1688 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: Running task 1689 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: Running task 1690 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1691 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: Running task 1692 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1693 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1694 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: Running task 1695 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1696 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Succeeded
NOTE: Running task 1697 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_package)
NOTE: Running task 1698 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: Running task 1699 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: Running task 1700 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: Running task 1701 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: Running task 1702 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 1703 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1704 of 1730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1704 tasks of which 1511 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-requests/2.28.2-r0/temp/log.do_packagedata.3413030
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata) failed with exit code '1'

--===============8945207958268282487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:978d14165ed567c250170301728b5cd13d7030d7"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 12 Mirrors 0 Missed 76 Current 367 (13% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 386 of 455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1149 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1150 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1172 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_fetch)
NOTE: Running task 1179 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1180 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1181 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1182 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1183 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1184 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1185 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1186 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1187 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 1189 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1190 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1191 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1192 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1268 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1447 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: Running task 1450 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1451 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1453 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1454 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_unpack)
NOTE: Running task 1455 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1456 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1457 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1458 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1459 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1460 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1461 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1462 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1463 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1464 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1465 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: Running task 1466 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1467 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1468 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1469 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1470 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1471 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1472 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1473 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: Running task 1474 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1475 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: Running task 1476 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: Running task 1477 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1480 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1481 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: Running task 1482 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 1483 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: Running task 1484 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1485 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: Running task 1486 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1488 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: Running task 1489 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1490 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1491 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1492 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1493 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1494 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1495 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: Running task 1496 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: Running task 1497 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1498 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1499 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: Running task 1518 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_patch)
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: Running task 1531 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: Running task 1541 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: Running task 1543 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1544 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1545 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1546 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: Running task 1547 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: Running task 1548 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1550 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1551 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1552 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1553 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1554 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1555 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1556 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1557 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1558 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1560 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1561 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1562 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: Running task 1563 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1565 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1567 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1568 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1569 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: Running task 1570 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1571 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic unihash changed to 2db6295ac419fddd365b805b0801030a7cdb3d18e870d4286ab40c0e2f13fbf1
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1572 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1573 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1574 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1575 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: Running task 1576 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1577 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1578 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Running task 1580 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1581 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: Running task 1583 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Started
NOTE: Running task 1584 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: Running task 1585 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: Running task 1586 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1587 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1588 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1589 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: Running task 1590 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1591 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: Running task 1592 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: Running task 1593 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1595 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: Running task 1597 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: Running task 1598 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1599 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1600 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: Running task 1601 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1602 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: Running task 1603 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1604 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1605 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1610 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: Running task 1611 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: Running task 1612 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: Running task 1613 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1614 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1615 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1616 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1617 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1618 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: Running task 1619 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1620 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: Running task 1621 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1622 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1623 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: Running task 1624 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: Running task 1625 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1626 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: Running task 1628 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1629 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: Running task 1630 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: Running task 1631 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: Running task 1632 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: Running task 1634 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1635 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: Running task 1636 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1637 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1639 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1640 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: Running task 1641 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: Running task 1643 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: Running task 1644 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: Running task 1645 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1646 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1647 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1648 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: Running task 1649 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1650 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: Running task 1651 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: Running task 1652 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1653 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Started
NOTE: Running task 1654 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: Running task 1655 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1656 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Failed
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1656 tasks of which 1470 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-requests/2.28.2-r0/temp/log.do_packagedata.3288384
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata) failed with exit code '1'

--===============8945207958268282487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:978d14165ed567c250170301728b5cd13d7030d7"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 12 Mirrors 0 Missed 76 Current 367 (13% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 386 of 455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1149 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1150 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_fetch)
NOTE: Running task 1172 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_fetch)
NOTE: Running task 1179 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1180 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1181 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1182 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1183 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1184 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1186 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1187 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1188 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1189 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1190 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_fetch)
NOTE: Running task 1191 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1192 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1269 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_fetch)
NOTE: Running task 1450 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1452 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_fetch: Succeeded
NOTE: Running task 1453 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1455 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_unpack)
NOTE: Running task 1456 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_unpack)
NOTE: Running task 1457 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1458 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1459 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1460 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1461 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1462 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1463 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1464 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1465 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1466 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1467 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1468 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1469 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_unpack)
NOTE: Running task 1470 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1471 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1472 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1473 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1474 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1475 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1476 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1477 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Started
NOTE: Running task 1478 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: Running task 1479 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1480 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1482 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: Running task 1483 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1484 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1485 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: Running task 1486 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1487 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1488 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1490 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_patch)
NOTE: Running task 1491 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: recipe python3-requests-2.28.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1492 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1493 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1494 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1495 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1496 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_patch)
NOTE: Running task 1497 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1498 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1499 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1500 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_unpack)
NOTE: Running task 1501 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: Running task 1530 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: Running task 1540 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_write_rpm)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: Running task 1542 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_patch)
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Started
NOTE: Running task 1544 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1545 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1546 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1547 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running task 1548 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1550 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1551 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1552 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1553 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1554 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1555 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: Running task 1556 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1557 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: Running task 1558 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1559 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1560 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1561 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1562 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1564 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1565 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1566 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1567 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1568 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_lic unihash changed to 2db6295ac419fddd365b805b0801030a7cdb3d18e870d4286ab40c0e2f13fbf1
NOTE: recipe python3-toml-0.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1569 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1570 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-pytz-2023.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: Running task 1571 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1572 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1573 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: Running task 1574 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1575 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_configure: Succeeded
NOTE: Running task 1576 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1577 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1578 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Started
NOTE: Running task 1579 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1580 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1581 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1582 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1583 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1584 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1585 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Running task 1586 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-toml-0.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1587 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: Running task 1589 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Started
NOTE: Running task 1590 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1591 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: Running task 1592 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Started
NOTE: Running task 1593 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1595 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1596 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1597 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1598 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1599 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-toml-0.10.2-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: Running task 1600 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile)
NOTE: Running task 1601 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1602 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: Running task 1603 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: Running task 1604 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: Running task 1610 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1612 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_install)
NOTE: Running task 1613 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1614 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1616 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1617 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: Running task 1618 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1619 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1620 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1621 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1622 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.2-r0: task do_install: Succeeded
NOTE: Running task 1623 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: Running task 1624 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_package)
NOTE: Running task 1625 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1626 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_install: Succeeded
NOTE: Running task 1627 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: Running task 1629 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1630 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1631 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1632 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1633 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1634 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1635 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1636 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: Running task 1638 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1639 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1640 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1641 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: Running task 1643 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: Running task 1644 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: Running task 1645 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1646 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-toml-0.10.2-r0: task do_package: Succeeded
NOTE: Running task 1647 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: Running task 1648 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.0.0-r0: task do_install: Succeeded
NOTE: Running task 1649 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_package)
NOTE: Running task 1650 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Started
NOTE: Running task 1651 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package)
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1652 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 1653 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1654 of 1683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.2-r0: task do_packagedata: Failed
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1654 tasks of which 1470 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.29.0-r0 to 0:2.28.2-r0) [version-going-backwards]
ERROR: python3-requests-2.28.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-requests/2.28.2-r0/temp/log.do_packagedata.3010766
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.2.bb:do_packagedata) failed with exit code '1'

--===============8945207958268282487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info -> /usr/lib/python3.11/site-packages/sphinx-7.0.0.dist-info, removed "/usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/setup_command.py /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/sph
 inx/themes/basic/searchfield.html"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-6.1.3.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-7.0.0.dist-info
  /usr/lib/python3.11/site-packages/sphinx/themes/basic/searchfield.html was added
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/iterators.py was removed
  /usr/lib/python3.11/site-packages/sphinx/ext/napoleon/__pycache__/iterators.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/__pycache__/setup_command.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/setup_command.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/jsdump.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/__pycache__/jsdump.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__init__.py was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__ was removed
  /usr/lib/python3.11/site-packages/sphinx/util/stemmer/__pycache__/__init__.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/_html4.py was removed
  /usr/lib/python3.11/site-packages/sphinx/writers/__pycache__/_html4.cpython-311.pyc was removed

--===============8945207958268282487==--

