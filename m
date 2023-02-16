Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EC2C74A4B
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.10145.1676508395954440717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jt6aFC0z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018657aff57b-0d1e7ed6-2458-43e9-a530-e43b8ed126db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M/1+IssWaO+8P+rSSjjqrUKVR6hkNBpSeCXyggbmdgc=;
	b=jt6aFC0zc0jwc/fb6MAk6ynTuM3Ssd1m0MFtEci8y80qaf6Xt7EUbTIms3JkVY+8
	RgZH1wSwLYLWj3tWM5E3nqebrlHR2objb1sws8FjQE+OMtIrG1pktGafS2Zi8c26Rev
	ckiDsrgR5+HjY/9kWQPlYthVfIvlHGwpD3FglYgo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M/1+IssWaO+8P+rSSjjqrUKVR6hkNBpSeCXyggbmdgc=;
	b=X7q/jfnMXbm8roeMr8umFvvqOw0/dZtG0ir22TPWgpeDI2du4zjHrSj/b5huIJIR
	XcLjSZd5stw0UgeMaVuGxAkw4CDAswJx+sRhc2vVkfk01VbUWgjKtW5z17sFzMUIm71
	3psGuDFnLaPX38Q31/S8CRppPzMtdAv/hVRQhNVE=
Content-Type: multipart/mixed; boundary="===============1477189246262783671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.21.20 SUCCEEDED
Message-ID: <0101018657aff57b-0d1e7ed6-2458-43e9-a530-e43b8ed126db-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177227

