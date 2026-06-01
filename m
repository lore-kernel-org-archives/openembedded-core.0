Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C30CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1557.1780328132711460937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ry9Vmopo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dcqAttOn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d36da4-302552f5-e75d-4f47-9cf7-b949e54bc452-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328132;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jjLrFS2rGpcHxlW8n5JB8pPz80sTn0qiCIjQ9R9XCpE=;
	b=ry9VmopoCgWezhMnuRVEYBNS1HU+23FnMAcoFf0ls0eEETrZQjFt3jcFUQNNIE+T
	z8zYtF5U/3fp7+yUUTnZLMNyQvejpHQ4Rxhl+X9vHLkaChP167uwU/XfBA8W/t1dWka
	RNLrNp1BHxf78Hg9iFUgM5WosjeIDndtvjU3fJkw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328132;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jjLrFS2rGpcHxlW8n5JB8pPz80sTn0qiCIjQ9R9XCpE=;
	b=dcqAttOnEPUvSucBB7ntJ8+0NYykQIfAHqMxtKHQ/p/0A8NMgqi0oEG9CmPZfeG0
	1UUOsgV7XEiv52YKHKkDAPXN9l01jprQ3HGBjBAWjreQqUwcdElIjZkN10yOG0kCmmc
	8HBSSQ2Y9mZWUcP82qEgffZrCrddlax9pfFWCyic=
Content-Type: multipart/mixed; boundary="===============0132029444535907003=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng-python,libcap-ng: upgrading to 0.9.3,0.9.3 FAILED
Message-ID: <0101019e83d36da4-302552f5-e75d-4f47-9cf7-b949e54bc452-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237857

--===============0132029444535907003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng-python,libcap-ng* to *0.9.3,0.9.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libcap-ng-python-libcap-ng-upgrade-0.9.1-0.9.3-0.9.1.patch
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
From e3b85dae143cbf734cb87a69650fc8a79d3a0708 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 07:05:34 +0000
Subject: [PATCH] libcap-ng-python,libcap-ng: upgrade 0.9.1 -> 0.9.3,0.9.1 ->
 0.9.3

