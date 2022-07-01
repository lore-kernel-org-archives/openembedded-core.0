Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8FCC2BBE8
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.39378.1656687062517298481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Bu0n04c/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010181ba3e6e06-d7a6b04d-09b0-4c0c-95d8-13d89ac21658-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KO6nUPYHxbLr6T29ulEd6RRv4HW0ciDZxLDpnAUMq/M=;
	b=Bu0n04c/rnSAdH6waWshLpt9yTzeURhwXWeGeK3eBssobl0IWUl1CENzHOdZfmfg
	AWDMJP46pMmiKo30Qfd5DUVG0c4MOWus+lXJq40RSxZaghwTwSBkBVc4emHKLNk7TKX
	AMxp1xsCGhALWtv0F4Fh2rBBUda+4+IZfVVPj0xY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KO6nUPYHxbLr6T29ulEd6RRv4HW0ciDZxLDpnAUMq/M=;
	b=bOThUcCfloNis/g/wwmdl5L7Jk2sh19/OfARtKCCedTCY/ZrjCBsFYiX402BOdHk
	YwAIt3CGWpW427Ud19sglTEoKZuD2rYk1c9cywowGGoQ7F4/Om9BivBoJ0v3EMkMrW3
	AKwaCBYlH0isAZVgNhcEs30wcj6Gc3MdFQ5awg8U=
Content-Type: multipart/mixed; boundary="===============3702230766503490163=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 5.0.2 SUCCEEDED
Message-ID: 
 <01010181ba3e6e06-d7a6b04d-09b0-4c0c-95d8-13d89ac21658-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167491

--===============3702230766503490163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *5.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-5.0.0-5.0.2.patch
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
--===============3702230766503490163==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-5.0.0-5.0.2.patch"

From b8d31be1885c1656c2cd56b11c71476eeb2bfa04 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 09:04:47 +0000
Subject: [PATCH] python3-sphinx: upgrade 5.0.0 -> 5.0.2

---
 .../python/{python3-sphinx_5.0.0.bb => python3-sphinx_5.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_5.0.0.bb => python3-sphinx_5.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_5.0.0.bb b/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_5.0.2.bb
index 93edd9db7e..46cc26e67e 100644
--- a/meta/recipes-devtools/python/python3-sphinx_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72c536e78c21c567311b193fe00cd253"
 
 PYPI_PACKAGE = "Sphinx"
 
-SRC_URI[sha256sum] = "464d9c1bd5613bcebe76b46658763f3f3dbb184da7406e632a84596d3cd8ee90"
+SRC_URI[sha256sum] = "b18e978ea7565720f26019c702cd85c84376e948370f1cd43d60265010e1c7b0"
 
 inherit setuptools3 pypi
 
-- 
2.31.1


--===============3702230766503490163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2ba767acf272589902762953c6ec9d8a05348352"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ba767acf272589902762953c6ec9d8a05348352"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 5 Mirrors 0 Missed 60 Current 373 (7% match, 86% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1165 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_fetch)
NOTE: Running task 1168 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1169 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1170 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_fetch)
NOTE: Running task 1171 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 1172 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1174 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_fetch)
NOTE: Running task 1175 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 1176 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1177 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 1178 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1180 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_fetch)
NOTE: Running task 1181 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1478 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1480 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1481 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_unpack)
NOTE: Running task 1483 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1484 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1485 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_unpack)
NOTE: Running task 1486 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 1487 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1488 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_unpack)
NOTE: Running task 1489 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 1490 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1491 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 1492 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1493 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_unpack)
NOTE: Running task 1494 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1495 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1496 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1497 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1498 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: Running task 1499 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: Running task 1500 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1501 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1502 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1503 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: Running task 1504 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1505 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1506 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_patch)
NOTE: Running task 1507 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1508 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_patch)
NOTE: Running task 1509 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1510 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: Running task 1511 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1512 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1513 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Succeeded
NOTE: Running task 1514 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1515 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1516 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_patch)
NOTE: Running task 1517 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: Running task 1518 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: Running task 1519 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: Running task 1520 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1521 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1522 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Started
NOTE: Running task 1523 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1524 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1525 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1526 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1527 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1528 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1529 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1530 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1531 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1532 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1533 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1534 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1535 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: Running task 1536 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1537 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1538 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1539 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1540 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: Running task 1541 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1542 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1543 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 1544 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic unihash changed to 2124b1f70c02697ca3288a70fc5280240c1c0aca7a100fb919a805d8f090da6d
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1545 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1546 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1548 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_configure)
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1549 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1551 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: Running task 1552 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: Running task 1553 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: Running task 1554 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1555 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_compile)
NOTE: Running task 1556 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1557 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Started
NOTE: Running task 1558 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1559 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: Running task 1560 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1561 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1563 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: Running task 1564 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: Running task 1565 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1567 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1568 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1570 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1571 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1574 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1575 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: Running task 1576 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1577 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1578 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1579 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Succeeded
NOTE: Running task 1580 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Started
NOTE: Running task 1581 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1582 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1584 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: Running task 1585 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1586 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1587 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_package)
NOTE: Running task 1588 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1589 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1590 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_install)
NOTE: Running task 1591 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Started
NOTE: Running task 1592 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: Running task 1593 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: Running task 1594 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1595 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: Running task 1597 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1598 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Succeeded
NOTE: Running task 1599 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1602 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1603 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1604 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1605 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Failed
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1605 tasks of which 1464 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-requests/2.28.0-r0/temp/log.do_packagedata.3497624
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata) failed with exit code '1'

