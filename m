Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B073FCA9EC8
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.3754.1684186746882130345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CUe6HGeY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a5212-a00fd4cb-8122-4f8f-82bd-90200f4e3445-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cVD+2WJSmOLfbIJ3xuDy8UU+RHiPG/1bE+7kN+qt87s=;
	b=CUe6HGeYWBoC9wshIRLr0r5cDScl/7BSdno0ZSgXPSYHUKPTEF+W3IK5eh5MhrOc
	28cHAnwWE+t+mDyVKka4/DggFR2Zb4SmN7QBkHMkWhkrrrOq/Mz3pCg0+HbxDcIKYe+
	RkL/KlrspJMT5reqhpCXuerv6r805sduz8/LO83M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cVD+2WJSmOLfbIJ3xuDy8UU+RHiPG/1bE+7kN+qt87s=;
	b=AbmYalXzBPqFYMbDh1UVfklHjgBgQklxYM60Dk+FiEv4f3a9ICXWARGVGfsU61cA
	3nZXam3TXSI3sJPoEQFZ71j3jZRw/xpTmE41q0yy0KSlsxWKb34g6IBDezjiiH6iAKL
	78foHlrwLg36pasZvHkGXLWD3fRDHr1J41uFeYrw=
Content-Type: multipart/mixed; boundary="===============9183169356887537836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.24.3 SUCCEEDED
Message-ID: <01010188215a5212-a00fd4cb-8122-4f8f-82bd-90200f4e3445-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181305

--===============9183169356887537836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.24.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.24.2-1.24.3.patch
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
--===============9183169356887537836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 51 skipped, 0 masked, 0 errors.
Removing 29 recipes from the core2-32 sysroot...done.
Removing 54 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c6009ace5a3ab22327374709cd6d6863994672c3"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 220 Local 204 Mirrors 0 Missed 16 Current 199 (92% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 200 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 695 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 715 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: Running task 793 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 229 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 924 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 925 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 926 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 247 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 927 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.789704
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 276 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 284 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 932 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: Running task 959 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 994 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: Running task 1007 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: Running task 1022 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1023 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 690460001af7c36c86bd3c96dabc0fbaaad6e9ba7d423f87627de6946c30e5ee
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 321 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 328 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 352 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 370 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 400 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 407 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1343 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1369 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1557 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: Running task 1568 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1570 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: Running task 1571 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1573 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: Running task 1574 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: Running task 1575 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1576 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1577 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1579 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1580 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1581 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1582 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1583 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: Running task 1584 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1585 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1586 of 1596 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1586 tasks of which 1551 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.798291
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============9183169356887537836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 73 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c6009ace5a3ab22327374709cd6d6863994672c3"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 9 Mirrors 0 Missed 15 Current 399 (37% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 401 of 423 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.784211
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 422 of 423 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 980 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 1004 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: Running task 1169 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: Running task 1412 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 1413 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1414 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 1415 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1494 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: Running task 1495 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1579 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1581 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1585 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1586 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 690460001af7c36c86bd3c96dabc0fbaaad6e9ba7d423f87627de6946c30e5ee
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1587 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: Running task 1588 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1590 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1591 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: Running task 1592 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1596 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1597 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 1598 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1599 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1601 tasks of which 1567 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.786922
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============9183169356887537836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c6009ace5a3ab22327374709cd6d6863994672c3"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 9 Mirrors 0 Missed 15 Current 399 (37% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 401 of 423 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.774250
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 422 of 423 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 980 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 1004 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: Running task 1169 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: Running task 1495 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 1496 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1497 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 1498 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1565 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: Running task 1566 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1579 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1581 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1585 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1586 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 690460001af7c36c86bd3c96dabc0fbaaad6e9ba7d423f87627de6946c30e5ee
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: Running task 1587 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: Running task 1588 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1591 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1592 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1596 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1597 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 1598 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1599 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1601 tasks of which 1567 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.776962
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============9183169356887537836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.24.2/numpy-1.24.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.24.3/numpy-1.24.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 40986436 to 40986732 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 18907513 to 18907800 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 242548 to 242556 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 39489638 to 39500903 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.24.2" to "1.24.3"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.24.2.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.24.3.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/scalar_string.f90"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.24.2 [default] to 1.24.3 [default]
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.24.2.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.24.3.dist-info
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/scalar_string.f90 was added

