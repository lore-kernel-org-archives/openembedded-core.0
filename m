Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDACCF42113
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19729.1776261867843336968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M6VEzWzk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=t/YjLrzy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d91755f56-6fe005af-cfb3-44ac-b1fc-8d9452da0d64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261881;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ygncRSttkycH+cd+Ex9aKV7fhEOSd7DZ6EPJghl+iMY=;
	b=M6VEzWzk8zejOnp9yPyY0QJgKrdOCEA9BrI2JbHzWrPGBJt6CMFzJtrJZFhcgw1n
	2hI5cKvYHvgrjRxAbaSJo6gobdGkRN6wiR+4tZiAdMRjZyYHkY9+ye3ibzOgWwbbsec
	q7zokDCWExbbNriHopJjnyPu7Oy9WM+ZjYj7tPXU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261881;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ygncRSttkycH+cd+Ex9aKV7fhEOSd7DZ6EPJghl+iMY=;
	b=t/YjLrzyOSJ9A5ygKKPkfqD0+HpJ7yz6a6mFYkU97tgGHhTaftauRVPm5vf6RKam
	OuWnBruW8Cpf06z43oRRMnZA+Y/mywrLgJK4pMn3UP8UQCqDYm7PjTT56f++ZeURuWu
	EUIDjn78JQ2xA7VX3EZmRjOY/qINnbcUjFB7np04=
Content-Type: multipart/mixed; boundary="===============2800864830518760818=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.6.3 SUCCEEDED
Message-ID: <0101019d91755f56-6fe005af-cfb3-44ac-b1fc-8d9452da0d64-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235244

--===============2800864830518760818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyasn1* to *0.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.6.2-0.6.3.patch
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
From 59b3b848a9443bf98212e3205e848bb1516c3aef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:39:05 +0000
Subject: [PATCH] python3-pyasn1: upgrade 0.6.2 -> 0.6.3

---
 .../python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.2.bb => python3-pyasn1_0.6.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
index 01157e251e..fb572d9da4 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e9512629017833b"
+SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============2800864830518760818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-c91846ffdc7083e82f9c66b4e88ba0a526689413"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:c91846ffdc7083e82f9c66b4e88ba0a526689413"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 524 Local 509 Mirrors 0 Missed 15 Current 300 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 312 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 313 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 323 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 331 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 341 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 343 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 355 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 357 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 359 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 367 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 370 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 375 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 377 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 395 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 400 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 442 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 446 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 453 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 459 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-packaging/26.0/temp/log.do_packagedata_setscene.2558883
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 480 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 501 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 518 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 792 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_fetch)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 545 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_fetch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 559 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_fetch: Succeeded
NOTE: Running task 1045 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 574 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_unpack: Started
NOTE: Running task 1052 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1058 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1065 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_patch: Started
NOTE: recipe python3-packaging-26.0-r0: task do_package_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_patch: Succeeded
NOTE: Running task 1109 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1231 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1264 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 666 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 677 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 684 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running task 1280 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1311 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_deploy_source_date_epoch unihash changed to 12ccde59186f91309c4e1c771285b6d7fd35ea3a8f3782e0f6dfe0f6d33a02d9
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 700 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1327 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 753 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 762 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 769 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 779 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 781 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 794 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 806 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 822 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 824 of 824 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1750 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1870 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2012 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash a4c13e4e2ade56b194bc6bcc6a38cc9f04f0544d986dc89ed875d0b16e670df9 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f5c1ba4657e0d803ab020345699539174d32994f6aa8de58723479ebe2e6653e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'a4c13e4e2ade56b194bc6bcc6a38cc9f04f0544d986dc89ed875d0b16e670df9'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed f5c1ba4657e0d803ab020345699539174d32994f6aa8de58723479ebe2e6653e -> a4c13e4e2ade56b194bc6bcc6a38cc9f04f0544d986dc89ed875d0b16e670df9 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2053 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_configure)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_configure: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_configure: Succeeded
NOTE: Running task 2054 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2055 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_compile)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_compile: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_compile: Succeeded
NOTE: Running task 2056 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2057 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_install)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_install: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_install: Succeeded
NOTE: Running task 2058 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_install_ptest_base)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2059 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package)
NOTE: Running task 2060 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_populate_sysroot)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package: Succeeded
NOTE: Running task 2061 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_packagedata)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_packagedata: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_packagedata unihash changed to b2fe609e04421349b829d4f4446f390e43abaa57cb4de87762a72036c82fe7a6
NOTE: Setscene tasks completed
NOTE: Running task 2062 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_create_spdx)
NOTE: Running task 2063 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package_write_ipk)
NOTE: Running task 2064 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package_write_deb)
NOTE: Running task 2065 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package_write_rpm)
NOTE: Running task 2066 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package_qa)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_create_spdx: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package_qa: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2067 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_create_package_spdx)
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_create_package_spdx: Started
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package_qa unihash changed to 53f7513febdbc00e85ae616ceeed0628bc2ce371e533977bf18c0d55239303a5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package_write_ipk unihash changed to 223df073fbb9be61e18bba1ce0167d648d6f1657a97c5f4a6e2c846337e5d8f1
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package_write_rpm unihash changed to b4eb3f08e0d4298548e28a5a0bac518de45757aa078c90f4fa46f21a8424b83a
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_package_write_deb unihash changed to c5ba725f48383ec42092589f2753c087204654ae4d776b29a6217fb01e8bc8ac
NOTE: recipe python3-pyasn1-0.6.3-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2068 of 2068 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2068 tasks of which 2036 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:26.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:26.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-ptest went backwards which would break package feeds (from 0:26.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:26.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:26.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:26.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:26.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:26.1-r0 to 0:26.0-r0) [version-going-backwards]
ERROR: python3-packaging-26.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2800864830518760818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info -> /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info moved to /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info