--===============1477189246262783671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.21.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dpkg-upgrade-1.21.19-1.21.20.patch
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
--===============1477189246262783671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dpkg/dpkg-dbg: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-dbg: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-dev: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-dev: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-doc: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-doc: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ast: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ast: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-bs: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-bs: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PKGSIZE changed from 124640 to 170736 (+37%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-dz: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-dz: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-el: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-el: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-et: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-et: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PKGSIZE changed from 197226 to 309805 (+57%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-gl: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-gl: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PKGSIZE changed from 38208 to 58217 (+52%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-km: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-km: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ku: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ku: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-lt: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-lt: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-mr: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-mr: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ne: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ne: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: FILELIST: added "/usr/share/locale/nl/LC_MESSAGES/dpkg-dev.mo"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PKGSIZE changed from 170374 to 290917 (+71%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nn: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nn: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PKGSIZE changed from 47492 to 66884 (+41%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pa: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pa: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt-br: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt-br: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PKGSIZE changed from 141173 to 172654 (+22%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PKGSIZE changed from 73282 to 123270 (+68%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PKGSIZE changed from 229310 to 300378 (+31%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PKGSIZE changed from 263445 to 278596 (+6%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PKGSIZE changed from 175093 to 255644 (+46%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-tl: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-tl: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PKGSIZE changed from 158720 to 161680 (+2%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-perl: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-perl: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-src: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-src: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-start-stop: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-start-stop: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PKGSIZE changed from 995904 to 995856 (-0%)
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/dpkg: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/dpkg: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg: PV changed from "1.21.19" to "1.21.20"
packages/core2-32-poky-linux/dpkg/update-alternatives-dpkg: PKGV changed from 1.21.19 [default] to 1.21.20 [default]
packages/core2-32-poky-linux/dpkg/update-alternatives-dpkg: PV changed from "1.21.19" to "1.21.20"

--===============1477189246262783671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1694 targets, 49 skipped, 0 masked, 0 errors.
Removing 15 recipes from the core2-32 sysroot...done.
Removing 25 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-52d5e27e5a166e758e0b46f10d14b1f02adcb860"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:52d5e27e5a166e758e0b46f10d14b1f02adcb860"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 76 Mirrors 0 Missed 39 Current 124 (66% match, 83% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 134 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 144 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 145 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 146 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 148 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 149 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 150 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 159 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 164 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 165 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 170 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 550 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_fetch)
NOTE: Running task 551 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 552 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_fetch)
NOTE: Running task 553 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_fetch)
NOTE: Running task 554 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 555 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_fetch)
NOTE: Running task 556 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_fetch)
NOTE: Running task 557 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb:do_fetch)
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Started
NOTE: recipe xz-5.4.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Succeeded
NOTE: recipe dpkg-1.21.20-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 567 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 568 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 569 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 572 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_unpack)
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 577 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_unpack)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_fetch: Started
NOTE: Running setscene task 183 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 588 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe dpkg-1.21.20-r0: task do_fetch: Succeeded
NOTE: Running task 589 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.1-r0: task do_unpack: Started
NOTE: recipe python3-3.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 590 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_unpack)
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 595 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_patch)
NOTE: Running setscene task 188 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dpkg-1.21.20-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_unpack: Succeeded
NOTE: Running task 600 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_patch)
NOTE: Running task 601 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 602 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 603 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_fetch)
NOTE: recipe python3-3.11.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.1-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmd-1.0.4-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_fetch: Started
NOTE: recipe libmd-1.0.4-r0: task do_patch: Succeeded
NOTE: Running task 604 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 605 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_unpack)
NOTE: recipe xz-5.4.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Succeeded
NOTE: Running task 606 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 607 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 608 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.2-r0: task do_unpack: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 613 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 614 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_patch)
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 615 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_patch)
NOTE: recipe libmd-1.0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe readline-8.2-r0: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 616 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.2-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-1.21.20-r0: task do_unpack: Succeeded
NOTE: Running task 618 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_patch: Succeeded
NOTE: Running task 619 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe dpkg-1.21.20-r0: task do_patch: Started
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dpkg-1.21.20-r0: task do_patch: Succeeded
NOTE: Running task 620 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb:do_deploy_source_date_epoch)
NOTE: Running task 621 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb:do_populate_lic)
NOTE: recipe dpkg-1.21.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dpkg-1.21.20-r0: task do_populate_lic: Started
NOTE: recipe python3-3.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 622 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_patch)
NOTE: recipe dpkg-1.21.20-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dpkg/dpkg_1.21.20.bb:do_populate_lic unihash changed to 0371b8fbab95eca433d8d61b45f28adf8b25b3b6b1b0c3b6f56c1b6aad0bfdbd
NOTE: recipe dpkg-1.21.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.1-r0: task do_patch: Succeeded
NOTE: Running task 623 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 193 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package_setscene)
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 194 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 196 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 199 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 624 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 201 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 205 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 633 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 207 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 209 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 212 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 214 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 216 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 217 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 644 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 220 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 223 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 233 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 236 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 237 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 767 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 770 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 780 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 781 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 786 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 788 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 790 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 833 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 834 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: recipe libmd-1.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 835 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_configure)
NOTE: Running task 836 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe readline-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 837 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_configure)
NOTE: Running task 838 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_configure: Started
NOTE: Running task 839 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: recipe libmd-1.0.4-r0: task do_configure: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Started
NOTE: recipe xz-5.4.1-r0: task do_configure: Started
NOTE: recipe readline-8.2-r0: task do_configure: Started
NOTE: recipe readline-8.2-r0: task do_configure: Succeeded
NOTE: Running task 840 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_compile)
NOTE: recipe readline-8.2-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Succeeded
NOTE: Running task 841 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_compile)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_compile: Succeeded
NOTE: Running task 842 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_install)
NOTE: recipe readline-8.2-r0: task do_install: Started
NOTE: recipe readline-8.2-r0: task do_install: Succeeded
NOTE: Running task 844 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe libmd-1.0.4-r0: task do_configure: Succeeded
NOTE: Running task 845 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_compile)
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 846 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe libmd-1.0.4-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe libmd-1.0.4-r0: task do_compile: Succeeded
NOTE: Running task 847 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_install)
NOTE: recipe libmd-1.0.4-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 848 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe libmd-1.0.4-r0: task do_install: Succeeded
NOTE: Running task 849 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_populate_sysroot)
NOTE: Running task 850 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_package)
NOTE: recipe libmd-1.0.4-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to a7eedc1543c3932cf97d4a8d7af838bc0d865cfc0ede0857621e71ae7b08da20
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 239 of 239 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running task 851 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 852 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 854 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmd-1.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 855 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure: Succeeded
NOTE: Running task 856 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure_ptest_base)
NOTE: recipe libmd-1.0.4-r0: task do_package: Succeeded
NOTE: Running task 857 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmd/libmd_1.0.4.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Started
NOTE: Running task 858 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile)
NOTE: recipe openssl-3.0.7-r0: task do_compile: Started
NOTE: recipe libmd-1.0.4-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 859 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_configure: Succeeded
NOTE: Running task 860 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_compile)
NOTE: recipe xz-5.4.1-r0: task do_compile: Started
NOTE: recipe xz-5.4.1-r0: task do_compile: Succeeded
NOTE: Running task 861 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_install)
NOTE: recipe xz-5.4.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 862 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 863 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe xz-5.4.1-r0: task do_install: Succeeded
NOTE: Running task 864 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot)
NOTE: Running task 865 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Started
NOTE: Running task 866 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 867 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_compile: Succeeded
NOTE: Running task 868 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 869 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 870 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: Running task 871 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata)
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_configure: Succeeded
NOTE: Running task 872 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 873 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile)
NOTE: recipe perl-5.36.0-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Succeeded
NOTE: Running task 874 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_install)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Succeeded
NOTE: Running task 875 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot)
NOTE: Running task 876 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_package)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Succeeded
NOTE: Running task 877 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_install: Succeeded
NOTE: Running task 878 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 879 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot)
NOTE: Running task 880 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_package)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 881 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 882 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure)
NOTE: recipe python3-3.11.1-r0: task do_configure: Started
NOTE: recipe python3-3.11.1-r0: task do_configure: Succeeded
NOTE: Running task 883 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 884 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_compile)
NOTE: recipe python3-3.11.1-r0: task do_compile: Started
NOTE: recipe python3-3.11.1-r0: task do_compile: Succeeded
NOTE: Running task 885 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_compile_ptest_base)
NOTE: recipe python3-3.11.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.11.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 886 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_install)
NOTE: recipe python3-3.11.1-r0: task do_install: Started
NOTE: recipe perl-5.36.0-r0: task do_compile: Succeeded
NOTE: Running task 887 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 888 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install)
NOTE: recipe perl-5.36.0-r0: task do_install: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Succeeded
NOTE: Running task 889 of 908 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Failed
NOTE: recipe python3-3.11.1-r0: task do_install: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 889 tasks of which 788 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/openssl/3.0.7-r0/temp/log.do_packagedata.1867872
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata) failed with exit code '1'

