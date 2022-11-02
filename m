Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B95C64EC3
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.876.1667349632093172935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=duBoglCY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018435c85687-3f58eb5d-29a4-44a4-adac-2785bf4086ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UbagnGTlQe/mhq5w6vMDJbZRtJkeBrNrCm2mZBmgdvE=;
	b=duBoglCYf3TvLDXksEJNyIb6FqEn+9wpNBzEYDvxliDl4b0AOMCW29q6Pl/mI/lm
	Ywjo/9Jz15aqj6RMD2bdd39Yvxf7ob85Pogg+MbDZJdktzjP/hIT+B0T9X7lqoA/fKj
	TnoPzBY+KebFPI7WBramZCbOOBPyZOdtGmpV8zB0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UbagnGTlQe/mhq5w6vMDJbZRtJkeBrNrCm2mZBmgdvE=;
	b=SflpvuLhAOl0pA11INKM4/Cm9Lo66Z9aBZMZ1iR2hQ578XOK0Y/QIfc/bPCyq/+X
	LE5doV88Y4S0ADWNgJA62jQfYKtS20y+O+icbC2hQKa6ZEqW5JGNEwTJB4iByrMpfC4
	FTl3CukUXvBq0arv/5OGCsXFExna9P10vbNAqGPg=
Content-Type: multipart/mixed; boundary="===============7300555319788400491=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.29 SUCCEEDED
Message-ID: <0101018435c85687-3f58eb5d-29a4-44a4-adac-2785bf4086ba-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172429

--===============7300555319788400491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.28-3.1.29.patch
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
--===============7300555319788400491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.28 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.28.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.29.tar.gz"
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.28" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.28 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.28" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.28 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.28" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.28 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.28" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.28 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.28" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.28 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.28" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.28 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.28" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.28 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 1304599 to 1304608 (+0%)
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.28" to "3.1.29"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.28.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.29.dist-info

--===============7300555319788400491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.28.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.29.dist-info

--===============7300555319788400491==
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
meta-yocto-bsp       = "tmp-auh-upgrades:df210352ed31c58faf97b8b6b6ce2379007c126b"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 5 Mirrors 0 Missed 43 Current 293 (10% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 838 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_fetch)
NOTE: Running task 848 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 851 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_fetch)
NOTE: Running task 855 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_fetch)
NOTE: Running task 938 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 939 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 954 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 978 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1000 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 1003 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Started
NOTE: recipe expat-2.4.9-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1158 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_unpack)
NOTE: Running task 1160 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 1161 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 1162 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 1163 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1164 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_unpack)
NOTE: Running task 1165 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.85.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1166 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1167 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_unpack)
NOTE: Running task 1168 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1169 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 1170 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_unpack: Started
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1172 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: Running task 1173 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: Running task 1174 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: Running task 1176 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1177 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_patch)
NOTE: Running task 1178 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Started
NOTE: Running task 1179 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.9-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1181 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1183 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_patch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: Running task 1184 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_generate_toolchain_file)
NOTE: Running task 1185 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1186 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: Running task 1187 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.85.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_patch)
NOTE: Running task 1189 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Started
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1190 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1191 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to d43173168c5260d795f6bdf195517c04fd3a086cf85ae3f3e62f5909f9199e3f
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.85.0-r0: task do_patch: Succeeded
NOTE: Running task 1192 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: Running task 1193 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure)
NOTE: Running task 1195 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1196 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: recipe expat-2.4.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1197 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1198 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1199 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1200 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1201 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe expat-2.4.9-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure_ptest_base)
NOTE: Running task 1203 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1204 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile)
NOTE: recipe expat-2.4.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1205 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1206 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1207 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1208 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1209 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1210 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: Running task 1211 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1212 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: Running task 1213 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1214 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1215 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1216 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1217 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1218 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe expat-2.4.9-r0: task do_compile: Succeeded
NOTE: Running task 1219 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile_ptest_base)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: Running task 1220 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: Running task 1221 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1222 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1223 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe expat-2.4.9-r0: task do_install: Succeeded
NOTE: Running task 1224 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install_ptest_base)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1225 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_package)
NOTE: Running task 1226 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_package: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1227 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe expat-2.4.9-r0: task do_package: Succeeded
NOTE: Running task 1228 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata)
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Started
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: Running task 1229 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_package)
NOTE: Running task 1230 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_package: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Failed
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_package: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1230 tasks of which 1146 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/expat/2.4.9-r0/temp/log.do_packagedata.430870
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata) failed with exit code '1'