--===============2800864830518760818==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.6.2-0.6.3.patch"

RnJvbSA1OWIzYjg0OGE5NDQzYmY5ODIxMmUzMjA1ZTg0OGJiMTUxNmMzYWVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6Mzk6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5YXNuMTogdXBncmFkZSAwLjYuMiAtPiAwLjYuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5YXNuMV8wLjYuMi5iYiA9PiBweXRob24zLXB5YXNuMV8wLjYuMy5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5YXNuMV8wLjYuMi5iYiA9PiBw
eXRob24zLXB5YXNuMV8wLjYuMy5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDgy
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24x
XzAuNi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHlhc24xXzAuNi4zLmJiCmluZGV4IDAxMTU3ZTI1MWUuLmZiNTcyZDlkYTQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC42LjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjYuMy5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3B5YXNuMS5zb3VyY2Vmb3JnZS5uZXQv
IgogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLnJzdDttZDU9MTkwZjc5MjUzOTA4Yzk4NmU2Y2FjZjM4MGMzYTVmNmQiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI5YjU5YTJiMjViYTdlNGY4MTk3ZGI3Njg2YzA5ZmIzM2U2NThiOTgz
MzlmYWRiODI2ZTk1MTI2MjkwMTc4MzNiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY5N2E4ZWNk
NmQ5ODg5MTE4OTE4NGNhMWZhMDVkMWJiMDBlMmY4NGI1OTc3YzQ4MTQ1MjA1MDU0OWM4YTcyY2Yi
CiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhv
bi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============2800864830518760818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyasn1: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.2.tar.gz;downloadfilename=pyasn1-0.6.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.3.tar.gz;downloadfilename=pyasn1-0.6.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyasn1: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 323993 to 334694 (+3%)
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info -> /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 828548 to 830153 (+0%)
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.6.2" to "0.6.3"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.6.2 [default] to 0.6.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.14/site-packages/pyasn1-0.6.2.dist-info moved to /usr/lib/python3.14/site-packages/pyasn1-0.6.3.dist-info

--===============2800864830518760818==--

