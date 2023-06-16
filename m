Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AA7C25B7B
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.807.1686887482858698740
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eguGWJtH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188c254469c-9148108c-150f-4a8c-aa61-9f5b802fffda-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OEE+OimrehOGQxm5jMSEuwCMxvaa+yIIGASjVETddIQ=;
	b=eguGWJtHZE6m5cZ/oMbVC4zrCqBkTVNO2RQaxMhCMKyfMLXR6N1fgCxpRJ6szLCl
	xpk7eLljnVf7PpSYJRFrBp7ufxfUgVmNw3R2A0jldjFaz14R1XIkfYAAy5y34F63QlP
	m3sHlvuV3WGBZzKuQtp6SUBMVqT0bB5ZJKTwnhAQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OEE+OimrehOGQxm5jMSEuwCMxvaa+yIIGASjVETddIQ=;
	b=Vx6t+IjqCo+7cYvmm6WB+F6cz3WjaDzRo8RXV6bDXk9fNmP3nIq1WDLhbfZWF5+a
	m2n5K5wmpvwQGqce9GCi1PFkvxmyo/OU0a5G8bvO/stTJmjKhgzSnerpm2C1uOgL0xM
	IK6UNeiYcHNXlDuMLdisBDPodIqpR33RIX4Q97c4=
Content-Type: multipart/mixed; boundary="===============7987948273783462178=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-rtd-theme: upgrading to 1.2.2 SUCCEEDED
Message-ID: <01010188c254469c-9148108c-150f-4a8c-aa61-9f5b802fffda-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182932

--===============7987948273783462178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx-rtd-theme* to *1.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-rtd-theme-upgrade-1.2.1-1.2.2.patch
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
From 1d56ef6967834a164ae80301697552218903895b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 14:02:06 +0000
Subject: [PATCH] python3-sphinx-rtd-theme: upgrade 1.2.1 -> 1.2.2

---
 ...inx-rtd-theme_1.2.1.bb => python3-sphinx-rtd-theme_1.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_1.2.1.bb => python3-sphinx-rtd-theme_1.2.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.1.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb
index 25de0159b6..0fac83a1c9 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "cf9a7dc0352cf179c538891cb28d6fad6391117d4e21c891776ab41dd6c8ff70"
+SRC_URI[sha256sum] = "01c5c5a72e2d025bd23d1f06c59a4831b06e6ce6c01fdd5ebfe9986c0a880fc7"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.39.2


--===============7987948273783462178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d4b812ee7dacce74dfe08b5b0feab7a44f1c0c63"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 9 Mirrors 0 Missed 56 Current 386 (13% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_fetch)
NOTE: Running task 1128 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1142 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1210 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1211 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1212 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1213 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1214 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1215 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1216 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1217 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1218 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1219 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1220 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1221 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1222 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: Running task 1396 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1397 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_unpack)
NOTE: Running task 1399 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1400 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1401 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1403 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1404 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1405 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1406 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1407 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1408 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1409 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1410 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1411 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1412 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1413 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1414 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1415 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1416 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1418 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: Running task 1419 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: Running task 1420 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: Running task 1421 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: Running task 1422 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: Running task 1423 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_patch)
NOTE: Running task 1424 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1425 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1426 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1427 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: Running task 1428 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1429 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 1430 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1431 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1432 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1433 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1434 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1435 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1436 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1437 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1438 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1439 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: Running task 1440 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1441 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1442 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: Running task 1443 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1444 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1445 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1446 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1447 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1448 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1449 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1452 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1453 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1454 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1455 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1456 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1457 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1458 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1459 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Started
NOTE: Running task 1460 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1461 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1462 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1463 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic unihash changed to dccf4e1c668790bee412194ccbb3d6a8429a60b6c9236899d00081be33c7cd7f
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1464 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1465 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1466 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: Running task 1467 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1468 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1470 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1471 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1472 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Started
NOTE: Running task 1473 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: Running task 1474 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1476 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: Running task 1477 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: Running task 1478 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1479 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: Running task 1480 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_compile)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1481 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: Running task 1482 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1483 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1484 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: Running task 1485 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: Running task 1486 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: Running task 1487 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: Running task 1488 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1489 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1490 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: Running task 1491 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: Running task 1492 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: Running task 1494 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: Running task 1495 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_install)
NOTE: Running task 1498 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: Running task 1499 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1500 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1502 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1503 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1504 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1505 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: Running task 1506 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1507 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1508 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: Running task 1509 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 1510 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_package)
NOTE: Running task 1514 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: Running task 1515 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 1516 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: Running task 1517 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1519 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Started
NOTE: Running task 1520 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1521 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1525 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1526 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: Running task 1528 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1530 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: Running task 1531 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 1532 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1534 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1535 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1537 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 1538 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_create_spdx)
NOTE: Running task 1540 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: Running task 1541 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1542 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1543 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: Running task 1544 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1544 tasks of which 1379 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-docutils/0.19-r0/temp/log.do_packagedata.279538
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'