--===============3702230766503490163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 5.0.0 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-sphinx: PV changed from "5.0.0" to "5.0.2"
packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-5.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-5.0.2.tar.gz"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 5.0.0 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "5.0.0" to "5.0.2"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 5.0.0 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "5.0.0" to "5.0.2"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 5.0.0 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "5.0.0" to "5.0.2"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 5.0.0 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "5.0.0" to "5.0.2"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 5.0.0 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "5.0.0" to "5.0.2"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 5.0.0 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "5.0.0" to "5.0.2"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 5.0.0 [default] to 5.0.2 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "5.0.0" to "5.0.2"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 13816540 to 13819288 (+0%)
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Sphinx-5.0.0.dist-info -> /usr/lib/python3.10/site-packages/Sphinx-5.0.2.dist-info, removed "/usr/lib/python3.10/site-packages/sphinx/themes/pyramid/static/epub.css /usr/lib/python3.10/site-packages/sphinx/themes/nonav/static/nonav.css", added "/usr/lib/python3.10/site-packages/sphinx/themes/nonav/static/nonav.css_t /usr/lib/python3.10/site-packages/sphinx/themes/pyramid/static/epub.css_t"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.10/site-packages/Sphinx-5.0.0.dist-info moved to /usr/lib/python3.10/site-packages/Sphinx-5.0.2.dist-info
  /usr/lib/python3.10/site-packages/sphinx/themes/nonav/static/nonav.css_t was added
  /usr/lib/python3.10/site-packages/sphinx/themes/pyramid/static/epub.css_t was added
  /usr/lib/python3.10/site-packages/sphinx/themes/nonav/static/nonav.css was removed
  /usr/lib/python3.10/site-packages/sphinx/themes/pyramid/static/epub.css was removed

--===============3702230766503490163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1656 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2ba767acf272589902762953c6ec9d8a05348352"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ba767acf272589902762953c6ec9d8a05348352"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 5 Mirrors 0 Missed 60 Current 373 (7% match, 86% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1165 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_fetch)
NOTE: Running task 1169 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_fetch)
NOTE: Running task 1170 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 1171 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1173 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 1174 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1175 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_fetch)
NOTE: Running task 1176 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1177 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_fetch)
NOTE: Running task 1178 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1179 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 1180 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1181 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1477 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1480 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1481 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_unpack)
NOTE: Running task 1483 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_unpack)
NOTE: Running task 1484 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 1485 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1486 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 1487 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1488 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_unpack)
NOTE: Running task 1489 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1490 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_unpack)
NOTE: Running task 1491 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1492 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 1493 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1494 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1495 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1496 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1497 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1498 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1499 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1500 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1501 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Started
NOTE: Running task 1502 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1503 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1505 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_patch)
NOTE: Running task 1506 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1507 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1508 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1509 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: Running task 1510 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1511 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1512 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_patch)
NOTE: Running task 1513 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1514 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1515 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1516 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1517 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_patch)
NOTE: Running task 1518 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1519 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: Running task 1520 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Started
NOTE: Running task 1521 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1522 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1523 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: Running task 1524 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1525 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1526 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1528 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1529 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1530 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1531 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1532 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1534 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1535 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1536 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_configure)
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1537 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1538 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1539 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1540 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic unihash changed to 2124b1f70c02697ca3288a70fc5280240c1c0aca7a100fb919a805d8f090da6d
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Started
NOTE: Running task 1541 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1542 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_configure)
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1543 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_configure)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1544 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: Running task 1545 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Running task 1548 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Started
NOTE: Running task 1549 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: Running task 1551 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Started
NOTE: Running task 1552 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1553 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Started
NOTE: Running task 1554 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1555 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: Running task 1556 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: Running task 1557 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_compile)
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: Running task 1559 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1560 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1561 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: Running task 1563 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: Running task 1564 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1565 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1567 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: Running task 1568 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: Running task 1570 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1571 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1572 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1573 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1574 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Succeeded
NOTE: Running task 1575 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_install)
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 1576 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1577 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: Running task 1579 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: Running task 1581 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: Running task 1582 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1583 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1584 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1585 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1586 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1587 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Started
NOTE: Running task 1588 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1589 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1590 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1591 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1592 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Started
NOTE: Running task 1593 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_package)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1594 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: Running task 1596 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: Running task 1597 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1598 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Succeeded
NOTE: Running task 1599 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 1600 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1601 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1602 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1603 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1603 tasks of which 1464 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-requests/2.28.0-r0/temp/log.do_packagedata.3460250
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata) failed with exit code '1'

