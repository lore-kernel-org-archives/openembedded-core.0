Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7915DC64E90
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.876.1667349632093172935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f2UtR4da;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018435c85a4e-d0a67600-6351-40fd-9a20-d644dc24efbb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CA9aldt/xhiWTrmE8JNrmT0Wl9JlKaZDVSxhYla5alI=;
	b=f2UtR4dawXDIqCd2GW3qdca7v/888KmrMok8vcA4GNyaNXsl8pjA2g6LT4r8GDxW
	Eaq5XWUGg58P98EfertL+owma8Qw9n0hIV8bJx9kgS47DUNr6Vp36DJAIzk8Knjzmoz
	2jzN2KDiW82GikAlf+r8/OiBT5V4pnA1Jb7Skm7A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CA9aldt/xhiWTrmE8JNrmT0Wl9JlKaZDVSxhYla5alI=;
	b=PJqBLCnCwiqPbB6Ss6n6d/in6Va5PGOMe3XzEzjq/Vnl7P/KwnTURmsxy5Ap0Svp
	JfifBu7AEovUeSQZKeC88TDUt8C51PyhmuPoCHOu0ON7wQooDk8E15J1Yvv730HOcH7
	U1OIlJgdcNivXG5lASTECLeevBEGar6UOrmrLjV8=
Content-Type: multipart/mixed; boundary="===============4757422270580767078=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 5.3.0 SUCCEEDED
Message-ID: <0101018435c85a4e-d0a67600-6351-40fd-9a20-d644dc24efbb-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172446

--===============4757422270580767078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *5.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-5.2.3-5.3.0.patch
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
--===============4757422270580767078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-5.2.3.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-5.3.0.tar.gz"
packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 5.2.3 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx: PV changed from "5.2.3" to "5.3.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 5.2.3 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "5.2.3" to "5.3.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 5.2.3 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "5.2.3" to "5.3.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 5.2.3 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "5.2.3" to "5.3.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 5.2.3 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "5.2.3" to "5.3.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 5.2.3 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "5.2.3" to "5.3.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 5.2.3 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "5.2.3" to "5.3.0"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 15539322 to 15615206 (+0%)
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 5.2.3 [default] to 5.3.0 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "5.2.3" to "5.3.0"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-5.2.3.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-5.3.0.dist-info

--===============4757422270580767078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.11/site-packages/sphinx-5.2.3.dist-info moved to /usr/lib/python3.11/site-packages/sphinx-5.3.0.dist-info

