Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DACC30632
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.174035.1692224345005412936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SoQDXbli;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IO/eGo1+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a006e508d-9afffe51-7c9d-43e1-8d56-4acb21d665a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224344;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=GdGVGaymwq93DpwjNxYoVFkxgsYznyWLn7eNbCZoffY=;
	b=SoQDXbli5qTevz8QfNmTYbgc5kTNXKhOyU7zIfeb8a2Zm21xGxChvlWFjJZrLT0U
	i4XgLpsoOKwJb2eGgwdd5GWoAb2lMwTKbt6mQFf8qTtirREThLYcestSF5m9Fpa4nw+
	rG3pPUTzxPhO4MNLBs7YjAyXB9PLp3bnSKlH0JEc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224344;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=GdGVGaymwq93DpwjNxYoVFkxgsYznyWLn7eNbCZoffY=;
	b=IO/eGo1+Fn9uYjj5dniDgFs7NpiQh0YTL8wD7Ts1rDQX68qVZN59uUrC2kakC8uh
	sSnWa6YwKU3cCDNSA5u2iP9b/kdNeM7mxIChnx7NGZ2h9SI73fR8+bX2xcN1Ibo+KXH
	lXyB0HcZN4R+vaMO0J8VuGcwjRYsK6LFnRXqoiHo=
Content-Type: multipart/mixed; boundary="===============7903660023977317965=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.25.2 SUCCEEDED
Message-ID: <0101018a006e508d-9afffe51-7c9d-43e1-8d56-4acb21d665a5-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186186

--===============7903660023977317965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.25.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.25.1-1.25.2.patch
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
From c2a49ec206975235d91be27294661a162f130f6e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 06:14:25 +0000
Subject: [PATCH] python3-numpy: upgrade 1.25.1 -> 1.25.2

---
 .../python/{python3-numpy_1.25.1.bb => python3-numpy_1.25.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.25.1.bb => python3-numpy_1.25.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.25.1.bb b/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.25.1.bb
rename to meta/recipes-devtools/python/python3-numpy_1.25.2.bb
index 3632ab71ee..0c6c0a3287 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.25.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "9a3a9f3a61480cc086117b426a8bd86869c213fc4072e606f01c4e4b66eb92bf"
+SRC_URI[sha256sum] = "fd608e19c8d7c55021dffd43bfe5492fab8cc105cc8986f813f8c3c048b38760"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.2


--===============7903660023977317965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 29 recipes from the core2-32 sysroot...done.
Removing 72 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:10ac5754c41a556c6e37894113d01715b344df21"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 437 Local 414 Mirrors 0 Missed 23 Current 344 (94% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 345 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 367 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 377 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 378 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 388 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_recipe_qa)
NOTE: Running task 405 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_recipe_qa)
NOTE: Running task 453 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 412 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 485 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_fetch)
NOTE: Running task 486 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_fetch)
NOTE: Running task 487 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.2.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-more-itertools/10.0.0/temp/log.do_packagedata_setscene.2923813
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 451 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_package_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-68.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+4148e75284-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 502 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_unpack)
NOTE: Running task 503 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_unpack)
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 538 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_unpack)
NOTE: Running setscene task 507 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 527 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 537 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 555 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1089 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_patch)
NOTE: Running task 1102 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1198 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 615 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Succeeded
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1354 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1360 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Succeeded
NOTE: Running task 1366 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1367 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 643 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 650 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic unihash changed to 4301998c0c1b1ad831106f28cc3469adfe491e5829d9d20b9a6bfb6fbb21c4cc
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 657 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 699 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 755 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 764 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1840 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1851 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1988 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2046 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2164 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_collect_spdx_deps)
NOTE: Running task 2166 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2180 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata)
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2193 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2194 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure)
NOTE: Running task 2195 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2196 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_configure)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Succeeded
NOTE: Running task 2198 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2199 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure_ptest_base)
NOTE: Running task 2200 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2201 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2202 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_compile)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Succeeded
NOTE: Running task 2204 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2205 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Succeeded
NOTE: Running task 2206 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2208 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_create_spdx)
NOTE: Running task 2211 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+83b858f83b-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Succeeded
NOTE: Running task 2212 of 2225 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2212 tasks of which 2170 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.82.0/temp/log.do_packagedata.2936465
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata) failed with exit code '1'

