Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F617C021B8
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42717.1738416051266334107
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Iop/Xjrq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Yff07pt8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1abdee8-04c6c639-9670-4f5c-abda-de3da2357973-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416054;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AhCwzfzCKfwMpEjrT5XxBo1ff/dEdSFLsf+j8ngp6sk=;
	b=Iop/XjrqlxwJHB6iO5F9kqVZDGYJY1jOmzXDZnO58Tf0ESi2lMc8xbWgLMKWKI7h
	gzrcTKCkgUHMD0vI93Fn7OZqLhA691rr1bm5nUtlZ9sHRRHxVGmZ8oho5XIR4pSTide
	uY3/vB5WduRjYu+pHxH8/YC3ArQ0SzfDHeZ/lJQU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416054;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AhCwzfzCKfwMpEjrT5XxBo1ff/dEdSFLsf+j8ngp6sk=;
	b=Yff07pt8g3saAR1lEmPyyA8Jij0PQnYZ6CxjvAyXfyFxK/GhzHz5I7b5/N7wp2H3
	MIsdJHUEbF4GtDV4COUjw6x3hMsGBT5fkNH9JOwpe1Av2u2WLu4c9Vkv7HlBxkq8qSu
	c5egt0Mk6S7SuU7eYZB+0W1reZJVIvYRrC53b+j4=
Content-Type: multipart/mixed; boundary="===============3105945249110507877=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.0.1 SUCCEEDED
Message-ID: <01010194c1abdee8-04c6c639-9670-4f5c-abda-de3da2357973-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210539

--===============3105945249110507877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-2.0.0-2.0.1.patch
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
From 5dc0d11cc73010c77bf96f60134f93df8d006685 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:17:24 +0000
Subject: [PATCH] python3-poetry-core: upgrade 2.0.0 -> 2.0.1

---
 ...ython3-poetry-core_2.0.0.bb => python3-poetry-core_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.0.0.bb => python3-poetry-core_2.0.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb b/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
index 09b1a2340d..8fb39a7d67 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "3317a3cc3932011a61114236b2d49883f4fb1403d2f5e97771ac0d077cfa396f"
+SRC_URI[sha256sum] = "10177c2772469d9032a49f0d8707af761b1c597cea3b4fb31546e5cd436eb157"
 
 inherit python_poetry_core pypi
 
-- 
2.44.1


--===============3105945249110507877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-poetry-core: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.0.0.tar.gz;downloadfilename=poetry_core-2.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-2.0.1.tar.gz;downloadfilename=poetry_core-2.0.1.tar.gz"
packages/core2-64-poky-linux/python3-poetry-core: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2447753 to 2450434 (+0%)
Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.0.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.0.1.dist-info

--===============3105945249110507877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.0.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-2.0.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-2.0.1.dist-info