--===============7300555319788400491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 30 recipes from the core2-32 sysroot...done.
Removing 44 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:df210352ed31c58faf97b8b6b6ce2379007c126b"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 187 Local 144 Mirrors 0 Missed 43 Current 150 (77% match, 87% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 152 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 181 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 185 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running task 583 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_fetch)
NOTE: Running task 590 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 593 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_fetch)
NOTE: Running task 597 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_fetch)
NOTE: Running task 647 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 648 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 655 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 656 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 657 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 658 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe expat-2.4.9-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe expat-2.4.9-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: Running task 697 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: recipe curl-7.85.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_unpack)
NOTE: Running task 699 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 700 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_unpack)
NOTE: Running task 701 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 702 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 703 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 704 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_unpack)
NOTE: Running task 705 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 706 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe expat-2.4.9-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_unpack: Started
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 711 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 712 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: Running task 713 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: Running task 714 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: Running setscene task 205 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.9-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: Running task 715 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_patch)
NOTE: Running task 716 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 717 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 718 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 719 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 720 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.9-r0: task do_patch: Started
NOTE: Running task 721 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 722 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 723 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 728 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_generate_toolchain_file)
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 729 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 734 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 735 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_unpack: Succeeded
NOTE: Running task 736 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 737 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Started
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 742 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to d43173168c5260d795f6bdf195517c04fd3a086cf85ae3f3e62f5909f9199e3f
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_patch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 747 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 221 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 752 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 228 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 246 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 253 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 257 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 260 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 267 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 292 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 319 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1055 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1060 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1090 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1091 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1109 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1179 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1180 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1181 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe expat-2.4.9-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1182 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: Running task 1183 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1184 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: Running task 1185 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe expat-2.4.9-r0: task do_configure: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1186 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure_ptest_base)
NOTE: Running task 1187 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1188 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile)
NOTE: Running task 1189 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe expat-2.4.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1190 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1191 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1192 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: Running task 1193 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1194 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1195 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: Running task 1196 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1197 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: Running task 1198 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1199 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1200 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1201 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1202 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_compile: Succeeded
NOTE: Running task 1203 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1204 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1205 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe expat-2.4.9-r0: task do_install: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1206 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_install: Succeeded
NOTE: Running task 1207 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install_ptest_base)
NOTE: Running task 1208 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1209 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_package)
NOTE: Running task 1210 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Started
NOTE: Running task 1211 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe expat-2.4.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_package: Succeeded
NOTE: Running task 1212 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1213 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Started
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Failed
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1213 tasks of which 1131 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/expat/2.4.9-r0/temp/log.do_packagedata.489880
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata) failed with exit code '1'