--===============7987948273783462178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx-rtd-theme: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-1.2.1.tar.gz;downloadfilename=sphinx_rtd_theme-1.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-1.2.2.tar.gz;downloadfilename=sphinx_rtd_theme-1.2.2.tar.gz"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dbg: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-dev: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-doc: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-locale: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-src: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme-staticdev: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-sphinx-rtd-theme/python3-sphinx-rtd-theme: PKGSIZE changed from 3616395 to 3616442 (+0%)
Changes to packages/core2-32-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.11/site-packages/sphinx_rtd_theme-1.2.1.dist-info moved to /usr/lib/python3.11/site-packages/sphinx_rtd_theme-1.2.2.dist-info

--===============7987948273783462178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d4b812ee7dacce74dfe08b5b0feab7a44f1c0c63"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 9 Mirrors 0 Missed 56 Current 386 (13% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_fetch)
NOTE: Running task 1128 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1142 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1209 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1210 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1212 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1213 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1214 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1215 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1216 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1217 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1218 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1219 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1220 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1221 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1222 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1397 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: Running task 1398 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_unpack)
NOTE: Running task 1399 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1400 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1401 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1402 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1403 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1404 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1405 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1406 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1407 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1408 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1409 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1410 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1411 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1412 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1413 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1414 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1415 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1416 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1418 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1419 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Started
NOTE: Running task 1420 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1421 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1422 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: Running task 1423 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: Running task 1424 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1425 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1426 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1427 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1428 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_patch)
NOTE: Running task 1430 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1431 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: Running task 1432 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1433 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1434 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1435 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1436 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1438 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1439 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1440 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: Running task 1441 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1442 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Started
NOTE: Running task 1443 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1444 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: Running task 1445 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: Running task 1446 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1447 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1448 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1449 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1450 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1451 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1454 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1455 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1456 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 1457 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1458 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1459 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1460 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1461 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1462 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1463 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic unihash changed to dccf4e1c668790bee412194ccbb3d6a8429a60b6c9236899d00081be33c7cd7f
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1464 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1465 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1466 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: Running task 1467 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1468 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: Running task 1469 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1470 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Started
NOTE: Running task 1471 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1472 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Running task 1473 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1474 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1475 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: Running task 1476 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: Running task 1477 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1478 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: Running task 1479 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: Running task 1480 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: Running task 1481 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: Running task 1482 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: Running task 1483 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: Running task 1484 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1486 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: Running task 1487 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1488 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: Running task 1489 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1490 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1491 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: Running task 1492 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: Running task 1494 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: Running task 1495 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_install)
NOTE: Running task 1498 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: Running task 1499 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1500 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1501 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1502 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1503 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1504 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1505 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1506 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: Running task 1507 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: Running task 1508 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1509 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: Running task 1512 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_package)
NOTE: Running task 1514 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 1515 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: Running task 1516 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: Running task 1517 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1519 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1520 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1521 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1525 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: Running task 1526 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: Running task 1529 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1530 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: Running task 1531 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: Running task 1532 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 1533 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1535 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: Running task 1536 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: Running task 1537 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: Running task 1538 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1539 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1540 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: Running task 1541 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1542 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1543 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: Running task 1544 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1544 tasks of which 1379 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-docutils/0.19-r0/temp/log.do_packagedata.359703
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'

--===============7987948273783462178==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-rtd-theme-upgrade-1.2.1-1.2.2.patch"