--===============4757422270580767078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:bcf85716999a634dd536eb707a5e8421c9b8b2bb"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 15 Mirrors 0 Missed 79 Current 346 (15% match, 82% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1125 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1127 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1157 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_fetch)
NOTE: Running task 1159 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1160 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 1161 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 1162 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1163 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 1164 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1165 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 1166 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1167 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1168 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1169 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1170 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1173 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1226 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1227 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 1228 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1229 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_fetch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: Running task 1402 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1403 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1404 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_unpack)
NOTE: Running task 1405 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1406 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 1407 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 1408 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1409 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1410 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1411 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1412 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 1413 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1414 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: Running task 1415 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1416 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1417 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1418 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1419 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1420 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1421 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1422 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1424 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1425 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pytz/2022.4-r0/temp/log.do_packagedata_setscene.991660
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: Running task 1426 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-cryptography/38.0.1-r0/temp/log.do_packagedata_setscene.991661
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 437 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_package_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: Running setscene task 438 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_setscene)
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1427 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1429 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1430 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_patch)
NOTE: Running task 1433 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: Running task 1434 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: Running task 1435 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1436 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: Running task 1437 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1438 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1439 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1440 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1441 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1442 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1443 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1444 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: Running task 1446 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: Running task 1447 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: Running task 1448 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: Running task 1449 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1450 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 1451 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1452 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_unpack)
NOTE: Running task 1453 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1455 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1456 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1457 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1458 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1459 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: Running task 1460 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: Running task 1461 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1463 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1464 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1465 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1466 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1467 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1468 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1469 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1470 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Started
NOTE: Running task 1471 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1472 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1473 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1474 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1475 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1476 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic unihash changed to 8d7734ac262a902adfb614e2286f414be5b75a4139ff76ebb4e7a0b99dd0ef94
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1477 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1478 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1479 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_configure)
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1480 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1481 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: Running task 1482 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: Running task 1483 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1484 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: Running task 1485 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: Running task 1486 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_configure)
NOTE: Running task 1487 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Started
NOTE: Running task 1488 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Started
NOTE: Running task 1489 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: Running task 1490 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: Running task 1491 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: Running task 1492 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1493 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1494 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1495 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 1496 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1498 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1499 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1503 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1504 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Started
NOTE: Running task 1505 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_compile)
NOTE: Running task 1506 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: Running task 1507 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: Running task 1508 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: Running task 1509 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1510 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: Running task 1511 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1526 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Started
NOTE: Running task 1527 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: Running task 1540 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1541 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: Running task 1542 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: Running task 1545 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_compile)
NOTE: Running task 1548 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1549 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1552 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: Running task 1553 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1555 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Started
NOTE: Running task 1556 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: Running task 1557 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1558 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1559 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1561 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1562 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: Running task 1563 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1564 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1565 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1566 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 1567 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1568 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: Running task 1569 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: Running task 1570 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 1571 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Succeeded
NOTE: Running task 1572 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: Running task 1574 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Started
NOTE: Running task 1575 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1576 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1577 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1578 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1579 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1581 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: Running task 1582 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1584 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1585 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1586 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: Running task 1587 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1588 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package)
NOTE: Running task 1590 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1591 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1592 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: Running task 1594 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: Running task 1595 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1596 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_packagedata)
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1597 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: Running task 1598 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_package)
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1599 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1600 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: Running task 1602 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: Running task 1603 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1604 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1605 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1606 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: Running task 1607 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1608 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_packagedata)
NOTE: Running task 1609 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1610 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: Running task 1611 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1612 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1613 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1614 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: Running task 1615 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: Running task 1617 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1618 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: Running task 1619 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1620 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: Running task 1621 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1622 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1623 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1624 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 1626 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1627 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Succeeded
NOTE: Running task 1628 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 1629 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Succeeded
NOTE: Running task 1630 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 1631 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1632 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package_write_rpm)
NOTE: Running task 1633 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_write_rpm)
NOTE: Running task 1634 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_qa)
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1635 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1636 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1636 tasks of which 1408 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4757422270580767078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 44 recipes from the core2-32 sysroot...done.
Removing 62 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:bcf85716999a634dd536eb707a5e8421c9b8b2bb"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 266 Local 187 Mirrors 0 Missed 79 Current 190 (70% match, 82% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 839 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 840 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 841 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_fetch)
NOTE: Running task 842 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 843 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 844 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 845 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 846 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 847 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 848 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 849 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 850 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 851 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 852 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 853 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 854 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 858 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 859 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_fetch)
NOTE: Running task 860 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 861 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: Running task 915 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 916 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 917 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 918 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 919 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: Running task 920 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: Running task 921 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 922 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: Running task 923 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: Running task 924 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_unpack)
NOTE: Running task 925 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: Running setscene task 288 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: Running setscene task 289 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata_setscene)
NOTE: Running task 926 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 927 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 928 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 929 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 930 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 931 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pytz/2022.4-r0/temp/log.do_packagedata_setscene.1064539
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_setscene)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-cryptography/38.0.1-r0/temp/log.do_packagedata_setscene.1064541
NOTE: recipe python3-pyparsing-3.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 300 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_package_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: Running task 933 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 301 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 934 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 938 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 939 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 940 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 941 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 942 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyparsing-3.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 943 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: Running task 944 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 950 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 952 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 953 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 954 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_patch)
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: Running task 956 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: Running task 957 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 967 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_unpack)
NOTE: Running task 968 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 969 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 974 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 988 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 989 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 990 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 995 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 996 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 997 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: Running task 998 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: Running task 999 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1000 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1001 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1002 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1003 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1004 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1005 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_patch)
NOTE: Running task 1006 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1008 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1009 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1010 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1011 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: Running task 1012 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 322 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Started
NOTE: Running setscene task 324 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1021 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1022 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1023 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 329 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic unihash changed to 8d7734ac262a902adfb614e2286f414be5b75a4139ff76ebb4e7a0b99dd0ef94
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 334 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 341 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.64.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.64.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.64.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 456 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1404 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1405 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1450 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1456 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1457 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1459 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1460 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1461 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1462 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1463 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1467 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1498 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1512 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1513 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1514 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1554 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1567 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_configure)
NOTE: Running task 1568 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: Running task 1569 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1570 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1571 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1573 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1574 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1575 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: Running task 1576 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1577 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1578 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: Running task 1579 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1580 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1581 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: Running task 1582 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 1583 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_compile)
NOTE: Running task 1584 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: Running task 1585 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Started
NOTE: Running task 1587 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1588 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1589 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: Running task 1591 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Started
NOTE: Running task 1592 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Started
NOTE: Running task 1593 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1594 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: Running task 1595 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1596 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: Running task 1597 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1598 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1599 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1600 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: Running task 1601 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: Running task 1602 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: Running task 1603 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: Running task 1604 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: Running task 1605 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1606 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1607 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1608 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1609 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1610 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1611 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1612 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: Running task 1613 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: Running task 1614 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Succeeded
NOTE: Running task 1615 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1616 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: Running task 1617 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_install)
NOTE: Running task 1618 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: Running task 1619 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1620 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: Running task 1621 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: Running task 1622 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1623 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: Running task 1624 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: Running task 1625 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: Running task 1626 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: Running task 1627 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: Running task 1629 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: Running task 1630 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: Running task 1631 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1632 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1633 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1634 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1635 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: Running task 1636 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1637 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: Running task 1638 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1639 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_install)
NOTE: Running task 1640 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1641 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: Running task 1642 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1643 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1644 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: Running task 1645 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1646 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Succeeded
NOTE: Running task 1647 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1648 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1649 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_package)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1651 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 1652 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1653 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1654 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1655 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: Running task 1656 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1657 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1658 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: Running task 1659 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1660 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: Running task 1661 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: Running task 1662 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1663 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1664 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1665 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1666 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_packagedata)
NOTE: Running task 1667 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: Running task 1668 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: Running task 1669 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1670 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1671 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1672 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1673 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: Running task 1674 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: Running task 1675 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package_write_rpm)
NOTE: Running task 1676 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1677 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1678 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_packagedata)
NOTE: Running task 1679 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package)
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1680 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1681 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1682 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 1683 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 1684 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Succeeded
NOTE: Running task 1685 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 1686 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Succeeded
NOTE: Running task 1687 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1688 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1689 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package_write_rpm)
NOTE: Running task 1690 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_write_rpm)
NOTE: Running task 1691 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_qa)
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1692 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1692 tasks of which 1464 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4757422270580767078==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-5.2.3-5.3.0.patch"