--===============7300555319788400491==
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
meta-yocto-bsp       = "tmp-auh-upgrades:df210352ed31c58faf97b8b6b6ce2379007c126b"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 5 Mirrors 0 Missed 43 Current 293 (10% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 838 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_fetch)
NOTE: Running task 848 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 851 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_fetch)
NOTE: Running task 855 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_fetch)
NOTE: Running task 938 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 939 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 954 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 978 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1000 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 1003 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe expat-2.4.9-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1158 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 1160 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 1161 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.85.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_unpack)
NOTE: Running task 1163 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_unpack)
NOTE: Running task 1164 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1165 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_unpack)
NOTE: Running task 1166 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 1167 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1168 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1169 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 1170 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Started
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: Running task 1172 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: Running task 1173 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 1174 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: Running task 1175 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: Running task 1176 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1177 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_patch)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: Running task 1179 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1180 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1181 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1183 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1184 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1185 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_generate_toolchain_file)
NOTE: Running task 1186 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.85.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: Running task 1187 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1188 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1189 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1190 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1191 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.85.0-r0: task do_patch: Started
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to d43173168c5260d795f6bdf195517c04fd3a086cf85ae3f3e62f5909f9199e3f
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_patch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1192 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1193 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure)
NOTE: Running task 1195 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: Running task 1196 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1197 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1198 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe expat-2.4.9-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1199 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1200 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1201 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure_ptest_base)
NOTE: Running task 1203 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1204 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile)
NOTE: recipe expat-2.4.9-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 1205 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1206 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1207 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: Running task 1208 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1209 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1210 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: Running task 1211 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: Running task 1212 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1213 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1214 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1215 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1216 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1217 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1218 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1219 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: Running task 1220 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1221 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.4.9-r0: task do_compile: Succeeded
NOTE: Running task 1222 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1223 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install)
NOTE: recipe expat-2.4.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_install: Succeeded
NOTE: Running task 1224 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1225 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_package)
NOTE: Running task 1226 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_package: Started
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1227 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: Running task 1228 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_package)
NOTE: Running task 1229 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_package: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_package: Succeeded
NOTE: Running task 1230 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata)
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Failed
NOTE: recipe python3-git-3.1.29-r0: task do_package: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1230 tasks of which 1146 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/expat/2.4.9-r0/temp/log.do_packagedata.449502
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata) failed with exit code '1'

--===============7300555319788400491==
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
meta-yocto-bsp       = "tmp-auh-upgrades:df210352ed31c58faf97b8b6b6ce2379007c126b"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 5 Mirrors 0 Missed 43 Current 293 (10% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 838 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_fetch)
NOTE: Running task 848 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 851 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_fetch)
NOTE: Running task 855 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_fetch)
NOTE: Running task 938 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 939 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 954 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 978 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1000 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 1003 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe expat-2.4.9-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1158 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.85.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1159 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_unpack)
NOTE: Running task 1160 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_unpack)
NOTE: Running task 1161 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 1163 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 1164 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 1165 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1166 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_unpack)
NOTE: Running task 1167 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1168 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1169 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 1170 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe expat-2.4.9-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe curl-7.85.0-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1172 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: Running task 1174 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: Running task 1175 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: Running task 1176 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: Running task 1177 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1179 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1181 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1182 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1183 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_generate_toolchain_file)
NOTE: Running task 1184 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1185 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1186 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: recipe curl-7.85.0-r0: task do_unpack: Succeeded
NOTE: Running task 1187 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1188 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1189 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1190 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1191 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to d43173168c5260d795f6bdf195517c04fd3a086cf85ae3f3e62f5909f9199e3f
NOTE: recipe curl-7.85.0-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1192 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1193 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1194 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 1195 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1196 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: Running task 1197 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: Running task 1198 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1199 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: Running task 1200 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1201 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure_ptest_base)
NOTE: Running task 1203 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1204 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile)
NOTE: recipe expat-2.4.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1205 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1206 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1207 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: Running task 1208 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1209 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1210 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: Running task 1211 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1212 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: Running task 1213 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1214 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1215 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1216 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1217 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_compile: Succeeded
NOTE: Running task 1218 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile_ptest_base)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1219 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1220 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1221 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_install: Started
NOTE: Running task 1222 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.9-r0: task do_install: Succeeded
NOTE: Running task 1223 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install_ptest_base)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1224 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1225 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_package)
NOTE: Running task 1226 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_package: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1227 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe expat-2.4.9-r0: task do_package: Succeeded
NOTE: Running task 1228 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata)
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Failed
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1228 tasks of which 1146 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/expat/2.4.9-r0/temp/log.do_packagedata.467743
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata) failed with exit code '1'