RnJvbSAxZDU2ZWY2OTY3ODM0YTE2NGFlODAzMDE2OTc1NTIyMTg5MDM4OTViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTQ6MDI6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueC1ydGQtdGhlbWU6IHVwZ3JhZGUgMS4yLjEgLT4gMS4yLjIKCi0tLQogLi4u
aW54LXJ0ZC10aGVtZV8xLjIuMS5iYiA9PiBweXRob24zLXNwaGlueC1ydGQtdGhlbWVfMS4yLjIu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhpbngtcnRk
LXRoZW1lXzEuMi4xLmJiID0+IHB5dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8xLjIuMi5iYn0gKDg4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3Bo
aW54LXJ0ZC10aGVtZV8xLjIuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zcGhpbngtcnRkLXRoZW1lXzEuMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbngtcnRkLXRo
ZW1lXzEuMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc3BoaW54LXJ0ZC10aGVtZV8xLjIuMi5iYgppbmRleCAyNWRlMDE1OWI2Li4wZmFjODNhMWM5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
LXJ0ZC10aGVtZV8xLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc3BoaW54LXJ0ZC10aGVtZV8xLjIuMi5iYgpAQCAtMTMsNyArMTMsNyBAQCBSREVQRU5E
Uzoke1BOfSArPSAiIFwKIAogUFlQSV9QQUNLQUdFID0gInNwaGlueF9ydGRfdGhlbWUiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJjZjlhN2RjMDM1MmNmMTc5YzUzODg5MWNiMjhkNmZhZDYzOTEx
MTdkNGUyMWM4OTE3NzZhYjQxZGQ2YzhmZjcwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAxYzVj
NWE3MmUyZDAyNWJkMjNkMWYwNmM1OWE0ODMxYjA2ZTZjZTZjMDFmZGQ1ZWJmZTk5ODZjMGE4ODBm
YzciCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA/PSAiL3NwaGlueC1ydGQtdGhlbWUvKD9QPHB2ZXI+
KFxkK1tcLlwtX10qKSspLyIKIAogaW5oZXJpdCBzZXR1cHRvb2xzMyBweXBpCi0tIAoyLjM5LjIK
Cg==

--===============7987948273783462178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d4b812ee7dacce74dfe08b5b0feab7a44f1c0c63"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 9 Mirrors 0 Missed 56 Current 386 (13% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_fetch)
NOTE: Running task 1128 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1142 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1209 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1210 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1211 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1212 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1213 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1214 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1215 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1216 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1218 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1219 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 1220 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1221 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1222 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: Running task 1396 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_unpack)
NOTE: Running task 1397 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: Running task 1398 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1399 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1400 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: Running task 1401 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1402 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1403 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1404 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1405 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1406 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1407 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1408 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1409 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1410 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1411 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1412 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1413 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1414 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1415 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1416 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Started
NOTE: Running task 1418 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: Running task 1419 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1420 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: Running task 1421 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1422 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1423 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: Running task 1424 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_patch)
NOTE: Running task 1425 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1426 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1427 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1428 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1429 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1430 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1431 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1432 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1433 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: Running task 1434 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1435 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1436 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1437 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1438 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: Running task 1439 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: Running task 1440 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1441 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: Running task 1442 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1443 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1444 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1445 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1447 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1448 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 1449 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1450 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1452 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1454 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1455 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1456 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1457 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1458 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1459 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1460 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1461 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1462 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1463 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic unihash changed to dccf4e1c668790bee412194ccbb3d6a8429a60b6c9236899d00081be33c7cd7f
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1464 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1465 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1466 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1467 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1468 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1469 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: Running task 1470 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1471 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1472 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1473 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1474 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: Running task 1475 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1476 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1477 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: Running task 1478 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1479 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: Running task 1480 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1481 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: Running task 1482 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: Running task 1483 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1484 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1486 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: Running task 1489 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 1490 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: Running task 1491 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: Running task 1493 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: Running task 1494 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: Running task 1495 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_install)
NOTE: Running task 1498 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: Running task 1499 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1500 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: Running task 1501 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1502 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1503 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: Running task 1504 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1505 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1506 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: Running task 1507 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Started
NOTE: Running task 1508 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1509 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: Running task 1513 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: Running task 1514 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: Running task 1515 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 1516 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: Running task 1518 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: Running task 1519 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1520 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: Running task 1521 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1522 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1523 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: Running task 1524 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1526 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1527 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: Running task 1529 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1530 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: Running task 1531 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: Running task 1533 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: Running task 1534 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1535 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1536 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1537 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: Running task 1538 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1539 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_create_spdx)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1540 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1541 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1542 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1543 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: Running task 1544 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1544 tasks of which 1379 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-docutils/0.19-r0/temp/log.do_packagedata.563344
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'

--===============7987948273783462178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-sphinx-rtd-theme (sysroot):
  /usr/lib/python3.11/site-packages/sphinx_rtd_theme-1.2.1.dist-info moved to /usr/lib/python3.11/site-packages/sphinx_rtd_theme-1.2.2.dist-info