--===============9183169356887537836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c6009ace5a3ab22327374709cd6d6863994672c3"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 9 Mirrors 0 Missed 15 Current 399 (37% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 401 of 423 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.779257
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 422 of 423 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 980 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 1004 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: Running task 1169 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: Running task 1474 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 1475 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1476 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 1477 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1542 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: Running task 1543 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1579 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1581 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1585 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: Running task 1586 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 690460001af7c36c86bd3c96dabc0fbaaad6e9ba7d423f87627de6946c30e5ee
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1587 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: Running task 1589 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: Running task 1590 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1591 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1592 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1596 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1597 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1598 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: Running task 1599 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1601 tasks of which 1567 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.781971
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============9183169356887537836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.24.2.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.24.3.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/scalar_string.f90"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.24.2.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.24.3.dist-info
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/string/scalar_string.f90 was added

--===============9183169356887537836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.24.2-1.24.3.patch"

RnJvbSAxZWQ1M2U1MGQwYjQ5MzZkN2U0Njc4MjhhYzcwNjY0M2EzMWVhMzE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTE6MzE6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDEuMjQuMiAtPiAxLjI0LjMKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1udW1weV8xLjI0LjIuYmIgPT4gcHl0aG9uMy1udW1weV8xLjI0LjMuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8xLjI0LjIuYmIgPT4g
cHl0aG9uMy1udW1weV8xLjI0LjMuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjQuMi5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI0LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
XzEuMjQuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzEuMjQuMy5iYgppbmRleCBiZmNmYzUyNzI5Li43MTBhZjVmZThmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNC4yLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI0LjMuYmIK
QEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
bnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDAz
YTlmNTMwZTg4MGNiMmNkMTc3Y2JhMWFmNzIyMGI5YWE0MmRlZjljNGFmYzJhMmZjM2VlNmJlN2Vi
MmIyMiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYjM0NGYxYmYyMWYxNDBhZGFiOGU0N2ZkYmM3
YzM1YTQ3N2RjMDE0MDg3OTFmOGJhMDBkMDE4ZGQwYmM1MTU1IgogCiBHSVRIVUJfQkFTRV9VUkkg
PSAiaHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hF
Q0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKLS0gCjIu
MzkuMgoK

--===============9183169356887537836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1804 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:c6009ace5a3ab22327374709cd6d6863994672c3"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 9 Mirrors 0 Missed 15 Current 399 (37% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 401 of 423 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.768665
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 422 of 423 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 980 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_fetch)
NOTE: Running task 1004 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_fetch)
NOTE: Running task 1169 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_fetch: Succeeded
NOTE: Running task 1432 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_unpack)
NOTE: Running task 1433 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1434 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_unpack)
NOTE: Running task 1435 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1516 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_unpack)
NOTE: Running task 1517 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_patch)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Started
NOTE: Running task 1579 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1585 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure)
NOTE: Running task 1586 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_configure)
NOTE: recipe python3-numpy-1.24.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_populate_lic unihash changed to 690460001af7c36c86bd3c96dabc0fbaaad6e9ba7d423f87627de6946c30e5ee
NOTE: recipe python3-numpy-1.24.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1587 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1588 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_configure_ptest_base)
NOTE: Running task 1589 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1590 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1591 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.24.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Started
NOTE: Running task 1592 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.3.bb:do_compile)
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1593 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile: Succeeded
NOTE: Running task 1594 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 1595 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1596 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install: Succeeded
NOTE: Running task 1597 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package: Succeeded
NOTE: Running task 1598 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1599 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1600 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_package: Succeeded
NOTE: Running task 1601 of 1611 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.71.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1601 tasks of which 1567 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.75.3-r0 to 0:6.71.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.71.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.71.0-r0/temp/log.do_packagedata.771389
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb:do_packagedata) failed with exit code '1'

--===============9183169356887537836==--