RnJvbSAzZjNlODZlYzUxZjY0Zjk2M2ZjZjlkNjU0ZDAzZDZhNjdlZTc1YjU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMTowNjo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDUuMi4zIC0+IDUuMy4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc3BoaW54XzUuMi4zLmJiID0+IHB5dGhvbjMtc3BoaW54XzUuMy4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzUuMi4zLmJiID0+IHB5
dGhvbjMtc3BoaW54XzUuMy4wLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNS4yLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzUuMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhf
NS4yLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbnhfNS4zLjAuYmIKaW5kZXggOTU3YmQxN2ZjMC4uNzBiNGUyM2RlZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF81LjIuMy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzUuMy4wLmJiCkBA
IC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MmM1
MzZlNzhjMjFjNTY3MzExYjE5M2ZlMDBjZDI1MyIKIAogUFlQSV9QQUNLQUdFID0gIlNwaGlueCIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjViMTBjYjEwMjJkYWM4YzAzNWY3NTc2Nzc5OWMzOTIx
N2EwNWZjMGZlMmQ2ZmU1NTk3NTYwZDM4ZTQ0ZjAzNjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NTEwMjZkZTBhOWZmOWZjMTNjMDVkNzQ5MTNhZDY2MDQ3ZTEwNGY1NmExMjlmZjczZTE3NGViNWMz
ZWU3OTRiNSIKIAogaW5oZXJpdCBweXRob25fZmxpdF9jb3JlIHB5cGkKIAotLSAKMi4zMS4xCgo=

