Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952FEEEB597
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102968.1767267472155256245
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=z0q9Gykv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Q1J+10r8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b79599f58-789b8a68-eab8-45ae-b11e-c2f75f2709f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jq8xi+h3eUTFvb6lfx/N9u+Sb7/+kTM+WqvO/YYKv3Y=;
	b=z0q9GykvnsV+AlUUtvh/2ucIkvm8+cUK0kwEjqOy9uP6EmIcVo1hRKpPsyXusMh3
	b76yvWj0/8i1YDj1jGvMgHcVCaqmlEFByvPDLx1L/jkjvFNumkksAYlE8sLCOpyS753
	NpGmP3I34x1Y2WJtR1b5X7Xbv2qgMAHs9QzYVuHg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jq8xi+h3eUTFvb6lfx/N9u+Sb7/+kTM+WqvO/YYKv3Y=;
	b=Q1J+10r8fvmqSz48QJ9xC+7+zGHq/vyRUoYKkshwKXNkbel5FAuvQWBhqB9+NQ5d
	Er8kWAJpZD+EcFhNiP5VB9G5TFo07JttzeLRfIt99msgV71HTly+jphMRMWEnYzH9b1
	DTWO/wTCpZPwWwZlbrbSIREaE8nrrVJu5DvedNoo=
Content-Type: multipart/mixed; boundary="===============2049305727569322143=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 9.1.0 SUCCEEDED
Message-ID: <0101019b79599f58-789b8a68-eab8-45ae-b11e-c2f75f2709f8-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228781

--===============2049305727569322143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *9.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-9.0.4-9.1.0.patch
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
From f49d42f091262011ece2594d82205d7e02bb9b91 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 08:11:55 +0000
Subject: [PATCH] python3-sphinx: upgrade 9.0.4 -> 9.1.0