--===============7987948273783462178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d4b812ee7dacce74dfe08b5b0feab7a44f1c0c63"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 9 Mirrors 0 Missed 56 Current 386 (13% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1127 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_fetch)
NOTE: Running task 1128 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 1142 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 1209 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 1210 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 1211 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 1212 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 1213 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: Running task 1215 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 1216 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 1217 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 1218 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 1219 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 1220 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 1221 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 1222 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: Running task 1396 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 1397 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 1398 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: Running task 1399 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: Running task 1400 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: Running task 1401 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 1402 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1403 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_unpack)
NOTE: Running task 1404 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1405 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1406 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: Running task 1407 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 1408 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: Running task 1409 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 1410 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1411 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 1412 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1413 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 1414 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: Running task 1415 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 1416 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1417 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1418 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: Running task 1419 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1420 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: Running task 1421 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 1422 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1423 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 1424 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: Running task 1425 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 1426 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1427 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1428 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_patch)
NOTE: Running task 1429 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1430 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 1431 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 1432 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: Running task 1433 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1434 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: Running task 1435 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 1436 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1437 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 1438 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: Running task 1439 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: Running task 1440 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: Running task 1441 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1442 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Started
NOTE: Running task 1443 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1444 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1445 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: Running task 1447 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: Running task 1448 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1449 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: Running task 1450 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1452 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1453 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1455 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1456 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1457 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: Running task 1458 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1459 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1460 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1461 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1462 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1463 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1464 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic unihash changed to dccf4e1c668790bee412194ccbb3d6a8429a60b6c9236899d00081be33c7cd7f
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1465 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1466 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: Running task 1467 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1468 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1469 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: Running task 1470 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1471 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1472 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: Running task 1473 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: Running task 1474 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1475 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: Running task 1476 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Started
NOTE: Running task 1477 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1478 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: Running task 1479 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: Running task 1483 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: Running task 1484 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: Running task 1485 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: Running task 1486 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: Running task 1489 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: Running task 1490 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Started
NOTE: Running task 1491 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1492 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1494 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1495 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1497 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_install)
NOTE: Running task 1498 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: Running task 1499 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1500 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1501 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1502 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: Running task 1503 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1504 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1505 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1506 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1507 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: Running task 1508 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1509 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_package)
NOTE: Running task 1512 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: Running task 1514 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_sysroot)
NOTE: Running task 1515 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1516 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Started
NOTE: Running task 1517 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: Running task 1518 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1519 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: Running task 1520 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1521 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1524 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: Running task 1525 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: Running task 1527 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1530 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: Running task 1531 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1533 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: Running task 1534 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1535 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Started
NOTE: Running task 1536 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: Running task 1537 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1538 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1539 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_create_spdx)
NOTE: Running task 1540 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: Running task 1541 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1542 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1543 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: Running task 1544 of 1553 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1544 tasks of which 1379 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-docutils/0.19-r0/temp/log.do_packagedata.446588
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'