--===============7903660023977317965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:10ac5754c41a556c6e37894113d01715b344df21"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 39 Mirrors 0 Missed 23 Current 710 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 714 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_setscene)
NOTE: Running setscene task 721 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-more-itertools/10.0.0/temp/log.do_packagedata_setscene.2474596
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 770 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_package_setscene)
NOTE: Running task 1089 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_recipe_qa)
NOTE: Running task 1112 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_recipe_qa)
NOTE: Running task 1285 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_recipe_qa)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.37-r1: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1559 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_fetch)
NOTE: Running task 1560 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1561 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_fetch)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 772 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_unpack)
NOTE: Running task 1563 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_unpack)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1564 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_unpack)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1570 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_patch)
NOTE: Running task 1571 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_patch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Succeeded
NOTE: Running task 1575 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1576 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic unihash changed to 4301998c0c1b1ad831106f28cc3469adfe491e5829d9d20b9a6bfb6fbb21c4cc
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1836 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1847 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1970 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2028 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2146 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2148 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2159 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata)
NOTE: Running task 2175 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2176 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_configure)
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2177 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure)
NOTE: Running task 2178 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2180 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_compile)
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure_ptest_base)
NOTE: Running task 2182 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2183 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_compile)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2184 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2185 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2187 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2188 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2190 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_package)
NOTE: Running task 2191 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_create_spdx)
NOTE: Running task 2193 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Succeeded
NOTE: Running task 2194 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2194 tasks of which 2152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.82.0/temp/log.do_packagedata.2479577
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata) failed with exit code '1'

--===============7903660023977317965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.25.1" to "1.25.2"
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.25.1/numpy-1.25.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest" to "https://github.com/numpy/numpy/releases/download/v1.25.2/numpy-1.25.2.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 50168716 to 50257776 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.25.1" to "1.25.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.25.1" to "1.25.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.25.1" to "1.25.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.25.1" to "1.25.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.25.1" to "1.25.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 19518863 to 19522120 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.25.1" to "1.25.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 270204 to 270196 (-0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.25.1" to "1.25.2"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.25.1.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.25.2.dist-info, added "/usr/lib/python3.11/site-packages/numpy/random/_examples/cython/meson.build"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.25.1 [default] to 1.25.2 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 40741405 to 40766884 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.25.1" to "1.25.2"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.25.1.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.25.2.dist-info
  /usr/lib/python3.11/site-packages/numpy/random/_examples/cython/meson.build was added

--===============7903660023977317965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:10ac5754c41a556c6e37894113d01715b344df21"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 39 Mirrors 0 Missed 23 Current 710 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 714 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_setscene)
NOTE: Running setscene task 721 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-more-itertools/10.0.0/temp/log.do_packagedata_setscene.2455556
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 770 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_package_setscene)
NOTE: Running task 1089 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_recipe_qa)
NOTE: Running task 1112 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_recipe_qa)
NOTE: Running task 1285 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_recipe_qa)
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.37-r1: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1559 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_fetch)
NOTE: Running task 1560 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1561 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_fetch)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Started
NOTE: Running setscene task 772 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_unpack)
NOTE: Running task 1563 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_unpack)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1564 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_unpack)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1570 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_patch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Succeeded
NOTE: Running task 1575 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1576 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic unihash changed to 4301998c0c1b1ad831106f28cc3469adfe491e5829d9d20b9a6bfb6fbb21c4cc
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1836 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1847 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1970 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2028 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_collect_spdx_deps)
NOTE: Running task 2144 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2148 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_collect_spdx_deps)
NOTE: Running task 2150 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata)
NOTE: Running task 2174 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2176 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure)
NOTE: Running task 2177 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure)
NOTE: Running task 2178 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_configure)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Succeeded
NOTE: Running task 2180 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure_ptest_base)
NOTE: Running task 2182 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_compile)
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2183 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_compile)
NOTE: Running task 2184 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2185 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2187 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install)
NOTE: Running task 2188 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2190 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Succeeded
NOTE: Running task 2191 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_create_spdx)
NOTE: Running task 2193 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Succeeded
NOTE: Running task 2194 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2194 tasks of which 2152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.82.0/temp/log.do_packagedata.2460757
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata) failed with exit code '1'

--===============7903660023977317965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:10ac5754c41a556c6e37894113d01715b344df21"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 39 Mirrors 0 Missed 23 Current 710 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 714 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_setscene)
NOTE: Running setscene task 721 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-more-itertools/10.0.0/temp/log.do_packagedata_setscene.2438470
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 770 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_package_setscene)
NOTE: Running task 1089 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_recipe_qa)
NOTE: Running task 1112 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_recipe_qa)
NOTE: Running task 1285 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_recipe_qa)
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.37-r1: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1559 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_fetch)
NOTE: Running task 1560 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1561 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_fetch)
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_unpack)
NOTE: Running setscene task 772 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Started
NOTE: Running task 1563 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_unpack)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1564 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_unpack)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1565 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_patch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Succeeded
NOTE: Running task 1566 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_patch)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1572 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_patch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Succeeded
NOTE: Running task 1575 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1576 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic unihash changed to 4301998c0c1b1ad831106f28cc3469adfe491e5829d9d20b9a6bfb6fbb21c4cc
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1836 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1847 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1970 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2028 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_collect_spdx_deps)
NOTE: Running task 2147 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_collect_spdx_deps)
NOTE: Running task 2148 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_collect_spdx_deps)
NOTE: Running task 2155 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata)
NOTE: Running task 2174 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2176 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2177 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Started
NOTE: Running task 2179 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Succeeded
NOTE: Running task 2180 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Started
NOTE: Running task 2181 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 2182 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_compile)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2183 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_compile)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2184 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2185 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2187 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2190 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Started
NOTE: Running task 2191 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_create_spdx)
NOTE: Running task 2193 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Succeeded
NOTE: Running task 2194 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2194 tasks of which 2152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.82.0/temp/log.do_packagedata.2443638
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata) failed with exit code '1'