--===============4757422270580767078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:bcf85716999a634dd536eb707a5e8421c9b8b2bb"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 15 Mirrors 0 Missed 79 Current 346 (15% match, 82% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1125 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1127 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1157 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_fetch)
NOTE: Running task 1158 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1159 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 1160 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 1161 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1162 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1163 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1164 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 1165 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1167 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1168 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1169 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 1171 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1173 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1223 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_fetch)
NOTE: Running task 1224 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 1225 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1226 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: Running task 1402 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_unpack)
NOTE: Running task 1403 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1404 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1405 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: Running task 1406 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: Running task 1407 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1408 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1409 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 1410 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 1411 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1412 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1413 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1414 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: Running task 1415 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1416 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1417 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1418 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 1419 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1420 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1421 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1425 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1426 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: Running task 1427 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pytz/2022.4-r0/temp/log.do_packagedata_setscene.1015900
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: Running setscene task 437 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-cryptography/38.0.1-r0/temp/log.do_packagedata_setscene.1015901
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: Running setscene task 438 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_package_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1428 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1430 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1433 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1434 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1435 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_patch)
NOTE: Running task 1436 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: Running task 1438 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: Running task 1439 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1440 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1441 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1442 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: Running task 1443 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1444 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1445 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: Running task 1447 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: Running task 1449 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_unpack)
NOTE: Running task 1450 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 1451 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1452 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1453 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: Running task 1454 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1455 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1456 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1457 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1458 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1459 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1460 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1461 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: Running task 1462 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1463 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1464 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1465 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1466 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1467 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1468 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1469 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1470 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Started
NOTE: Running task 1471 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1472 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1473 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: Running task 1474 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1475 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_patch)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic unihash changed to 8d7734ac262a902adfb614e2286f414be5b75a4139ff76ebb4e7a0b99dd0ef94
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1476 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1477 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1478 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_configure)
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1479 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1480 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: Running task 1481 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: Running task 1482 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: Running task 1483 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: Running task 1484 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: Running task 1485 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: Running task 1486 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_configure)
NOTE: Running task 1487 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Started
NOTE: Running task 1488 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: Running task 1489 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Started
NOTE: Running task 1490 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1491 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1492 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1493 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: Running task 1494 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: Running task 1495 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1496 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1498 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: Running task 1501 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1503 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: Running task 1504 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Started
NOTE: Running task 1505 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: Running task 1506 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1507 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1508 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: Running task 1509 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: Running task 1510 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 1511 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1526 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1528 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata)
NOTE: Running task 1529 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1540 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1541 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1544 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1545 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: Running task 1548 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1549 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_install)
NOTE: Running task 1552 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1553 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1555 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: Running task 1557 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1558 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1559 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: Running task 1560 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: Running task 1561 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: Running task 1562 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1563 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1564 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1565 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: Running task 1566 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: Running task 1567 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: Running task 1568 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: Running task 1570 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: Running task 1571 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Succeeded
NOTE: Running task 1572 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1574 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1575 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: Running task 1576 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1577 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: Running task 1579 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: Running task 1580 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1581 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1583 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: Running task 1584 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: Running task 1585 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1586 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1587 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: Running task 1588 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package)
NOTE: Running task 1590 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1591 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: Running task 1592 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_package)
NOTE: Running task 1596 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 1597 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: Running task 1598 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_packagedata)
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: Running task 1599 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1600 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1602 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1603 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: Running task 1604 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1605 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1606 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1607 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1609 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: Running task 1610 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: Running task 1611 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1612 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1613 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1614 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1615 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: Running task 1616 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1617 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1618 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1619 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1620 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: Running task 1621 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1622 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1623 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Succeeded
NOTE: Running task 1624 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_packagedata)
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 1626 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1627 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: Running task 1629 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Succeeded
NOTE: Running task 1630 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: Running task 1631 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1632 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package_write_rpm)
NOTE: Running task 1633 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_write_rpm)
NOTE: Running task 1634 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_qa)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1635 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1636 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1636 tasks of which 1408 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4757422270580767078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:bcf85716999a634dd536eb707a5e8421c9b8b2bb"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 15 Mirrors 0 Missed 79 Current 346 (15% match, 82% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1125 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1127 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1157 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_fetch)
NOTE: Running task 1158 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 1159 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1160 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 1161 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 1162 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1163 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 1164 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1165 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1166 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1169 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1170 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1171 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1173 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1223 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_fetch)
NOTE: Running task 1224 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 1225 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1226 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: Running task 1402 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_unpack)
NOTE: Running task 1403 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1404 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1405 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Started
NOTE: Running task 1406 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: Running task 1407 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: Running task 1408 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1409 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 1410 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 1411 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1412 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 1413 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1414 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1415 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1416 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1417 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1418 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1419 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1420 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1421 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: Running task 1422 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1423 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1425 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1426 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pytz/2022.4-r0/temp/log.do_packagedata_setscene.1040144
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-cryptography/38.0.1-r0/temp/log.do_packagedata_setscene.1040145
NOTE: Running setscene task 437 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_setscene)
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: Running setscene task 438 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_package_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1427 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1429 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1430 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: Running task 1431 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1432 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1433 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1434 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1435 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 1436 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_patch)
NOTE: Running task 1437 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: Running task 1438 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1439 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1440 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1441 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1442 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1443 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 1444 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: Running task 1445 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: Running task 1446 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Started
NOTE: Running task 1447 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1449 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_unpack)
NOTE: Running task 1450 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 1451 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1452 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1453 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1455 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1456 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1457 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1458 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic)
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: Running task 1460 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1461 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1462 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1463 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1464 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1465 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1466 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1467 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1468 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1469 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1470 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: Running task 1471 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: Running task 1472 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1473 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1474 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1475 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_patch)
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1476 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic unihash changed to 8d7734ac262a902adfb614e2286f414be5b75a4139ff76ebb4e7a0b99dd0ef94
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1477 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1478 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_configure)
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1480 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_configure)
NOTE: Running task 1481 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: Running task 1482 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: Running task 1483 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: Running task 1484 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1485 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: Running task 1486 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Started
NOTE: Running task 1487 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Started
NOTE: Running task 1488 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: Running task 1489 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1490 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: Running task 1491 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: Running task 1492 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1493 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1494 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1495 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1496 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1497 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1498 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_compile)
NOTE: Running task 1499 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: Running task 1502 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: Running task 1503 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1504 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 1506 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: Running task 1507 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Started
NOTE: Running task 1508 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: Running task 1509 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1510 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1511 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: Running task 1512 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: Running task 1513 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1514 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1529 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: Running task 1531 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1542 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: Running task 1545 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: Running task 1548 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1549 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: Running task 1552 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_install)
NOTE: Running task 1553 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_install)
NOTE: Running task 1554 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1555 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: Running task 1556 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: Running task 1558 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1559 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Started
NOTE: Running task 1560 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: Running task 1561 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1562 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1563 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: Running task 1564 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1565 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: Running task 1566 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: Running task 1567 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1568 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Succeeded
NOTE: Running task 1570 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1571 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1572 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: Running task 1573 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: Running task 1574 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1575 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1576 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1577 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: Running task 1578 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1579 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: Running task 1581 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1582 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1583 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1584 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: Running task 1585 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: Running task 1586 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: Running task 1587 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1588 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package)
NOTE: Running task 1590 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_sysroot)
NOTE: Running task 1591 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1592 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Started
NOTE: Running task 1593 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: Running task 1594 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: Running task 1596 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_packagedata)
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 1597 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_package)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1598 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1599 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1600 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1601 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: Running task 1602 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1603 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1604 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1605 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1606 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 1607 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1609 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: Running task 1610 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: Running task 1611 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Started
NOTE: Running task 1612 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1613 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: Running task 1614 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1615 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1616 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1617 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: Running task 1618 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1619 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1620 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package_write_rpm)
NOTE: Running task 1621 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: Running task 1622 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1623 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Succeeded
NOTE: Running task 1624 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: Running task 1625 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 1626 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package_write_rpm)
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1627 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: Running task 1629 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1630 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: Running task 1631 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1632 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package_write_rpm)
NOTE: Running task 1633 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package_write_rpm)
NOTE: Running task 1634 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_write_rpm)
NOTE: Running task 1635 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_qa)
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1636 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1636 tasks of which 1408 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4757422270580767078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1666 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:bcf85716999a634dd536eb707a5e8421c9b8b2bb"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 15 Mirrors 0 Missed 79 Current 346 (15% match, 82% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 354 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1125 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1127 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_fetch)
NOTE: Running task 1157 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_fetch)
NOTE: Running task 1158 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1159 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1161 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1162 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1163 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_fetch)
NOTE: Running task 1165 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 1166 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1167 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 1168 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 1169 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1170 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1171 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1173 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: Running task 1224 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_fetch)
NOTE: Running task 1225 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_fetch)
NOTE: Running task 1227 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_fetch)
NOTE: Running task 1228 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: Running task 1402 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_unpack)
NOTE: Running task 1403 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: Running task 1404 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1405 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_unpack)
NOTE: Running task 1406 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1407 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: Running task 1408 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1409 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1410 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1411 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1412 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_unpack)
NOTE: Running task 1413 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 1414 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1415 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 1416 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 1417 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1418 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1419 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1420 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 1421 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1422 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1423 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1424 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1425 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1426 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pytz/2022.4-r0/temp/log.do_packagedata_setscene.967358
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Started
NOTE: Running setscene task 437 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_package_setscene)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/38.0.1-r0/temp/log.do_packagedata_setscene.967359
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running setscene task 438 of 440 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_package_setscene)
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: Running task 1427 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-38.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1430 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1431 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1432 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1433 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_patch)
NOTE: Running task 1434 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 1435 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1436 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_patch)
NOTE: Running task 1437 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: Running task 1438 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1439 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: Running task 1440 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: Running task 1441 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1442 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1443 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1444 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1445 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1446 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: Running task 1447 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: Running task 1448 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: Running task 1449 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_unpack)
NOTE: Running task 1450 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_unpack)
NOTE: Running task 1451 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_unpack)
NOTE: Running task 1452 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: Running task 1453 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: Running task 1455 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1456 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1457 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1458 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.28.1-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1460 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1461 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1462 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1463 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1464 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1465 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: Running task 1466 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1467 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1468 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1469 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1470 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1471 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1472 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_patch)
NOTE: Running task 1473 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-chardet-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1474 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1475 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: Running task 1476 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_configure)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_lic unihash changed to 8d7734ac262a902adfb614e2286f414be5b75a4139ff76ebb4e7a0b99dd0ef94
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Running task 1477 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure)
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1478 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1479 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1481 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: Running task 1482 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_compile)
NOTE: Running task 1483 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: Running task 1484 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1485 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: Running task 1486 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_configure)
NOTE: Running task 1487 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: Running task 1488 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Started
NOTE: Running task 1489 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: Running task 1490 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Started
NOTE: Running task 1491 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: Running task 1492 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1493 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Started
NOTE: Running task 1494 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1495 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: Running task 1496 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1498 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-requests-2.28.1-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1501 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: Running task 1502 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1503 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1505 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 1506 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: Running task 1507 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1508 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1509 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-cryptography-38.0.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1510 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile)
NOTE: recipe python3-chardet-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1525 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: Running task 1527 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: Running task 1528 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1529 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1538 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: Running task 1539 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1542 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: Running task 1545 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.4.bb:do_packagedata)
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_compile)
NOTE: Running task 1547 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_compile)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 1548 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-38.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2022.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1549 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_install)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1552 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1553 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: Running task 1555 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: Running task 1556 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1557 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-requests-2.28.1-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1558 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1559 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: Running task 1561 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_compile_ptest_base)
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Started
NOTE: Running task 1562 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: Running task 1563 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1564 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: Running task 1565 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1566 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: Running task 1567 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: Running task 1568 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_install)
NOTE: Running task 1570 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1571 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: Running task 1572 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-requests-2.28.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1573 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1574 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Started
NOTE: Running task 1575 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: Running task 1576 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: Running task 1577 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: Running task 1579 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1580 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 1581 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1582 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_install: Succeeded
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Started
NOTE: Running task 1583 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: Running task 1584 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_package)
NOTE: recipe python3-chardet-5.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: Running task 1585 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_install)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1586 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Started
NOTE: Running task 1587 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_package)
NOTE: Running task 1588 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_populate_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package)
NOTE: Running task 1590 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1591 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Started
NOTE: Running task 1592 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: Running task 1593 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: Running task 1595 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1596 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_packagedata)
NOTE: Running task 1597 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-chardet-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1598 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Started
NOTE: Running task 1599 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1600 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Started
NOTE: Running task 1601 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 1602 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 1603 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: Running task 1604 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1605 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1606 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-urllib3-1.26.12-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1607 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Started
NOTE: Running task 1608 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1609 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_packagedata)
NOTE: Running task 1610 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1611 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package_write_rpm)
NOTE: Running task 1612 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_package: Succeeded
NOTE: Running task 1613 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: Running task 1614 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1615 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: Running task 1616 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_configure: Succeeded
NOTE: Running task 1617 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1618 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package_write_rpm)
NOTE: Running task 1619 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1620 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1621 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package_write_rpm)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1622 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Started
NOTE: Running task 1623 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_package: Succeeded
NOTE: Running task 1624 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1625 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Succeeded
NOTE: Running task 1626 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_compile: Succeeded
NOTE: Running task 1627 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_install)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_install: Succeeded
NOTE: Running task 1628 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_package)
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package: Succeeded
NOTE: Running task 1629 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package: Succeeded
NOTE: Running task 1630 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata)
NOTE: Running task 1631 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_packagedata)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1632 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_package_write_rpm)
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1633 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_write_rpm)
NOTE: Running task 1634 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_package_qa)
NOTE: Running task 1635 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.1.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.28.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-5.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1636 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1636 tasks of which 1408 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-src went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dbg went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-ptest went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-staticdev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-dev went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-doc went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz-locale went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytz went backwards which would break package feeds (from 0:2022.6-r0 to 0:2022.4-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-pytz-2022.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:38.0.2-r0 to 0:38.0.1-r0) [version-going-backwards]
ERROR: python3-cryptography-38.0.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4757422270580767078==--