--===============7987948273783462178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 37 recipes from the core2-32 sysroot...done.
Removing 52 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d4b812ee7dacce74dfe08b5b0feab7a44f1c0c63"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 238 Local 182 Mirrors 0 Missed 56 Current 208 (76% match, 87% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 209 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 268 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 779 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_fetch)
NOTE: Running task 780 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_fetch)
NOTE: Running task 783 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_fetch)
NOTE: Running task 792 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_fetch)
NOTE: Running task 793 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_fetch)
NOTE: Running task 794 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: Running task 795 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_fetch)
NOTE: Running task 796 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 797 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_fetch)
NOTE: Running task 798 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_fetch)
NOTE: Running task 799 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_fetch)
NOTE: Running task 800 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 801 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_fetch)
NOTE: Running task 802 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: Running task 803 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_fetch)
NOTE: Running task 804 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: Running task 859 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_unpack)
NOTE: Running task 860 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_unpack)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Started
NOTE: Running task 861 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_unpack)
NOTE: Running task 865 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_unpack)
NOTE: Running task 866 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_unpack)
NOTE: Running task 867 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 869 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_unpack)
NOTE: Running task 871 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_unpack)
NOTE: Running task 872 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_unpack)
NOTE: Running task 873 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: recipe python3-docutils-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 874 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_unpack)
NOTE: Running task 875 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running task 876 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_unpack)
NOTE: Running task 877 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_unpack)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 878 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_patch)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 297 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 879 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_patch)
NOTE: Running task 880 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_patch)
NOTE: Running task 881 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 882 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_patch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 883 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: Running task 884 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_patch)
NOTE: Running task 885 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_patch)
NOTE: Running task 886 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_patch)
NOTE: Running task 887 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_patch)
NOTE: Running task 888 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_patch)
NOTE: Running task 889 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.19-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Started
NOTE: Running task 890 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 304 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 891 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_patch)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 892 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-babel-2.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 893 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 894 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Started
NOTE: Running task 895 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_patch)
NOTE: Running task 896 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 900 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_patch: Succeeded
NOTE: Running setscene task 308 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 904 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: Running task 907 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 908 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 909 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 910 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_patch: Succeeded
NOTE: Running task 911 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 912 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 913 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Started
NOTE: recipe python3-docutils-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Started
NOTE: Running task 914 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 915 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 924 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 320 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 329 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: Running task 929 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_lic unihash changed to dccf4e1c668790bee412194ccbb3d6a8429a60b6c9236899d00081be33c7cd7f
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 940 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 443 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 446 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1329 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1335 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_collect_spdx_deps)
NOTE: Running task 1394 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1395 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1396 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1397 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1398 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1399 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1400 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1401 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1402 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1403 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1405 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1406 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1407 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1438 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1446 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure)
NOTE: Running task 1447 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1448 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1449 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_configure)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1450 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_configure)
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Started
NOTE: Running task 1453 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_configure)
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Started
NOTE: Running task 1454 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1455 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_configure)
NOTE: Running task 1456 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_configure)
NOTE: recipe python3-docutils-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Started
NOTE: Running task 1457 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1458 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1459 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: Running task 1460 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: Running task 1461 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1462 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_configure: Succeeded
NOTE: Running task 1463 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_compile)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1464 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_compile)
NOTE: Running task 1465 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_compile)
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Started
NOTE: Running task 1466 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 1467 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1468 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_configure: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: Running task 1471 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_compile)
NOTE: Running task 1472 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_compile)
NOTE: Running task 1473 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_compile)
NOTE: Running task 1474 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: Running task 1475 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_compile)
NOTE: Running task 1476 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: Running task 1477 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 1478 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1479 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.31.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_compile: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1480 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_install)
NOTE: Running task 1481 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_install)
NOTE: Running task 1482 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1483 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_install)
NOTE: Running task 1484 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: Running task 1485 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_install)
NOTE: Running task 1486 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_install)
NOTE: Running task 1487 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_install)
NOTE: Running task 1488 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: Running task 1489 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_install)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Started
NOTE: Running task 1490 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1491 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_install)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1492 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-docutils-0.19-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1494 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 1495 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_install: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_install: Succeeded
NOTE: Running task 1496 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: Running task 1497 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_package)
NOTE: Running task 1498 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: Running task 1500 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_populate_sysroot)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1501 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_package)
NOTE: Running task 1502 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_package)
NOTE: Running task 1503 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Started
NOTE: Running task 1504 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_package)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 1505 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Started
NOTE: Running task 1506 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Started
NOTE: Running task 1507 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_install: Succeeded
NOTE: Running task 1508 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_package)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Started
NOTE: Running task 1509 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_package)
NOTE: recipe python3-docutils-0.19-r0: task do_package: Started
NOTE: recipe python3-babel-2.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: Running task 1512 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_7.0.1.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1513 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-0.7.13-r0: task do_package: Succeeded
NOTE: Running task 1514 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 1515 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-alabaster_0.7.13.bb:do_packagedata)
NOTE: recipe python3-requests-2.31.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Started
NOTE: Running task 1516 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-requests_2.31.0.bb:do_packagedata)
NOTE: recipe python3-babel-2.12.1-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-babel_2.12.1.bb:do_package)
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Started
NOTE: Running task 1518 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1519 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_packagedata)
NOTE: recipe python3-alabaster-0.7.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.31.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 1520 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.3.bb:do_packagedata)
NOTE: Running task 1521 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.4.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1522 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.5.bb:do_packagedata)
NOTE: Running task 1523 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1524 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.2.2.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Started
NOTE: Running task 1525 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_packagedata)
NOTE: Running task 1526 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-rtd-theme-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jinja2-3.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-docutils-0.19-r0: task do_package: Succeeded
NOTE: Running task 1527 of 1536 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata)
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Started
NOTE: recipe python3-docutils-0.19-r0: task do_packagedata: Failed
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-7.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.12.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1527 tasks of which 1362 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.20.1-r0 to 0:0.19-r0) [version-going-backwards]
ERROR: python3-docutils-0.19-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-docutils/0.19-r0/temp/log.do_packagedata.720705
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-docutils_0.19.bb:do_packagedata) failed with exit code '1'

--===============7987948273783462178==--