---
 .../python/{python3-sphinx_9.0.4.bb => python3-sphinx_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_9.0.4.bb => python3-sphinx_9.1.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
index 00384b40e9..dc8ee18de1 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "594ef59d042972abbc581d8baa577404abe4e6c3b04ef61bd7fc2acbd51f3fa3"
+SRC_URI[sha256sum] = "7741722357dd75f8190766926071fed3bdc211c74dd2d7d4df5404da95930ddb"
 
 inherit python_flit_core pypi
 
-- 
2.47.1


--===============2049305727569322143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx: PKGV changed from 9.0.4 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx: PV changed from "9.0.4" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-9.0.4.tar.gz;downloadfilename=sphinx-9.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-9.1.0.tar.gz;downloadfilename=sphinx-9.1.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 9.0.4 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "9.0.4" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 9.0.4 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "9.0.4" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 9.0.4 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "9.0.4" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 9.0.4 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "9.0.4" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 9.0.4 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "9.0.4" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 9.0.4 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "9.0.4" to "9.1.0"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 18700945 to 18731104 (+0%)
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info -> /usr/lib/python3.13/site-packages/sphinx-9.1.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info/licenses -> /usr/lib/python3.13/site-packages/sphinx-9.1.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 9.0.4 [default] to 9.1.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PV changed from "9.0.4" to "9.1.0"
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-9.1.0.dist-info

--===============2049305727569322143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-d647c2b1da4cc9ddadb8be41b218311151763028"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:d647c2b1da4cc9ddadb8be41b218311151763028"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 611 Local 434 Mirrors 0 Missed 177 Current 268 (71% match, 79% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 281 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 353 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 389 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 390 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 406 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 506 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 507 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 510 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 511 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 519 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-certifi-2025.11.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 523 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 528 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 540 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 541 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-urllib3-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 556 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_setscene)
NOTE: recipe python3-docutils-0.22.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_setscene)
NOTE: Running setscene task 563 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 572 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 595 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 891 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_fetch)
NOTE: Running task 895 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_fetch)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 904 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_fetch)
NOTE: Running task 905 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 945 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: Running task 946 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_fetch)
NOTE: Running task 947 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 962 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_recipe_qa)
NOTE: Running task 977 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_fetch)
NOTE: Running task 978 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_fetch)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Started
NOTE: Running setscene task 640 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: Running task 979 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_unpack)
NOTE: recipe python3-babel-2.17.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.11-r0: task do_fetch: Succeeded
NOTE: Running task 980 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_unpack)
NOTE: Running task 981 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_unpack)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 982 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_unpack)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 644 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 984 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 985 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_fetch)
NOTE: Running task 986 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_fetch)
NOTE: recipe python3-docutils-0.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 987 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_fetch)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 988 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_fetch)
NOTE: Running task 989 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 992 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_fetch)
NOTE: recipe python3-packaging-25.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 654 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 657 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.11-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_fetch: Started
NOTE: Running setscene task 659 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_fetch: Started
NOTE: Running setscene task 663 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running task 993 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_patch)
NOTE: recipe python3-pytz-2025.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 666 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_patch)
NOTE: Running task 1000 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_patch)
NOTE: Running task 1001 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_patch)
NOTE: Running task 1002 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_fetch)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1003 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_fetch)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1006 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_fetch)
NOTE: recipe libarchive-3.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Started
NOTE: Running setscene task 670 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Started
NOTE: recipe python3-idna-3.11-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_fetch: Started
NOTE: Running setscene task 671 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 672 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1013 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1024 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1026 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_fetch)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1037 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1038 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libarchive-3.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1050 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_unpack)
NOTE: Running setscene task 691 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_patch: Succeeded
NOTE: Running setscene task 702 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running task 1066 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1081 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_unpack)
NOTE: recipe python3-pygments-2.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running setscene task 704 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-25.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-25.0-r0: task do_fetch: Succeeded
NOTE: Running task 1082 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: Running task 1083 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1084 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_unpack: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1085 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_unpack)
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: Running task 1086 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-packaging-25.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_unpack: Started
NOTE: Running setscene task 717 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running task 1102 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1109 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_fetch)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: Running task 1110 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_unpack)
NOTE: recipe python3-babel-2.17.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 729 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.22.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 736 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch unihash changed to f5fb11a830ca434568e1253f47338aa1f1dac9a3e3a89255813a1f2d1c62c571
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_fetch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_unpack: Started
NOTE: Running task 1116 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1117 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 747 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1133 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_unpack)
NOTE: Running setscene task 750 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 755 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_patch: Started
NOTE: Running setscene task 756 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 757 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 758 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 759 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 761 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 770 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 771 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 775 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 807 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 812 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1170 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_unpack)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 1176 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 828 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1197 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_unpack)
NOTE: Running task 1198 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_unpack)
NOTE: Running task 1199 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_unpack)
NOTE: Running task 1200 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1206 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 833 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_unpack: Started
NOTE: Running task 1214 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1221 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_patch)
NOTE: Running task 1228 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_unpack: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_unpack: Started
NOTE: Running task 1229 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_patch)
NOTE: Running setscene task 838 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 839 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_unpack: Succeeded
NOTE: Running task 1246 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_patch)
NOTE: Running task 1247 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_patch)
NOTE: Running task 1248 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1249 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_patch)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_patch: Started
NOTE: Running task 1260 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_patch)
NOTE: Running task 1261 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_patch)
NOTE: Running task 1262 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_check_backend)
NOTE: Running task 1263 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.22.3-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_patch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_patch: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_check_backend: Started
NOTE: Running task 1264 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_check_backend: Succeeded
NOTE: Running task 1270 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.22.3-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1329 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1336 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1337 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1338 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1340 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 847 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1341 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1344 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1345 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1346 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1352 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1353 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch unihash changed to 29b2d2009b0b936ed2d026f93fa18bb3f723303aebc56f4601a0cae395097392
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_deploy_source_date_epoch unihash changed to 565b97bca9beaca29ad9b430c844f73dd22f75f02b34df3d82f92de59ac4add5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_deploy_source_date_epoch unihash changed to af9c413c28d93db4ece1139e3fcdfc06c5e69b60b018894d85b174209000e6bf
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_deploy_source_date_epoch unihash changed to e50bc13a57a199718e3d9c3aa8b8b83d5dcf51545ee5d1aebb4da8dbf20ea81f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_deploy_source_date_epoch unihash changed to 591dde05ef9a1e8bec07a1915686ce7e76ffa1398d97120ed6cb4e0fbc1b95b8
NOTE: recipe python3-alabaster-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_deploy_source_date_epoch unihash changed to c98f58f9d296ee58cf214f64e339194d8bff3467118683797c2da6aa92d04ad8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_deploy_source_date_epoch unihash changed to 4c00e843968cb26a6a184eb5d078c682f6ac73177f1e436e9fa256418125d979
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch unihash changed to 0c7551cfe442b254e48a1e73993eed88000f2a2389e8764b917556d7afae9b5a
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_deploy_source_date_epoch unihash changed to 0a5e1f6859e692cf09e54512bbd5f0955db319aaf6b9cfa03cda2a85d3d2314c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_deploy_source_date_epoch unihash changed to d191c2f06a588dfadcec7b1a1e07d28c407f85a4c601795c2c632fcc0afdeb2c
NOTE: recipe python3-babel-2.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_deploy_source_date_epoch unihash changed to 63c4e39be74cd9dad2dd89e8bf1ae4886da8578e533019d5c199266d38127768
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_deploy_source_date_epoch unihash changed to fd8ffc195c8ae9bb587a1f28b26041c42462490d7a1ee04da28658d7b0740454
NOTE: Running setscene task 772 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 854 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1354 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1355 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1356 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1357 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1358 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1366 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_fetch)
NOTE: Running task 1367 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1377 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_check_backend)
NOTE: Running task 1378 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_check_backend)
NOTE: Running task 1379 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_check_backend)
NOTE: Running task 1393 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_fetch)
NOTE: Running task 1394 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_fetch)
NOTE: Running task 1395 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_check_backend: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_check_backend: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_check_backend: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_check_backend: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-urllib3-2.6.2-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_fetch: Started
NOTE: Running task 1406 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: recipe python3-certifi-2025.11.12-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1444 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_unpack)
NOTE: Running task 1445 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_unpack)
NOTE: Running task 1451 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1492 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_populate_lic)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_fetch: Succeeded
NOTE: Running setscene task 856 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: Running task 1493 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_unpack)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_unpack: Started
NOTE: Running setscene task 859 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 860 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe python3-urllib3-2.6.2-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2025.11.12-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_populate_lic: Started
NOTE: Running task 1495 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_patch)
NOTE: recipe python3-urllib3-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1496 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1497 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1498 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_deploy_source_date_epoch unihash changed to f3389b681c49c32c799b343f53b4ff82b58725eab6c19241a2bdb2fa363a4f54
NOTE: recipe python3-urllib3-2.6.2-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_deploy_source_date_epoch unihash changed to 22c300f9feaf38030d03b54d8cf6f0a295d7a9c8818f837248101cbb1799cc02
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch unihash changed to 6bd4010145a8e9269bc2e9f06026ed45f2af2fdaf9ad7ffe431b4d846063d0f2
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_deploy_source_date_epoch unihash changed to c35294f67615a84210f85ef8e62e9725adad718690ea75bb97dbc901cc3645ce
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 826 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 840 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1513 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1514 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1515 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_check_backend)
NOTE: Running task 1516 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1517 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1518 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pretend-1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1520 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_check_backend)
NOTE: Running task 1521 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Started
NOTE: recipe python3-certifi-2025.11.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_check_backend: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-urllib3-2.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_deploy_source_date_epoch unihash changed to 8da62d402d9f2c8a96f1946aaa273f7debabc28df99c144e37c34850081adff9
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_deploy_source_date_epoch unihash changed to 37df65b8d65be61049593b33c49d98e6dd4a82174d8513beeba6fa0291c6ea79
NOTE: recipe python3-pretend-1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch unihash changed to 6297db971db6fce87553fa432abd290d0793628a8382c103283480e86ffe5fec
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_deploy_source_date_epoch unihash changed to 0880d7c07cb1dd59d449925dbccd16855e2853295b2c26b17ec66cd0b3c9342b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_deploy_source_date_epoch unihash changed to 9c51bceb88e3029a5a7336099296f20d451bbebd8068483b43a463fcff6b99da
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1838 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1839 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1894 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1895 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1896 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1949 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1950 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1951 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1952 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1953 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1954 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-packaging-25.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1955 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1956 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1957 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytz-2025.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1958 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-25.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1960 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure)
NOTE: recipe python3-idna-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1961 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1962 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_configure: Started
NOTE: Running task 1963 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1964 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1965 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1966 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure: Started
NOTE: Running task 1967 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1968 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1969 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.19.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1970 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_configure)
NOTE: Running task 1971 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_configure)
NOTE: Running task 1972 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_configure)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Started
NOTE: Running task 1973 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_configure)
NOTE: recipe python3-packaging-25.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_configure: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_configure: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1974 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_configure_ptest_base)
NOTE: recipe python3-idna-3.11-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_configure: Started
NOTE: Running task 1975 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure_ptest_base)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_configure: Succeeded
NOTE: Running task 1977 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_compile)
NOTE: recipe python3-packaging-25.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure: Succeeded
NOTE: Running task 1978 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_configure_ptest_base)
NOTE: Running task 1979 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-25.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_configure: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1980 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_configure)
NOTE: recipe python3-pygments-2.19.2-r0: task do_configure: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 1981 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1982 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_compile)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1983 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_configure)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_compile: Started
NOTE: Running task 1984 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_configure)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 1985 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile)
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1986 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-idna-3.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 1987 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile)
NOTE: Running task 1988 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_compile)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1989 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_configure)
NOTE: Running task 1990 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_compile: Started
NOTE: Running task 1991 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_compile)
NOTE: Running task 1992 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_compile)
NOTE: recipe python3-requests-2.32.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1993 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1994 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_configure)
NOTE: recipe python3-babel-2.17.0-r0: task do_configure: Started
NOTE: Running task 1995 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: Running task 1996 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_configure)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_compile: Started
NOTE: Running task 1997 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_configure)
NOTE: recipe python3-docutils-0.22.3-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 1998 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1999 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_compile)
NOTE: recipe python3-requests-2.32.5-r0: task do_configure: Succeeded
NOTE: Running task 2000 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2001 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2002 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_compile)
NOTE: Running task 2003 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_compile: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2004 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_compile)
NOTE: recipe python3-requests-2.32.5-r0: task do_compile: Started
NOTE: recipe python3-packaging-25.0-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_compile_ptest_base)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2006 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile_ptest_base)
NOTE: recipe python3-idna-3.11-r0: task do_compile: Succeeded
NOTE: Running task 2007 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_compile)
NOTE: recipe python3-packaging-25.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-25.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2008 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_compile: Started
NOTE: Running task 2009 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2010 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install)
NOTE: recipe python3-docutils-0.22.3-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: Running task 2011 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_compile)
NOTE: recipe python3-packaging-25.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2012 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_compile)
NOTE: Running task 2013 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2015 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_install)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_install: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2016 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_install)
NOTE: Running task 2017 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2018 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_install)
NOTE: recipe python3-docutils-0.22.3-r0: task do_install: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_install: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-packaging-25.0-r0: task do_install: Succeeded
NOTE: Running task 2019 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2020 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install: Succeeded
NOTE: Running task 2021 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_install)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_install_ptest_base: Started
NOTE: Running task 2022 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install_ptest_base)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-packaging-25.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install_ptest_base: Started
NOTE: Running task 2024 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_install)
NOTE: Running task 2025 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_compile: Succeeded
NOTE: Running task 2027 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2028 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_install)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package: Started
NOTE: Running task 2029 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2030 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package)
NOTE: Running task 2032 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_install)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2033 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: Running task 2034 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package)
NOTE: recipe python3-docutils-0.22.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package: Started
NOTE: Running task 2036 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2037 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package)
NOTE: recipe python3-docutils-0.22.3-r0: task do_package: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_install: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_install: Succeeded
NOTE: Running task 2038 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2039 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package)
NOTE: Running task 2040 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_install: Succeeded
NOTE: Running task 2041 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2042 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_install: Succeeded
NOTE: Running task 2060 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_install: Succeeded
NOTE: Running task 2061 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package: Succeeded
NOTE: Running task 2068 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package: Succeeded
NOTE: Running task 2071 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Running task 2083 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_compile_ptest_base)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 2084 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_packagedata unihash changed to 94c869f1a618c189c55a33347e18546d1d1fc13aa8cd5782d0daa79e53df310f
NOTE: Setscene tasks completed
NOTE: Running task 2085 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata)
NOTE: recipe python3-babel-2.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2086 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_install)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Started
NOTE: Running task 2087 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile_ptest_base)
NOTE: Running task 2088 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_compile_ptest_base)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata unihash changed to 6aba410dea297f6e377c576f9ad92b62ae6b999b7b881fd0165847f33b51b0cf
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2093 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_install)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-idna-3.11-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2095 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install)
NOTE: Running task 2097 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2098 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pytz-2025.2-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata unihash changed to 77644bc2a452a77df034a43664fea6e443d56dff9a3364b45c4a77268edfe1d5
NOTE: recipe python3-requests-2.32.5-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: Running task 2099 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_packagedata)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Started
NOTE: recipe python3-idna-3.11-r0: task do_install: Started
NOTE: Running task 2100 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata: Started
NOTE: Running task 2138 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata unihash changed to 5f353e1ee395936f60952b0165251d3349acbb26ecff9c76c130022307a8cea2
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 2139 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Started
NOTE: Running task 2141 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2142 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2143 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata unihash changed to a7a86312d105bd76f6aedd3a9ae841cb3e876e4d28348217b3cb8d7e21bc4785
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_packagedata unihash changed to 09b2a15c9c88039df9ccc8594d8331e71aa5e9ab88126edaa043fd596b74ede8
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata unihash changed to 77b666db8ab8c0da350c614e0f6e89afc1fcdee04c9a2849eaef95af4d12e6d3
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_packagedata unihash changed to 832d304531ae1dd49e6ab5c38348cc0db2aa48634d351171f42588dfad8b6bf0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata unihash changed to 5c855158c54e0c27fc2ed89fa70df60e2ab7b7be8ff7fdbef0756ce26a4910b1
NOTE: Setscene tasks completed
NOTE: Running task 2144 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata)
NOTE: Running task 2145 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2146 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pretend-1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2170 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_configure)
NOTE: Running task 2171 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install_ptest_base)
NOTE: Running task 2172 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_install_ptest_base)
NOTE: Running task 2198 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package: Succeeded
NOTE: Running task 2199 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 2200 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata: Started
NOTE: Running task 2201 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata)
NOTE: recipe python3-certifi-2025.11.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Started
NOTE: Running task 2202 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_install_ptest_base)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-2.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2203 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_compile)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_install_ptest_base: Started
NOTE: Running task 2205 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.6.2-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_package: Succeeded
NOTE: Running task 2206 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package)
NOTE: Running task 2207 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_package)
NOTE: Running task 2208 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata unihash changed to 34505ad6adca016795b81a0fdac68a4643bd91bf9b7c6eef4b32570fc15ccbd4
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-urllib3-2.6.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Started
NOTE: Running task 2209 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-docutils-0.22.3-r0: task do_packagedata: Started
NOTE: recipe python3-idna-3.11-r0: task do_package: Started
NOTE: Running task 2210 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_compile)
NOTE: Running task 2211 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_package)
NOTE: Running task 2212 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata unihash changed to 773ca8d4dfcd0466b1e3be2dc4a0a94e51f4b29e8cd3b94f3dc2fee5a10c72a5
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata unihash changed to 7e55ac304aa8131f989eed92e8d1105883ab5dc536776325e6f74a50b6849549
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.6.2-r0: task do_compile: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-certifi-2025.11.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2213 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package)
NOTE: Running task 2214 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_configure)
NOTE: Running task 2215 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_configure)
NOTE: Running task 2216 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_collect_spdx_deps)
NOTE: Running task 2217 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_populate_sysroot)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2218 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_collect_spdx_deps)
NOTE: Running task 2219 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: recipe python3-babel-2.17.0-r0: task do_package: Started
NOTE: recipe python3-certifi-2025.11.12-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-certifi-2025.11.12-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2220 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_compile)
NOTE: recipe python3-chardet-5.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_compile)
NOTE: Running task 2222 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-9.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2223 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pygments-2.19.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2224 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_populate_sysroot)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_compile: Started
NOTE: Running task 2225 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-chardet-5.2.0-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-packaging-25.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-packaging-25.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-packaging-25.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2226 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2227 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2228 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_install)
NOTE: Running task 2229 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2230 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Started
NOTE: recipe python3-packaging-25.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_populate_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2232 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pygments-2.19.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2233 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2234 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-urllib3-2.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2235 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: Running task 2236 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 2237 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.6.2-r0: task do_install: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_install: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_package: Succeeded
NOTE: Running task 2238 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_collect_spdx_deps)
NOTE: Running task 2239 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_package)
NOTE: Running task 2240 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2241 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_populate_sysroot)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2242 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_packagedata)
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Started
NOTE: Running task 2243 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-idna-3.11-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2244 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2245 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_collect_spdx_deps)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2246 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_populate_sysroot)
NOTE: recipe python3-certifi-2025.11.12-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_install)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 2248 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-requests-2.32.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-idna-3.11-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata unihash changed to bbae4be73f53ece5eca1e8c5dcf79321978ebec385212dd8f7db32ff8add7716
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_packagedata unihash changed to bc49204c5083c2689965e284d72670f515a082dc8cdde8ffb5ec66a67a6a161f
NOTE: recipe python3-requests-2.32.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.6.2-r0: task do_install: Succeeded
NOTE: Running task 2249 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_install)
NOTE: Running task 2250 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_package)
NOTE: Running task 2251 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_collect_spdx_deps)
NOTE: Running task 2252 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_populate_sysroot)
NOTE: Running task 2253 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 2254 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.6.2-r0: task do_package: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2255 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2256 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-requests-2.32.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2257 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2258 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2259 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_package)
NOTE: recipe python3-babel-2.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2260 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2261 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_create_spdx)
NOTE: Running task 2262 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_create_spdx)
NOTE: recipe python3-certifi-2025.11.12-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_packagedata: Started
NOTE: Running task 2263 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_create_spdx)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2264 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2265 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_create_spdx)
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_package: Succeeded
NOTE: Running task 2266 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb:do_create_spdx)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2267 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_install: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_package: Succeeded
NOTE: Running task 2268 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_create_spdx)
NOTE: Running task 2269 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_package)
NOTE: Running task 2270 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2271 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata)
NOTE: Running task 2272 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_create_spdx)
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sphinx-9.1.0-r0: task do_create_spdx: Started
NOTE: Running task 2273 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx)
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx: Started
NOTE: Running task 2274 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2275 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_create_spdx)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2276 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx)
NOTE: recipe python3-requests-2.32.5-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2277 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata unihash changed to 6ff9a4754cd93d6861a91e24fbd66a83de631adb18f4890ee831d5f14611f5a6
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2278 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_create_spdx)
NOTE: Running task 2279 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_create_spdx)
NOTE: Running task 2280 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_ipk)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2281 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata unihash changed to 4fe9cc7a5ee39df839d0eecb4686fccc1a581cd27bfc7fc9fd2b6c09e1a09110
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2282 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2283 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_qa)
NOTE: Running task 2284 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_ipk)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx: Started
NOTE: Running task 2285 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx: Started
NOTE: Running task 2286 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_rpm)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinx-9.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk: Started
NOTE: Running task 2287 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa)
NOTE: recipe python3-urllib3-2.6.2-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2288 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb:do_packagedata)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata unihash changed to e3e0ed06944cf4fc484fde9c8166e6abe5ee6b8e3c22f4ec4d75f74fe5b51459
NOTE: recipe python3-urllib3-2.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa: Started
NOTE: Running task 2289 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_ipk)
NOTE: recipe python3-certifi-2025.11.12-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2290 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_packagedata)
NOTE: Running task 2291 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_deb)
NOTE: Running task 2292 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_rpm)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-certifi-2025.11.12-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_ipk unihash changed to fa69c3294cbb6f83c2d98f460d61bff5909d2df54512f4e964a879bc0455fc9a
NOTE: Running task 2293 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_qa)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_deb unihash changed to b3dff8f84d70a078ef602ce951368eb979c8dce6357c2054ecdbff66d3b623dd
NOTE: Running task 2294 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_packagedata)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2295 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_qa unihash changed to 93a1f8ffa26470a8779d6888a689a0598341968560fc982108062d80eea66a13
NOTE: Running task 2296 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb)
NOTE: recipe python3-urllib3-2.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-certifi-2025.11.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2297 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_rpm unihash changed to f9a2217ac2c9aa3f18d2710ebdcd9aec148ac7ca9af32ff39554c298c1d54b32
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb:do_packagedata unihash changed to d3728f19b73458bb0301fe934c18e07b2bf9833795d3e8b6eb2cc4d4c180ce3a
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata: Started
NOTE: Running task 2298 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_qa)
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa: Started
NOTE: Running task 2299 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2300 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_ipk unihash changed to 448fad1b72608f178045f723cc1c0c90ec1721148fd148acfeb7779a2fd01830
NOTE: Running task 2301 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_packagedata unihash changed to 70cdec378c3b7f2b78fe98e630fd5b4d8df232aa4fea24a685d785832960f82f
NOTE: recipe python3-chardet-5.2.0-r0: task do_package: Succeeded
NOTE: Running task 2302 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata)
NOTE: Running task 2303 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_deb unihash changed to 82eee9cfc07cf66b2d6849a41f7a54aac356df17b31d6d8a9d7803de37d4755e
NOTE: Running task 2304 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_qa)
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_qa unihash changed to dd9d44b54a82e0043641238bc15c4f55c14d066cc3eee50c314a48dcf6b99866
NOTE: Running task 2305 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa unihash changed to 4d04a45548a92f4586fc9df71db96b3d220554090f28ec610d277813277a0a0d
NOTE: Running task 2306 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk unihash changed to bfc1487dad1726828cb202ae53f15163e33be9a7e440ac340d95149a4c15670f
NOTE: Running task 2307 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb unihash changed to b44d81cd8edcb47373eb0ccbe3f603f0528331907954a939d94353d82a491e71
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_qa unihash changed to 7230e9b0e14ad322beda50f3a808c6e646b193efc2d2fc8d3c43b4916f8cca73
NOTE: Running task 2308 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_qa)
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm unihash changed to 49dabeb3f9cec1892b0604f1d3d5568f99ec9c83f59468111f72c115f4ea6bfe
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata unihash changed to 0248d0a7f066fe4b8cad11b6ac7f5282474738f7f42ffd61fc497390a8504608
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_rpm unihash changed to 0d30796f2549d82af2c03e646ab7b23347d148ed4c7ccf4ac70194060ce22fc1
NOTE: Running task 2309 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb: Started
NOTE: Running task 2310 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 2311 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm)
NOTE: Running task 2312 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_qa)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk unihash changed to 371b6733286a0f1f4a0721fa6498d0c515aabd0727d88343db07b0deddcadc55
NOTE: Running task 2313 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_ipk)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb unihash changed to fe5e88f29999b3581a15ee21dedb106518d7cbc5656a4fd035a40ed00997da04
NOTE: Running task 2314 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_qa unihash changed to e7ffc051e0c4860132ab7893be7e25cec067ba107234efc2f8eb7a7f9d393b6b
NOTE: Running task 2315 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm unihash changed to f604375f226afe6f97e0058b6e8a6086efcda3c0e63a3bf5a7de236a08a51217
NOTE: Running task 2316 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_qa)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2317 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_ipk)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk: Started
NOTE: Running task 2318 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_deb)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk unihash changed to bca8fab15a84aba6f546f823534f4e8c6eb7df8a4d92b895a1c297219d7d3ea2
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_qa unihash changed to ef83e581ce1e5e6546d2cca011acd455618d119283abeb8e11c257db9b74eb81
NOTE: Running task 2319 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_rpm)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb unihash changed to 141a87f5c2dc8d68bf30905af3f511a28eebc3c86b162164d4421b57721dbd55
NOTE: Running task 2320 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_qa)
NOTE: Running task 2321 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk)
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm unihash changed to 281c30f57e83089eb0158f71688c8c79a8dfab3be4b456ab4919deb0e622d626
NOTE: Running task 2322 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_qa unihash changed to 53ba7de8dc1e34e524674e1581f35ed18baed61f7e35c5ed925887eb5087d45b
NOTE: Running task 2323 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk unihash changed to e964b7fc21e97b8d073c888504b4370990b93ad49b8f144cfdec2132c4d3bee3
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_ipk unihash changed to 2f46d5e8ce01fea5f406c4f71a67d547569331cf499a8488f177a6a72f5219da
NOTE: Running task 2324 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb unihash changed to 3c70282d689a57a5da3dfc7b6774be1cd4ccb6af36aa93fb6986eadefb924a70
NOTE: Running task 2325 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_ipk)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa: Succeeded
NOTE: Running task 2326 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_deb)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_qa unihash changed to 2cc4dccf4f589301c516a46c5ec42417f958cf09723023a2d1885a3a280625c6
NOTE: Running task 2327 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_rpm)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_deb: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm unihash changed to f07e83b6066c151575909c77a18a3df2545b83ec9a5e4f622dda6fe5c12fd16c
NOTE: Running task 2328 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_qa)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_rpm unihash changed to e4afba6dabdb07266e35a85248f08578d8ebe2c41a0de7d8bbb278f0b3cf71dc
NOTE: Running task 2329 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_qa: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_deb unihash changed to abd7bf0abde59d68202a285f729451bb73b1c670f56b1cbe1636bbed10f8298d
NOTE: Running task 2330 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk unihash changed to ec0100cdcb089a0890835500e3f70545883ca9e1703150659e4a0baeedc4426e
NOTE: Running task 2331 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_ipk unihash changed to fc5682117425d08de30b85f2c250949cbdb2e6795578ed795fa1c91c16aeb6a8
NOTE: Running task 2332 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_qa)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa unihash changed to f2be06b77bffd3605dbbe959f06f00a631769011e23a63de271016edad547168
NOTE: Running task 2333 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_qa: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_qa unihash changed to 0dbba6183f935d32a4cf0f3d473cd7ec7c1f915b69c0567e0cd0eb52fde0c0af
NOTE: Running task 2334 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_ipk unihash changed to 12e749893600e196bd3448f16f54471dfabc11d4ef11ce6d98ae5bd66dd1603d
NOTE: Running task 2335 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm unihash changed to 0cd00bdef481b28430d1b4fcd9c442d15433cf498bbb42244126c59b0837691f
NOTE: Running task 2336 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_qa)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb unihash changed to df1733f84fee1b126271d303b8b94e0ef6b62dcd920ba57c9394a0c48f9a4a62
NOTE: Running task 2337 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_ipk)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_rpm unihash changed to aa5cfaf4242aa74dd3c0b04b7440ddc6146895c42f0e9c3dd108007afd2cc279
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_deb unihash changed to 5da87fa5268e07d4ca8ef09a8da54af107a169713707361686c82f598939f1fb
NOTE: Running task 2338 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_deb)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk unihash changed to 915ccf943670c55372416ee894cb1a26c5878bd5c8d0fbeeeef942b17d878050
NOTE: Running task 2339 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_rpm)
NOTE: Running task 2340 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_qa)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb unihash changed to 770c1a6b1bda4074ac9d99b53bda2fb03304c7472d8e8f4fe385782da2cea680
NOTE: Running task 2341 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_ipk)
NOTE: recipe python3-docutils-0.22.3-r0: task do_packagedata: Failed
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb: Succeeded
NOTE: Tasks Summary: Attempted 2341 tasks of which 1958 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101081126.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101081126.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-docutils/0.22.3/temp/log.do_packagedata.3417925
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-docutils-0.22.3-r0 do_packagedata: QA Issue: Package version for package python3-docutils-src went backwards which would break package feeds (from 0:0.22.4-r0 to 0:0.22.3-r0) [version-going-backwards]
ERROR: python3-docutils-0.22.3-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dbg went backwards which would break package feeds (from 0:0.22.4-r0 to 0:0.22.3-r0) [version-going-backwards]
ERROR: python3-docutils-0.22.3-r0 do_packagedata: QA Issue: Package version for package python3-docutils-staticdev went backwards which would break package feeds (from 0:0.22.4-r0 to 0:0.22.3-r0) [version-going-backwards]
ERROR: python3-docutils-0.22.3-r0 do_packagedata: QA Issue: Package version for package python3-docutils-dev went backwards which would break package feeds (from 0:0.22.4-r0 to 0:0.22.3-r0) [version-going-backwards]
ERROR: python3-docutils-0.22.3-r0 do_packagedata: QA Issue: Package version for package python3-docutils-doc went backwards which would break package feeds (from 0:0.22.4-r0 to 0:0.22.3-r0) [version-going-backwards]
ERROR: python3-docutils-0.22.3-r0 do_packagedata: QA Issue: Package version for package python3-docutils-locale went backwards which would break package feeds (from 0:0.22.4-r0 to 0:0.22.3-r0) [version-going-backwards]
ERROR: python3-docutils-0.22.3-r0 do_packagedata: QA Issue: Package version for package python3-docutils went backwards which would break package feeds (from 0:0.22.4-r0 to 0:0.22.3-r0) [version-going-backwards]
ERROR: python3-docutils-0.22.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-docutils/0.22.3/temp/log.do_packagedata.3417925
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_packagedata) failed with exit code '1'

