Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1474BC54EE6
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:15 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1245.1710522012291215033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bhgPZygB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Voi41Lx5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e430e8fcb-e3ea835b-799a-4f6e-89a2-6b545b3a04e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XclkP5aEqbNUOvTpzEpI3HQxyAzgCCePtbUE3tXr4ak=;
	b=bhgPZygBah8cXmhSQFC1Fm8KZZqqknWD1AWM/03eCqmk7W2deLu39k6o2ZBhRBI7
	u7vbCHN1SPq7cdRVKl/XD45NUk3JuCxWzBvnwlSieL2SFn1UjS/6SAoU4+FuwCbUHTd
	XOIICfh5kLVUdptY/WNP5a5mRJENrvypvXOBbb30=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522011;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XclkP5aEqbNUOvTpzEpI3HQxyAzgCCePtbUE3tXr4ak=;
	b=Voi41Lx59Q8Rk6OcTT/K+UHJFzlPNaShXbvTyH1lfBN1H+UX3hUUmFYOjvNpPolr
	ONhn+pySJf8fpg8bOV5oYIycizh6CuJYqPMMoMVu1lonMz5PIu4c41JU8UkQA+5xGbJ
	y5Hm49EW2C2f9hDQjy55KpQUx2IdM9VIYHpxGhiE=
Content-Type: multipart/mixed; boundary="===============1204496099574789425=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2024.3.3 SUCCEEDED
Message-ID: <0101018e430e8fcb-e3ea835b-799a-4f6e-89a2-6b545b3a04e2-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197179

--===============1204496099574789425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2024.3.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-trove-classifiers-upgrade-2024.2.23-2024.3.3.patch
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
From ed02553cb378d5a3b271f1b646b174a0b1edd7ea Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 09:12:18 +0000
Subject: [PATCH] python3-trove-classifiers: upgrade 2024.2.23 -> 2024.3.3

---
 ...fiers_2024.2.23.bb => python3-trove-classifiers_2024.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.2.23.bb => python3-trove-classifiers_2024.3.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb
index 8514a52616..b912efcf55 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.2.23.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "8385160a12aac69c93fff058fb613472ed773a24a27eb3cd4b144cfbdd79f38c"
+SRC_URI[sha256sum] = "df7edff9c67ff86b733628998330b180e81d125b1e096536d83ac0fd79673fdc"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.42.0


--===============1204496099574789425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-trove-classifiers: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2024.2.23.tar.gz;downloadfilename=trove-classifiers-2024.2.23.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/t/trove-classifiers/trove-classifiers-2024.3.3.tar.gz;downloadfilename=trove-classifiers-2024.3.3.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-trove-classifiers: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers: PV changed from "2024.2.23" to "2024.3.3"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dbg: PV changed from "2024.2.23" to "2024.3.3"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-dev: PV changed from "2024.2.23" to "2024.3.3"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-doc: PV changed from "2024.2.23" to "2024.3.3"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-locale: PV changed from "2024.2.23" to "2024.3.3"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-ptest: PV changed from "2024.2.23" to "2024.3.3"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-src: PV changed from "2024.2.23" to "2024.3.3"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers-staticdev: PV changed from "2024.2.23" to "2024.3.3"
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGV changed from 2024.2.23 [default] to 2024.3.3 [default]
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PKGSIZE changed from 91840 to 91982 (+0%)
packages/core2-64-poky-linux/python3-trove-classifiers/python3-trove-classifiers: PV changed from "2024.2.23" to "2024.3.3"
Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/WHEEL was removed