---
 .../{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.3.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.3.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.1.bb => libcap-ng-python_0.9.3.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.1.bb => libcap-ng_0.9.3.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 9d65c889bd..f023fe8f01 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "427ed6d2c2b16e9b48f12953e55febfead3ef2e2"
+SRCREV = "0ab44af5a23e8edb69a39c0dc803ce4395ff2086"
 
 inherit lib_package autotools pkgconfig
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb
-- 
2.47.1


--===============0132029444535907003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1975 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-2180e2e69094b70f686e64d1ca83191caf5d20b5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2180e2e69094b70f686e64d1ca83191caf5d20b5"
meta-yocto-bsp       
meta-poky            = "master:d13ca2a2e0f478046d920b8fc7dd3098952b5ad8"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 249 Local 119 Mirrors 0 Missed 130 Current 303 (47% match, 76% complete)
done.
Removing 58 stale sstate objects for arch x86-64-v3...done.
Removing 8 stale sstate objects for arch x86_64...done.
Removing 19 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 305 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 340 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 449 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 455 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 496 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 502 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 508 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 535 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe swig-native-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 536 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe swig-native-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 537 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 538 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 544 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 907 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 545 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 942 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe swig-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe swig-native-4.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 963 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_fetch)
NOTE: Running task 964 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_fetch)
NOTE: Running task 966 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_fetch)
NOTE: Running task 967 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_fetch)
NOTE: Running task 968 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_fetch)
NOTE: Running task 972 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 989 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1016 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_fetch)
NOTE: recipe swig-native-4.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Started
NOTE: Running task 1034 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1035 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_unpack)
NOTE: Running task 1036 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_fetch: Succeeded
NOTE: Running task 1037 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_unpack)
NOTE: Running task 1038 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_unpack)
NOTE: recipe python3-3.14.5-r0: task do_fetch: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 550 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe python3-3.14.5-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_unpack: Started
NOTE: Running task 1039 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_unpack)
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Started
NOTE: recipe swig-native-4.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Started
NOTE: Running setscene task 552 of 552 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/swig/swig_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1040 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 1041 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_patch)
NOTE: recipe swig-native-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Started
NOTE: Running task 1044 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1045 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: Running task 1047 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_fetch)
NOTE: recipe libffi-3.5.2-r0: task do_patch: Started
NOTE: recipe swig-native-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.53.0-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_fetch: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_unpack)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_unpack: Succeeded
NOTE: Running task 1065 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_patch)
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1066 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1067 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx)
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1068 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1072 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-3.14.5-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_patch)
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_patch)
NOTE: recipe libxcrypt-4.5.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.5-r0: task do_patch: Started
NOTE: Running task 1075 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_unpack)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1076 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_unpack)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1078 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_unpack: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1081 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx)
NOTE: Running task 1082 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx)
NOTE: Running task 1083 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx)
NOTE: Running task 1084 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_create_recipe_spdx)
NOTE: Running task 1085 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_recipe_spdx)
NOTE: Running task 1086 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_patch)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1088 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1089 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_create_recipe_spdx)
NOTE: Running task 1090 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1091 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: Running task 1092 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_recipe_spdx)
NOTE: Running task 1093 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe expat-2.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1094 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx)
NOTE: Running task 1095 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_create_recipe_spdx)
NOTE: Running task 1096 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx)
NOTE: Running task 1097 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_patch: Started
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1103 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1104 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_create_spdx)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1106 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-native-0.9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1108 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_configure)
NOTE: recipe libedit-20251016-3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1109 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1110 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.3.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-python-0.9.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_configure: Succeeded
NOTE: Running task 1111 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_compile)
NOTE: recipe util-linux-native-2.41.3-r0: task do_compile: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_compile: Succeeded
NOTE: Running task 1112 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_install)
NOTE: recipe util-linux-native-2.41.3-r0: task do_install: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_install: Succeeded
NOTE: Running task 1113 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot)
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1114 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1115 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1116 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_create_spdx: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1117 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_configure)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1118 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_configure)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_configure: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_configure: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_configure: Succeeded
NOTE: Running task 1119 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_compile)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_compile: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_configure: Succeeded
NOTE: Running task 1120 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_compile)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_compile: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_compile: Succeeded
NOTE: Running task 1121 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_install)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_install: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_compile: Succeeded
NOTE: Running task 1122 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_install)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_install: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_install: Succeeded
NOTE: Running task 1123 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_populate_sysroot)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_populate_sysroot: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_install: Succeeded
NOTE: Running task 1124 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1125 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb:do_create_spdx)
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx: Started
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-systemctl-native-259.5-r0: task do_create_spdx: Succeeded
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1127 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.43+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1128 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_configure)
NOTE: recipe libarchive-native-3.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_configure: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1129 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_configure)
NOTE: recipe libarchive-native-3.8.7-r0: task do_configure: Started
NOTE: recipe glibc-2.43+git-r1: task do_configure: Succeeded
NOTE: Running task 1130 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_compile)
NOTE: recipe glibc-2.43+git-r1: task do_compile: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_configure: Succeeded
NOTE: Running task 1131 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_compile)
NOTE: recipe libarchive-native-3.8.7-r0: task do_compile: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_compile: Succeeded
NOTE: Running task 1132 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_install)
NOTE: recipe libarchive-native-3.8.7-r0: task do_install: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_install: Succeeded
NOTE: Running task 1133 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.7.bb:do_populate_sysroot)
NOTE: recipe libarchive-native-3.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-native-3.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1134 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-native-0.194-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-native-0.194-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1135 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_configure)
NOTE: recipe elfutils-native-0.194-r0: task do_configure: Started
NOTE: recipe elfutils-native-0.194-r0: task do_configure: Succeeded
NOTE: Running task 1136 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_compile)
NOTE: recipe elfutils-native-0.194-r0: task do_compile: Started
NOTE: recipe elfutils-native-0.194-r0: task do_compile: Succeeded
NOTE: Running task 1137 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_install)
NOTE: recipe elfutils-native-0.194-r0: task do_install: Started
NOTE: recipe elfutils-native-0.194-r0: task do_install: Succeeded
NOTE: Running task 1138 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot)
NOTE: recipe elfutils-native-0.194-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-native-0.194-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1139 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1140 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1141 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_configure)
NOTE: Running task 1142 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_configure)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1143 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_compile)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1144 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_install)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_install: Succeeded
NOTE: Running task 1145 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-native-1_4.20.1-r0: task do_configure: Succeeded
NOTE: Running task 1146 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_compile)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 1147 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_install)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_install: Succeeded
NOTE: Running task 1148 of 1352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rpm/rpm_4.20.1.bb:do_populate_sysroot)
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-native-1_4.20.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1149 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package)
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_package unihash changed to 6fcd005e1247f1baab2f567008e2c4fa3e5f64cf36463ac5e8529b82f76d3400
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata became valid
NOTE: Running setscene task 525 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.43+git-r1: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1154 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_install)
NOTE: recipe glibc-2.43+git-r1: task do_install: Started
NOTE: recipe glibc-2.43+git-r1: task do_install: Succeeded
NOTE: Running task 1155 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale)
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale: Started
NOTE: recipe glibc-2.43+git-r1: task do_stash_locale: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_stash_locale unihash changed to 20e95b51a4ff1eaf8b9b5195537983454bfa2e8c59300bfbf3fd8788a36bfcd7
NOTE: Setscene tasks completed
NOTE: Running task 1156 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot)
NOTE: Running task 1157 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_package)
NOTE: recipe glibc-2.43+git-r1: task do_populate_sysroot: Started
NOTE: recipe glibc-2.43+git-r1: task do_package: Started
NOTE: recipe glibc-2.43+git-r1: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot unihash changed to ebc715e2f1b1368510610ce6b8cb66c59fcdf906f9131b2fabbe47152973fd8e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 500 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 537 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 549 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1180 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1181 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1211 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1212 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1214 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1215 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1216 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1229 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1230 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_configure)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1231 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_configure)
NOTE: recipe expat-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_configure: Started
NOTE: Running task 1232 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe libxcrypt-4.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1233 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_configure)
NOTE: Running task 1234 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_configure)
NOTE: recipe libcap-ng-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1235 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_configure)
NOTE: Running task 1236 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_configure)
NOTE: Running task 1237 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_configure)
NOTE: recipe libffi-3.5.2-r0: task do_configure: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_configure: Started
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_configure: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_configure: Started
NOTE: recipe expat-2.8.1-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_configure: Started
NOTE: recipe expat-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1238 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_configure_ptest_base)
NOTE: recipe expat-2.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1239 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_compile)
NOTE: recipe expat-2.8.1-r0: task do_compile: Started
NOTE: recipe sqlite3-3_3.53.0-r0: task do_configure: Succeeded
NOTE: Running task 1240 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.0.bb:do_compile)
NOTE: recipe sqlite3-3_3.53.0-r0: task do_compile: Started
NOTE: recipe expat-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_compile_ptest_base)
NOTE: recipe expat-2.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1242 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_install)
NOTE: recipe expat-2.8.1-r0: task do_install: Started
NOTE: recipe expat-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 1243 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_install_ptest_base)
NOTE: recipe expat-2.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 1245 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_compile)
NOTE: recipe libcap-ng-0.9.3-r0: task do_compile: Started
NOTE: recipe glibc-2.43+git-r1: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_package unihash changed to d4aec1d680bdf835eeda2803d49aa4bf654949e593036fcf9a78f1fb92158d20
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_packagedata became valid
NOTE: recipe libffi-3.5.2-r0: task do_configure: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_packagedata_setscene)
NOTE: Running task 1246 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_compile)
NOTE: recipe libffi-3.5.2-r0: task do_compile: Started
NOTE: recipe glibc-2.43+git-r1: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1248 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_package)
NOTE: Running task 1249 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx)
NOTE: recipe libgcc-16.1.0-r0: task do_package: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1250 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1251 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe libffi-3.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_install)
NOTE: recipe libedit-20251016-3.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1253 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_compile)
NOTE: recipe libffi-3.5.2-r0: task do_install: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1254 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_install)
NOTE: recipe libcap-ng-0.9.3-r0: task do_install: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1255 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_compile)
NOTE: recipe libxcrypt-4.5.2-r0: task do_compile: Started
NOTE: recipe libffi-3.5.2-r0: task do_install: Succeeded
NOTE: recipe libcap-ng-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 1257 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_compile: Succeeded
NOTE: Running task 1258 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1259 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe libedit-20251016-3.1-r0: task do_install: Started
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_install)
NOTE: recipe libgcc-16.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_package unihash changed to 23e126f0b82284d7c081fab77ad43f7e6648029c3fcaba9cd4f620b2cc354a4a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata became valid
NOTE: recipe libxcrypt-4.5.2-r0: task do_install: Started
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_install: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx: Succeeded
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_install: Succeeded
NOTE: Running task 1262 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: recipe libgcc-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1265 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_package)
NOTE: Running task 1266 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.1.bb:do_create_spdx)
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_package: Started
NOTE: recipe libgcc-16.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1267 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe gcc-runtime-16.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_package unihash changed to 0ce0dfdec0a97e8ab5d747af39edeeada205b27c77547cf7c479140b70332cb2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1270 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: Running task 1271 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx)
NOTE: Running task 1272 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package)
NOTE: Running task 1273 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_package)
NOTE: Running task 1274 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: Running task 1275 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_package)
NOTE: Running task 1276 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: Running task 1277 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package)
NOTE: Running task 1278 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_package)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx: Started
NOTE: recipe libcap-ng-0.9.3-r0: task do_package: Started
NOTE: recipe libffi-3.5.2-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe expat-2.8.1-r0: task do_package: Started
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe zlib-1.3.2-r0: task do_package: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_package: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1279 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe expat-2.8.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_package unihash changed to 94f03fe19e58017dd0ba7f8d8b239e7580c2c591ea0c44bd0eaa9c8915ad325e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_package unihash changed to cecc68e64bc02b66e53395506580ee1a8b39309980b8768e7c09be4a95004c63
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata became valid
NOTE: recipe expat-2.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcrypt-4.5.2-r0: task do_package: Succeeded
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running task 1281 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.1.bb:do_create_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_package unihash changed to dd19674284fd44abf61ec23623020fceb283f0c0634abf955b1693aae12a19c5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 573352b34e2e0cec92960ff1af728614dc603c5628c44c73fe566f732688c41a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 551 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_create_spdx: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1283 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1285 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_package)
NOTE: Running task 1286 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_package)
NOTE: recipe libxcrypt-4.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1287 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_package)
NOTE: recipe zlib-1.3.2-r0: task do_package: Succeeded
NOTE: Running task 1288 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx: Started
NOTE: Running task 1290 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx)
NOTE: Running task 1291 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxcrypt/libxcrypt_4.5.2.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_package unihash changed to d53d94e899a52674fb5a6ab0d51c75bb0e69c3528a8b60a23b739c201dffc1b4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe xz-5.8.3-r0: task do_package: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Started
NOTE: recipe ncurses-6.6-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx: Started
NOTE: recipe openssl-3.5.6-r0: task do_package: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1293 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libxcrypt-4.5.2-r0: task do_create_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package unihash changed to 334cc9b83c41db9e41dfdb4a704aec172dff058d08420a17ef79edc8a6f776d0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1295 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package unihash changed to 636120f07a16fd1dc18159494dbe05a66129050846c5c89ea1efd53a843268dc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1297 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1298 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_compile)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 755b14ce4b54664e5f6bd708dfdb4b41a97dd49739a4e2ac225e188f946a124f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1300 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_compile: Succeeded
NOTE: Running task 1301 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_install)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_install: Succeeded
NOTE: Running task 1303 of 1352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_package)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_package: Started
NOTE: recipe xz-5.8.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_package unihash changed to da70200638f78ffa3921e481f075b4a9cab46a680b2ec8288ccfb66a61e0ad83
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata became valid
NOTE: Running setscene task 552 of 552 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.3-r0: task do_package: Failed
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_package: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_package: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_package: Succeeded
NOTE: recipe sqlite3-3_3.53.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1303 tasks of which 1138 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601070148.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260601070148.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libcap-ng/0.9.3/temp/log.do_package.3993156
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libcap-ng-0.9.3-r0 do_package: QA Issue: libcap-ng: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/libcap-ng.bash_completion
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libcap-ng: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: libcap-ng-0.9.3-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libcap-ng/0.9.3/temp/log.do_package.3993156
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.3.bb:do_package) failed with exit code '1'