--===============1477189246262783671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PKGSIZE changed from 124640 to 170736 (+37%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PKGSIZE changed from 197226 to 309805 (+57%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PKGSIZE changed from 38208 to 58217 (+52%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PKGSIZE changed from 170374 to 290917 (+71%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: FILELIST: added "/usr/share/locale/nl/LC_MESSAGES/dpkg-dev.mo"
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PKGSIZE changed from 47492 to 66884 (+41%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PKGSIZE changed from 141173 to 172654 (+22%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PKGSIZE changed from 73282 to 123270 (+68%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PKGSIZE changed from 229310 to 300378 (+31%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PKGSIZE changed from 175093 to 255644 (+46%)

--===============1477189246262783671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.21.19-1.21.20.patch"

RnJvbSA2YzE4YTc4YmNmMjQxNWQzNDk3OWI5ZDQ4YzNlYmI1YWY3YzFhMjEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTQ6MDY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cGtnOiB1cGdyYWRlIDEuMjEuMTkgLT4gMS4yMS4yMAoKLS0tCiAuLi4vZHBrZy9kcGtnLzAwMDEt
YnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2ggfCAyICstCiBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZHBrZy97ZHBrZ18xLjIxLjE5LmJiID0+IGRwa2dfMS4yMS4yMC5i
Yn0gfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy97ZHBrZ18xLjIxLjE5LmJiID0+
IGRwa2dfMS4yMS4yMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2Yu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25v
cmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKaW5kZXggMTYwYWRiYmU2ZS4uZjIzNjdj
OTVlOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWJ1
aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1m
cm9tLXRhci1jZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjY4ZmNmMGUyM2I5MWRjYTdm
ZWNmZWVjZWIxYzQyNjdlMjllNmY5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTNh
ZGUzNDY0YjhhMTEyOWE1NWMyNzkwY2YxMTRkOWFlMDFlM2NkYSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdnbGV0b25AbGludXgubWljcm9zb2Z0
LmNvbT4KIERhdGU6IFR1ZSwgMTYgSnVuIDIwMjAgMDM6NTc6MjUgKzAwMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gYnVpbGQuYzogaWdub3JlIHJldHVybiBvZiAxIGZyb20gdGFyIC1jZgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIxLjE5LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIxLjIwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMS4xOS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIxLjIwLmJiCmluZGV4IDhk
MGViNDBiZDYuLmE2ZWQ0ZmQ0MjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
cGtnL2Rwa2dfMS4yMS4xOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtn
XzEuMjEuMjAuYmIKQEAgLTE4LDYgKzE4LDYgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5kZWJp
YW4ub3JnL2Rwa2ctdGVhbS9kcGtnLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbgogCiBT
UkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLWJ1aWxkLmMtaWdub3Jl
LXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBhdGNoIgogCi1TUkNSRVYgPSAiMmYzMTA1Mjc5ZTBm
YjIyNTVmMzliMmU5YTExZjE1ODM3Y2FjZDQ0YiIKK1NSQ1JFViA9ICI2YzUxNDBmMTI0OTI1YWQ0
ZWIxMmZiMmM4ZTgzYTA1MDAyOGJiYzFmIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi4z
Ny4zCgo=

--===============1477189246262783671==--