--===============3702230766503490163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1655 targets, 49 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-32 sysroot...done.
Removing 62 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2ba767acf272589902762953c6ec9d8a05348352"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ba767acf272589902762953c6ec9d8a05348352"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 264 Local 204 Mirrors 0 Missed 60 Current 190 (77% match, 86% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running task 819 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 820 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_fetch)
NOTE: Running task 821 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 822 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 823 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 824 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_fetch)
NOTE: Running task 825 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 826 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_fetch)
NOTE: Running task 827 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 828 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_fetch)
NOTE: Running task 829 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 830 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 831 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 832 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: recipe python3-pygments-2.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyparsing-3.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 889 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_unpack)
NOTE: Running task 890 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 891 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 892 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 893 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 894 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_unpack)
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 895 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 896 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_unpack)
NOTE: Running task 897 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 898 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_unpack)
NOTE: Running task 899 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 900 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 901 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 902 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: recipe python3-pygments-2.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package_setscene)
NOTE: recipe python3-pytz-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyparsing-3.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-5.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-ndg-httpsclient-0.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyasn1_0.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 905 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 912 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_patch)
NOTE: Running task 917 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 919 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 920 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 921 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_patch)
NOTE: Running task 922 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 923 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_patch)
NOTE: Running task 924 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: Running task 925 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_patch)
NOTE: Running task 926 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: Running task 927 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 928 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 960 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-22.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 304 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 973 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 978 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 979 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 980 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic)
NOTE: Running task 985 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Succeeded
NOTE: Running task 986 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 987 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 988 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: Running task 989 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 990 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 991 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 992 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: Running task 993 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 994 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 995 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-37.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-37.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 325 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic unihash changed to 2124b1f70c02697ca3288a70fc5280240c1c0aca7a100fb919a805d8f090da6d
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.60.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 341 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-21.3-r0: task do_package_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-21.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 349 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 350 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 400 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 409 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 429 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 438 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1394 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1434 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1447 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1448 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1449 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1451 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1454 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1456 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1457 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1458 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1591 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1594 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_configure)
NOTE: Running task 1595 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: Running task 1596 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: Running task 1597 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1598 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1599 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1600 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_configure)
NOTE: Running task 1601 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: Running task 1602 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_configure)
NOTE: Running task 1603 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1604 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: Running task 1605 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 1606 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: Running task 1607 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1608 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_compile)
NOTE: Running task 1609 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1610 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Succeeded
NOTE: Running task 1611 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1612 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_compile)
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 1613 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1614 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_compile)
NOTE: Running task 1615 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1616 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_compile)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1617 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: Running task 1618 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: Running task 1619 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: Running task 1620 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Started
NOTE: Running task 1621 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1622 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1623 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: Running task 1624 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1625 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1626 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 1627 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1628 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1629 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1630 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_install)
NOTE: Running task 1631 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1632 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1633 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1634 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: Running task 1635 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Started
NOTE: Running task 1636 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1637 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: Running task 1638 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1639 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1640 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1641 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1642 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1643 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: Running task 1644 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: Running task 1645 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1646 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1647 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Succeeded
NOTE: Running task 1648 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1649 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_packagedata)
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: Running task 1650 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: Running task 1651 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1652 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package_write_rpm)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: Running task 1653 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Succeeded
NOTE: Running task 1654 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: Running task 1655 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1656 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1657 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 1658 of 1682 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1658 tasks of which 1520 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-requests/2.28.0-r0/temp/log.do_packagedata.3514877
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata) failed with exit code '1'