--===============0132029444535907003==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-python-libcap-ng-upgrade-0.9.1-0.9.3-0.9.1.patch"

RnJvbSBlM2I4NWRhZTE0M2NiZjczNGNiODdhNjk2NTBmYzhhNzlkM2EwNzA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNzowNTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcC1uZy1weXRob24sbGliY2FwLW5nOiB1cGdyYWRlIDAuOS4xIC0+IDAuOS4zLDAuOS4xIC0+
CiAwLjkuMwoKLS0tCiAuLi4ve2xpYmNhcC1uZy1weXRob25fMC45LjEuYmIgPT4gbGliY2FwLW5n
LXB5dGhvbl8wLjkuMy5iYn0gICAgfCAwCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcv
bGliY2FwLW5nLmluYyAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4vbGliY2FwLW5nL3ts
aWJjYXAtbmdfMC45LjEuYmIgPT4gbGliY2FwLW5nXzAuOS4zLmJifSAgICAgICAgfCAwCiAzIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL3tsaWJjYXAtbmctcHl0aG9uXzAuOS4xLmJiID0+IGxp
YmNhcC1uZy1weXRob25fMC45LjMuYmJ9ICgxMDAlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmNhcC1uZy97bGliY2FwLW5nXzAuOS4xLmJiID0+IGxpYmNhcC1uZ18wLjkuMy5iYn0g
KDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNh
cC1uZy1weXRob25fMC45LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGli
Y2FwLW5nLXB5dGhvbl8wLjkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy1weXRob25fMC45LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmctcHl0aG9u
XzAuOS4zLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGli
Y2FwLW5nLmluYyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5j
CmluZGV4IDlkNjVjODg5YmQuLmYwMjNmZThmMDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmNhcC1uZy9saWJjYXAtbmcuaW5jCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT05NGQ1NWQ1MTJhOWJhMzZjYWE5YjdkZjA3OWJhZTE5ZiBc
CiAJCSAgICBmaWxlOi8vQ09QWUlORy5MSUI7bWQ1PWUzZWRhMDFkOTgxNWY4ZDI0YWFlMmRiZDg5
YjY4YjA2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vc3RldmVncnViYi9saWJjYXAt
bmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSIKLVNSQ1JFViA9
ICI0MjdlZDZkMmMyYjE2ZTliNDhmMTI5NTNlNTVmZWJmZWFkM2VmMmUyIgorU1JDUkVWID0gIjBh
YjQ0YWY1YTIzZThlZGI2OWEzOWMwZGM4MDNjZTQzOTVmZjIwODYiCiAKIGluaGVyaXQgbGliX3Bh
Y2thZ2UgYXV0b3Rvb2xzIHBrZ2NvbmZpZwogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJjYXAtbmcvbGliY2FwLW5nXzAuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuMy5i
YgotLSAKMi40Ny4xCgo=

--===============0132029444535907003==--