--===============2049305727569322143==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-9.0.4-9.1.0.patch"

RnJvbSBmNDlkNDJmMDkxMjYyMDExZWNlMjU5NGQ4MjIwNWQ3ZTAyYmI5YjkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwODoxMTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDkuMC40IC0+IDkuMS4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc3BoaW54XzkuMC40LmJiID0+IHB5dGhvbjMtc3BoaW54XzkuMS4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzkuMC40LmJiID0+IHB5
dGhvbjMtc3BoaW54XzkuMS4wLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfOS4wLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzkuMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhf
OS4wLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbnhfOS4xLjAuYmIKaW5kZXggMDAzODRiNDBlOS4uZGM4ZWUxOGRlMSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF85LjAuNC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzkuMS4wLmJiCkBA
IC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQlNELTIt
Q2xhdXNlICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1
PWUzMGMzN2EyYjdmYjBhZmEzYWRjMGQ3MmI4NWU4YjA0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNTk0ZWY1OWQwNDI5NzJhYmJjNTgxZDhiYWE1Nzc0MDRhYmU0ZTZjM2IwNGVmNjFiZDdmYzJh
Y2JkNTFmM2ZhMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NzQxNzIyMzU3ZGQ3NWY4MTkwNzY2
OTI2MDcxZmVkM2JkYzIxMWM3NGRkMmQ3ZDRkZjU0MDRkYTk1OTMwZGRiIgogCiBpbmhlcml0IHB5
dGhvbl9mbGl0X2NvcmUgcHlwaQogCi0tIAoyLjQ3LjEKCg==

--===============2049305727569322143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info -> /usr/lib/python3.13/site-packages/sphinx-9.1.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info/licenses -> /usr/lib/python3.13/site-packages/sphinx-9.1.0.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-9.1.0.dist-info

--===============2049305727569322143==--