--===============3702230766503490163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2ba767acf272589902762953c6ec9d8a05348352"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ba767acf272589902762953c6ec9d8a05348352"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 5 Mirrors 0 Missed 60 Current 373 (7% match, 86% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1165 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_fetch)
NOTE: Running task 1168 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_fetch)
NOTE: Running task 1169 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1170 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1171 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_fetch)
NOTE: Running task 1172 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1174 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 1175 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 1176 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 1178 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1179 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1180 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1181 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_fetch)
NOTE: Running task 1478 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1480 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1481 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_unpack)
NOTE: Running task 1483 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_unpack)
NOTE: Running task 1484 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1485 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1486 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_unpack)
NOTE: Running task 1487 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1488 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 1489 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 1490 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 1491 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1492 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1493 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1494 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_unpack)
NOTE: Running task 1495 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1496 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1497 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1498 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1499 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1500 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1501 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 1502 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: Running task 1503 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1504 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1505 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1506 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_patch)
NOTE: Running task 1507 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1508 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: Running task 1509 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: Running task 1510 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1511 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1512 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_patch)
NOTE: Running task 1513 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1514 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_patch)
NOTE: Running task 1515 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1516 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1517 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1518 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1519 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: Running task 1520 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_patch)
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1521 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1522 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1523 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1524 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1525 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1526 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1527 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1529 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic)
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1530 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1531 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1533 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1534 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1535 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1536 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Started
NOTE: Running task 1537 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1538 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: Running task 1539 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1540 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1541 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: Running task 1542 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_configure)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic unihash changed to 2124b1f70c02697ca3288a70fc5280240c1c0aca7a100fb919a805d8f090da6d
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: Running task 1543 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Started
NOTE: Running task 1545 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1546 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1547 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1548 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1549 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1551 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Started
NOTE: Running task 1552 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: Running task 1553 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: Running task 1554 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1555 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: Running task 1556 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_compile)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 1557 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: Running task 1558 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: Running task 1559 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1560 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1561 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Succeeded
NOTE: Running task 1563 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: Running task 1564 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_compile)
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Started
NOTE: Running task 1565 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: Running task 1567 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: Running task 1568 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1570 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1571 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1573 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_install)
NOTE: Running task 1574 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package)
NOTE: Running task 1575 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1576 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Started
NOTE: Running task 1577 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Started
NOTE: Running task 1578 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1579 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_install)
NOTE: Running task 1580 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: Running task 1581 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1582 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1583 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1584 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1585 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1586 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1587 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1588 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Started
NOTE: Running task 1589 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1590 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1591 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_package)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Started
NOTE: Running task 1592 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: Running task 1593 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1595 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1596 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: Running task 1597 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1598 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: Running task 1599 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 1601 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1602 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1603 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1603 tasks of which 1464 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-requests/2.28.0-r0/temp/log.do_packagedata.3484617
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata) failed with exit code '1'