--===============3105945249110507877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 22 recipes from the core2-64 sysroot...done.
Removing 57 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7cd56197bc1c96fef378ff6c9abdeb8fc9abd60a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 439 Local 430 Mirrors 0 Missed 9 Current 245 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 256 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 260 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 261 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 271 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 293 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 294 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 300 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 308 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 311 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pip-24.3.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pip-24.3.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pip-24.3.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pip-24.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pip-24.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pip-24.3.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 326 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pip-24.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 327 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pip-24.3.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pip-24.3.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pip-24.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pip-24.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 749 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_fetch)
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 350 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pip/24.3.1/temp/log.do_packagedata_setscene.3253275
NOTE: Running task 864 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_unpack)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 364 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_package_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_unpack: Succeeded
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 870 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_patch)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_patch: Started
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-24.3.1-r0: task do_package_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 528 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-24.3.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 559 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pip-24.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-24.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 610 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 615 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 624 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 628 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 634 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 654 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 684 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1756 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1780 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.3.1.bb:do_packagedata)
NOTE: Running task 1912 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-24.3.1-r0: task do_packagedata: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pip-24.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1924 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_configure)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_compile)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_compile: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_install)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_install: Succeeded
NOTE: Running task 1927 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package)
NOTE: Running task 1928 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package: Succeeded
NOTE: Running task 1929 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_packagedata)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_packagedata unihash changed to 02d3d509c01cfcd276c5fd00c97dfc2f41f5bdbd74f7002851682add0e8923b7
NOTE: Setscene tasks completed
NOTE: Running task 1930 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_create_spdx)
NOTE: Running task 1931 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package_write_ipk)
NOTE: Running task 1932 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package_write_deb)
NOTE: Running task 1933 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package_write_rpm)
NOTE: Running task 1934 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package_qa)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1935 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_create_package_spdx)
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package_qa unihash changed to 130f8ca362c0e932f123822bda61a885b002f6a34abbca80101da2d13474e3fb
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package_write_rpm unihash changed to 054dc6c1d6962f41889e8da0a6ad97501a318a6ab0a97127a4c964787bcf2ab0
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package_write_deb unihash changed to 68cce26c6fbab350c307ac3ff35d732e67a79466412a5dc33fe9ca252ada98ec
NOTE: recipe python3-poetry-core-2.0.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_package_write_ipk unihash changed to 692e520cb8adbe327d5c83d37d37647c42c194d89d4da0062227271d53df62e8
NOTE: Running noexec task 1936 of 1936 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1936 tasks of which 1917 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-24.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:25.0-r0 to 0:24.3.1-r0) [version-going-backwards]
ERROR: python3-pip-24.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:25.0-r0 to 0:24.3.1-r0) [version-going-backwards]
ERROR: python3-pip-24.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:25.0-r0 to 0:24.3.1-r0) [version-going-backwards]
ERROR: python3-pip-24.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:25.0-r0 to 0:24.3.1-r0) [version-going-backwards]
ERROR: python3-pip-24.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:25.0-r0 to 0:24.3.1-r0) [version-going-backwards]
ERROR: python3-pip-24.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:25.0-r0 to 0:24.3.1-r0) [version-going-backwards]
ERROR: python3-pip-24.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:25.0-r0 to 0:24.3.1-r0) [version-going-backwards]
ERROR: python3-pip-24.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3105945249110507877==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-2.0.0-2.0.1.patch"

RnJvbSA1ZGMwZDExY2M3MzAxMGM3N2JmOTZmNjAxMzRmOTNkZjhkMDA2Njg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODoxNzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcG9ldHJ5LWNvcmU6IHVwZ3JhZGUgMi4wLjAgLT4gMi4wLjEKCi0tLQogLi4ueXRob24z
LXBvZXRyeS1jb3JlXzIuMC4wLmJiID0+IHB5dGhvbjMtcG9ldHJ5LWNvcmVfMi4wLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wb2V0cnktY29yZV8yLjAu
MC5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzIuMC4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjAuMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjAu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8yLjAuMS5iYgppbmRleCAw
OWIxYTIzNDBkLi44ZmIzOWE3ZDY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMi4wLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzIuMC4xLmJiCkBAIC0xNSw3ICsxNSw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiXAogICAgIGZpbGU6Ly9zcmMvcG9ldHJ5L2NvcmUvX3Zl
bmRvci90b21saS9MSUNFTlNFO21kNT1hYWFhZjA4NzlkMTdkZjAxMTBkMWFhOGM4YzlmNDZmNSBc
CiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMzE3YTNjYzM5MzIwMTFhNjExMTQyMzZiMmQ0
OTg4M2Y0ZmIxNDAzZDJmNWU5Nzc3MWFjMGQwNzdjZmEzOTZmIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjEwMTc3YzI3NzI0NjlkOTAzMmE0OWYwZDg3MDdhZjc2MWIxYzU5N2NlYTNiNGZiMzE1NDZl
NWNkNDM2ZWIxNTciCiAKIGluaGVyaXQgcHl0aG9uX3BvZXRyeV9jb3JlIHB5cGkKIAotLSAKMi40
NC4xCgo=

--===============3105945249110507877==--