--===============7300555319788400491==
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
meta-yocto-bsp       = "tmp-auh-upgrades:df210352ed31c58faf97b8b6b6ce2379007c126b"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 5 Mirrors 0 Missed 43 Current 293 (10% match, 87% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 838 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_fetch)
NOTE: Running task 848 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 851 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_fetch)
NOTE: Running task 855 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_fetch)
NOTE: Running task 938 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 939 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 954 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 978 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_fetch)
NOTE: Running task 1000 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 1003 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe expat-2.4.9-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1157 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1158 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1159 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_unpack)
NOTE: Running task 1160 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 1161 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 1162 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 1163 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.85.0-r0: task do_fetch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 1164 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_unpack)
NOTE: Running task 1165 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_unpack)
NOTE: Running task 1166 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1167 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1168 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_unpack)
NOTE: Running task 1169 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 1170 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1171 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_unpack: Started
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.85.0-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1172 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Started
NOTE: recipe git-2.38.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1173 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: Running task 1174 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: Running task 1176 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_patch)
NOTE: Running task 1177 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1179 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.9-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1181 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe findutils-4.9.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1182 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_patch)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1183 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.9-r0: task do_patch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1184 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1185 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_generate_toolchain_file)
NOTE: Running task 1186 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: recipe curl-7.85.0-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1187 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_patch)
NOTE: recipe git-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 1188 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_patch)
NOTE: recipe findutils-4.9.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1189 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_patch: Succeeded
NOTE: Running task 1190 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1191 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.9-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe git-2.38.1-r0: task do_patch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to d43173168c5260d795f6bdf195517c04fd3a086cf85ae3f3e62f5909f9199e3f
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.85.0-r0: task do_patch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1192 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_deploy_source_date_epoch)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1193 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1194 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure)
NOTE: recipe git-2.38.1-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: Running task 1195 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1196 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: Running task 1197 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: recipe findutils-4.9.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_configure: Started
NOTE: Running task 1198 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_configure)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe curl-7.85.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1199 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1200 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: recipe git-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1201 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_configure: Succeeded
NOTE: Running task 1202 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_configure_ptest_base)
NOTE: Running task 1203 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1204 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile)
NOTE: recipe expat-2.4.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1205 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1206 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1207 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: Running task 1208 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1209 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1210 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: Running task 1211 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: Running task 1212 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1213 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1214 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1215 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1216 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_compile: Succeeded
NOTE: Running task 1217 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1218 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_compile_ptest_base)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1219 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install)
NOTE: recipe expat-2.4.9-r0: task do_install: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1220 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe expat-2.4.9-r0: task do_install: Succeeded
NOTE: Running task 1221 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_install_ptest_base)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1222 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1223 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: Running task 1224 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_package)
NOTE: Running task 1225 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1226 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_package: Succeeded
NOTE: Running task 1227 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata)
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Started
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1228 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe expat-2.4.9-r0: task do_packagedata: Failed
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe findutils-4.9.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1228 tasks of which 1146 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.5.0-r0 to 0:2.4.9-r0) [version-going-backwards]
ERROR: expat-2.4.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/expat/2.4.9-r0/temp/log.do_packagedata.413084
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata) failed with exit code '1'

--===============7300555319788400491==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.28-3.1.29.patch"

RnJvbSA2ZTIwZmE4ZTIyMzM2ODg1OTZlZTQ0YmI1NGZlZDExY2M4ZTQ4OGJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwOTo1MzozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0OiB1cGdyYWRlIDMuMS4yOCAtPiAzLjEuMjkKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1naXRfMy4xLjI4LmJiID0+IHB5dGhvbjMtZ2l0XzMuMS4yOS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1naXRfMy4xLjI4LmJiID0+IHB5dGhv
bjMtZ2l0XzMuMS4yOS5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4yOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1naXRfMy4xLjI5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjI4LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4yOS5i
YgppbmRleCBjZGNkODYyYmUyLi5lNzVmOGI0ZTNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4yOC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4yOS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQ
WVBJX1BBQ0tBR0UgPSAiR2l0UHl0aG9uIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmJkMzQ1MWI4MjcxMTMyZjA5
OWNlZWFmNTgxMzkyZWFmNmMyNzRhZjc0YmIwNjE0NDMwNzg3MDQ3OWQwNjk3YyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJjYzM2YmZjNGEzZjkxM2U2NjgwNWEyOGU4NDcwM2U0MTlkOWMyNjRjMTA3
N2U1MzdiNTRmMGUxYWY4NWRiZWZkIgogCiBERVBFTkRTICs9ICIgJHtQWVRIT05fUE59LWdpdGRi
IgogCi0tIAoyLjMxLjEKCg==

--===============7300555319788400491==--