--===============3702230766503490163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-2ba767acf272589902762953c6ec9d8a05348352"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ba767acf272589902762953c6ec9d8a05348352"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 5 Mirrors 0 Missed 60 Current 373 (7% match, 86% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1120 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1165 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_fetch)
NOTE: Running task 1168 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_fetch)
NOTE: Running task 1170 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1171 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1172 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_fetch)
NOTE: Running task 1173 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_fetch)
NOTE: Running task 1174 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_fetch)
NOTE: Running task 1175 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_fetch)
NOTE: Running task 1177 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1178 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1179 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1180 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_fetch)
NOTE: Running task 1181 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_fetch)
NOTE: Running task 1477 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_package_write_rpm)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1480 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1481 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1482 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_unpack)
NOTE: Running task 1483 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_unpack)
NOTE: Running task 1484 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1485 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1486 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_unpack)
NOTE: Running task 1487 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_unpack)
NOTE: Running task 1488 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_unpack)
NOTE: Running task 1489 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_unpack)
NOTE: Running task 1490 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1491 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1492 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1493 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_unpack)
NOTE: Running task 1494 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_unpack)
NOTE: Running task 1495 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1496 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1497 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1498 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1499 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1500 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1501 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1502 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Started
NOTE: Running task 1503 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Started
NOTE: Running task 1504 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Started
NOTE: Running task 1505 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1506 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1507 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1508 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: recipe python3-requests-2.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 1509 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1510 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1511 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1512 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_patch)
NOTE: Running task 1513 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1514 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1515 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_patch)
NOTE: Running task 1516 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_patch)
NOTE: Running task 1517 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_patch)
NOTE: recipe python3-docutils-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1518 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1519 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_patch)
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: Running task 1520 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Started
NOTE: Running task 1521 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_patch)
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1522 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1523 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1524 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1525 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1526 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1527 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1529 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1530 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Started
NOTE: Running task 1531 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-packaging-21.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_patch: Succeeded
NOTE: Running task 1532 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1533 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1534 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1535 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1536 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1537 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_populate_lic unihash changed to 2124b1f70c02697ca3288a70fc5280240c1c0aca7a100fb919a805d8f090da6d
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1538 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_configure)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1539 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_configure)
NOTE: Running task 1540 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: Running task 1541 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-babel-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1542 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_configure)
NOTE: Running task 1543 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1544 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_configure)
NOTE: Running task 1545 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_configure)
NOTE: Running task 1546 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1547 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1548 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 1549 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: Running task 1550 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1551 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_configure)
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1552 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_compile)
NOTE: Running task 1554 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1555 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: Running task 1556 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-babel-2.10.3-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Started
NOTE: Running task 1557 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Started
NOTE: Running task 1558 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_compile)
NOTE: Running task 1559 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_compile)
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 1560 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: Running task 1561 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_compile)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Started
NOTE: Running task 1562 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: Running task 1563 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_compile)
NOTE: Running task 1564 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_compile)
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Started
NOTE: Running task 1565 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1566 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1567 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_compile: Succeeded
NOTE: Running task 1568 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1569 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Started
NOTE: Running task 1570 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_install)
NOTE: Running task 1573 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1574 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Started
NOTE: Running task 1575 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: Running task 1576 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1577 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Started
NOTE: Running task 1578 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package)
NOTE: recipe python3-requests-2.28.0-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: Running task 1579 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1580 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_install)
NOTE: Running task 1581 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1582 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1583 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_package)
NOTE: Running task 1584 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1585 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1586 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: Running task 1587 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1588 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1589 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.0.2.bb:do_install)
NOTE: Running task 1590 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1591 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-docutils-0.18.1-r0: task do_install: Succeeded
NOTE: Running task 1592 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.18.1.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package: Succeeded
NOTE: Running task 1593 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_packagedata)
NOTE: Running task 1594 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1595 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Started
NOTE: Running task 1596 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1597 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.3.0.bb:do_package_write_rpm)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1598 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.12.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_compile: Succeeded
NOTE: Running task 1599 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: Running task 1600 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.10.3.bb:do_install)
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1601 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.28.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Started
NOTE: Running task 1602 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Started
NOTE: Running task 1603 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 1604 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.0.bb:do_packagedata)
NOTE: Running task 1605 of 1626 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-5.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.28.0-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.10.3-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.18.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1605 tasks of which 1464 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-src went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dbg went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-staticdev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-dev went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-doc went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests-locale went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: QA Issue: Package version for package python3-requests went backwards which would break package feeds (from 0:2.28.1-r0 to 0:2.28.0-r0) [version-going-backwards]
ERROR: python3-requests-2.28.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-requests/2.28.0-r0/temp/log.do_packagedata.3472945
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.28.0.bb:do_packagedata) failed with exit code '1'

--===============3702230766503490163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Sphinx-5.0.0.dist-info -> /usr/lib/python3.10/site-packages/Sphinx-5.0.2.dist-info, removed "/usr/lib/python3.10/site-packages/sphinx/themes/pyramid/static/epub.css /usr/lib/python3.10/site-packages/sphinx/themes/nonav/static/nonav.css", added "/usr/lib/python3.10/site-packages/sphinx/themes/pyramid/static/epub.css_t /usr/lib/python3.10/site-packages/sphinx/themes/nonav/static/nonav.css_t"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.10/site-packages/Sphinx-5.0.0.dist-info moved to /usr/lib/python3.10/site-packages/Sphinx-5.0.2.dist-info
  /usr/lib/python3.10/site-packages/sphinx/themes/nonav/static/nonav.css_t was added
  /usr/lib/python3.10/site-packages/sphinx/themes/pyramid/static/epub.css_t was added
  /usr/lib/python3.10/site-packages/sphinx/themes/nonav/static/nonav.css was removed
  /usr/lib/python3.10/site-packages/sphinx/themes/pyramid/static/epub.css was removed

--===============3702230766503490163==--