--===============7903660023977317965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1807 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:10ac5754c41a556c6e37894113d01715b344df21"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 37 Mirrors 0 Missed 23 Current 712 (61% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 722 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-more-itertools/10.0.0/temp/log.do_packagedata_setscene.2373186
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 770 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_package_setscene)
NOTE: Running task 1285 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_recipe_qa)
NOTE: Running task 1337 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_recipe_qa)
NOTE: Running task 1587 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_recipe_qa)
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2045 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2077 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_fetch)
NOTE: Running task 2144 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2145 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_fetch)
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_fetch: Succeeded
NOTE: Running task 2146 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_unpack)
NOTE: Running task 2147 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_fetch: Succeeded
NOTE: Running task 2148 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_unpack)
NOTE: Running task 2149 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 772 of 772 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2150 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_unpack: Succeeded
NOTE: Running task 2151 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2152 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_patch)
NOTE: Running task 2153 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Started
NOTE: Running task 2154 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_patch)
NOTE: Running task 2155 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2169 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.0.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_patch: Succeeded
NOTE: Running task 2170 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_unpack: Succeeded
NOTE: Running task 2171 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_patch)
NOTE: Running task 2172 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-more-itertools-10.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2174 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure)
NOTE: recipe python3-numpy-1.25.2-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2175 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2176 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2177 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_populate_lic: Succeeded
NOTE: Running task 2178 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_configure_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_populate_lic unihash changed to 4301998c0c1b1ad831106f28cc3469adfe491e5829d9d20b9a6bfb6fbb21c4cc
NOTE: recipe python3-numpy-1.25.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2179 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure)
NOTE: Running task 2180 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_configure)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2181 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile)
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Started
NOTE: Running task 2182 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_compile)
NOTE: Running task 2183 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_configure_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.25.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2184 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.25.2.bb:do_compile)
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2185 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_install)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile: Succeeded
NOTE: Running task 2186 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_compile_ptest_base)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2187 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2190 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_package)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package: Succeeded
NOTE: Running task 2191 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_packagedata)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_create_spdx)
NOTE: Running task 2193 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.7.1.bb:do_package_write_rpm)
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-typing-extensions-4.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_package: Succeeded
NOTE: Running task 2194 of 2207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.82.0-r0: task do_packagedata: Failed
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-1.25.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2194 tasks of which 2152 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-src went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dbg went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-ptest went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-staticdev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-dev went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-doc went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools-locale went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-more-itertools went backwards which would break package feeds (from 0:10.1.0-r0 to 0:10.0.0-r0) [version-going-backwards]
ERROR: python3-more-itertools-10.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.82.4-r0 to 0:6.82.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.82.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.82.0/temp/log.do_packagedata.2378179
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.82.0.bb:do_packagedata) failed with exit code '1'

--===============7903660023977317965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.25.1.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.25.2.dist-info, added "/usr/lib/python3.11/site-packages/numpy/random/_examples/cython/meson.build"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.25.1.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.25.2.dist-info
  /usr/lib/python3.11/site-packages/numpy/random/_examples/cython/meson.build was added

--===============7903660023977317965==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.25.1-1.25.2.patch"

RnJvbSBjMmE0OWVjMjA2OTc1MjM1ZDkxYmUyNzI5NDY2MWExNjJmMTMwZjZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDY6MTQ6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDEuMjUuMSAtPiAxLjI1LjIKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1udW1weV8xLjI1LjEuYmIgPT4gcHl0aG9uMy1udW1weV8xLjI1LjIuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8xLjI1LjEuYmIgPT4g
cHl0aG9uMy1udW1weV8xLjI1LjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjUuMS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI1LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
XzEuMjUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzEuMjUuMi5iYgppbmRleCAzNjMyYWI3MWVlLi4wYzZjMGEzMjg3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yNS4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjI1LjIuYmIK
QEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
bnVtcHktY29yZS1EZWZpbmUtUklTQ1YtMzItc3VwcG9ydC5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWEz
YTlmM2E2MTQ4MGNjMDg2MTE3YjQyNmE4YmQ4Njg2OWMyMTNmYzQwNzJlNjA2ZjAxYzRlNGI2NmVi
OTJiZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmZDYwOGUxOWM4ZDdjNTUwMjFkZmZkNDNiZmU1
NDkyZmFiOGNjMTA1Y2M4OTg2ZjgxM2Y4YzNjMDQ4YjM4NzYwIgogCiBHSVRIVUJfQkFTRV9VUkkg
PSAiaHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hF
Q0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL3Y/KD9QPHB2ZXI+XGQrKFwuXGQrKSspJCIKLS0gCjIu
MzkuMgoK

--===============7903660023977317965==--