--===============1204496099574789425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1878 targets, 46 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-64 sysroot...done.
Removing 70 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-ac07f80005938f948d2c20bf97487cc14f0d865c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ac07f80005938f948d2c20bf97487cc14f0d865c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 539 Local 519 Mirrors 0 Missed 20 Current 260 (96% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 269 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 277 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pluggy_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 293 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 295 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 296 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_deb_setscene)
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 298 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 299 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 300 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 301 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wcwidth_0.2.13.bb:do_packagedata_setscene)
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 317 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 318 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 319 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_rpm_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/69.1.1/temp/log.do_packagedata_setscene.3310465
NOTE: Running setscene task 331 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 333 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_ipk_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 334 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb:do_package_setscene)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_deb_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pytest/8.0.2/temp/log.do_packagedata_setscene.3310778
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-wcwidth-0.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 339 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_setscene)
NOTE: Running setscene task 340 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 341 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 462 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 421 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_fetch)
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 468 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: Running task 486 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_fetch)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_fetch: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_fetch: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 487 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_unpack)
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 481 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 502 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_unpack)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-69.1.1-r0: task do_package_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_unpack: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 536 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 498 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 534 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1044 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_patch)
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 542 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1124 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_patch)
NOTE: Running task 1126 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running task 1199 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-69.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 567 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1270 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1271 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1274 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-69.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 570 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-69.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1337 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1364 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 626 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running task 1390 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running setscene task 644 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 647 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 682 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 685 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 691 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 693 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 697 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 717 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1462 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1523 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1545 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 788 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 54476271e115e90e57264c5e3fc1317ef967797fc431bf42c74230c0776f6cc4 to hashserv.yocto.io:8686 ({'taskhash': 'af2861b752eb56f869833467e3e37079f42d865535dff891e83fe19bcf7ba301', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '54476271e115e90e57264c5e3fc1317ef967797fc431bf42c74230c0776f6cc4'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed af2861b752eb56f869833467e3e37079f42d865535dff891e83fe19bcf7ba301 -> 54476271e115e90e57264c5e3fc1317ef967797fc431bf42c74230c0776f6cc4 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1888 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1964 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2038 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_packagedata)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2118 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2198 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb:do_packagedata)
NOTE: Running task 2212 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-69.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-69.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2238 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_configure: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2239 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2241 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_compile)
NOTE: Running task 2243 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2244 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2245 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile)
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2246 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2247 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2248 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile_ptest_base)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2249 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_install)
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_install)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_install: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2251 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_install: Succeeded
NOTE: Running task 2252 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_install_ptest_base)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_install_ptest_base)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2254 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package)
NOTE: Running task 2255 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_populate_sysroot)
NOTE: recipe python3-attrs-23.2.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2256 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_populate_sysroot unihash changed to 4395ccb46be34e5b28644bc9de1eae8e4d59aca62059ec8521e371a9f2925b8b
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package unihash changed to 407a1684ae75a04ea72a4e5d706707db94e6e849be30964a9eccd07205c7793d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata became valid
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package unihash changed to 9dc46eb6cb8537881c17318d44710d3b25ce96d93bf6c5212ed6fc78ee95dae4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_packagedata became valid
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_packagedata_setscene)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package unihash changed to 08169335ff6bb76c257c0bc644f3342160c18487c217eb1dbae11adc9f8d6ebe
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_deb became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_ipk became valid
NOTE: Running setscene task 796 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_deb_setscene)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 798 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 2259 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_create_spdx)
NOTE: Running task 2260 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package_write_ipk)
NOTE: Running task 2261 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package_write_deb)
NOTE: Running task 2262 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package_write_rpm)
NOTE: Running task 2263 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package_qa)
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_create_spdx: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 799 of 799 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2268 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package_qa unihash changed to 285eb8b03c1d0af715cb67d3584ea297ceab52ae53bbd9f29f5ea1a92bda3b1d
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_create_runtime_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package_write_ipk unihash changed to c5f14a03572639bffd31a4c9b8e8287681320fbb81c03a2d5bb46afbde99d814
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_package_write_deb unihash changed to cede10b21fb80556c7daffe299a64c4269710f436abe372bd8a73cfc1814d67b
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-trove-classifiers-2024.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2269 of 2269 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.3.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2269 tasks of which 2219 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:69.2.0-r0 to 0:69.1.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:69.2.0-r0 to 0:69.1.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:69.2.0-r0 to 0:69.1.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:69.2.0-r0 to 0:69.1.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:69.2.0-r0 to 0:69.1.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:69.2.0-r0 to 0:69.1.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:69.2.0-r0 to 0:69.1.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:69.2.0-r0 to 0:69.1.1-r0) [version-going-backwards]
ERROR: python3-setuptools-69.1.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pytest-8.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:8.1.1-r0 to 0:8.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:8.1.1-r0 to 0:8.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:8.1.1-r0 to 0:8.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:8.1.1-r0 to 0:8.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:8.1.1-r0 to 0:8.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:8.1.1-r0 to 0:8.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:8.1.1-r0 to 0:8.0.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1204496099574789425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-trove-classifiers (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/LICENSE was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/METADATA was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/RECORD was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.3.3.dist-info/WHEEL was added
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/LICENSE was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/METADATA was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/RECORD was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/top_level.txt was removed
  /usr/lib/python3.12/site-packages/trove_classifiers-2024.2.23.dist-info/WHEEL was removed

--===============1204496099574789425==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-trove-classifiers-upgrade-2024.2.23-2024.3.3.patch"

RnJvbSBlZDAyNTUzY2IzNzhkNWEzYjI3MWYxYjY0NmIxNzRhMGIxZWRkN2VhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDk6MTI6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzOiB1cGdyYWRlIDIwMjQuMi4yMyAtPiAyMDI0LjMuMwoK
LS0tCiAuLi5maWVyc18yMDI0LjIuMjMuYmIgPT4gcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18y
MDI0LjMuMy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRy
b3ZlLWNsYXNzaWZpZXJzXzIwMjQuMi4yMy5iYiA9PiBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJz
XzIwMjQuMy4zLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjIuMjMuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnNfMjAyNC4zLjMuYmIK
c2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQuMi4yMy5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzXzIwMjQu
My4zLmJiCmluZGV4IDg1MTRhNTI2MTYuLmI5MTJlZmNmNTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10cm92ZS1jbGFzc2lmaWVyc18yMDI0LjIuMjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRyb3ZlLWNsYXNz
aWZpZXJzXzIwMjQuMy4zLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dp
dGh1Yi5jb20vcHlwYS90cm92ZS1jbGFzc2lmaWVycyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3
OWJkODk4Njk2OGY0MzI3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODM4NTE2MGExMmFhYzY5
YzkzZmZmMDU4ZmI2MTM0NzJlZDc3M2EyNGEyN2ViM2NkNGIxNDRjZmJkZDc5ZjM4YyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkZjdlZGZmOWM2N2ZmODZiNzMzNjI4OTk4MzMwYjE4MGU4MWQxMjVi
MWUwOTY1MzZkODNhYzBmZDc5NjczZmRjIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YSBwdGVzdAogCi0tIAoyLjQyLjAKCg==

--===============1204496099574789425==--

