Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C50C27C65
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.833.1686887483846787422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GLphUbPh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188c2544706-72aed5f1-1c78-4475-a9ea-f88933a273ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o6D1BYR+mgdWv83NasyRgSXoc7z7qQ2gEae7DykrKiY=;
	b=GLphUbPh2lCV+cwOd5qcR6n12MLvPYHfEOH4aG+8k4TOWKQuWdRYUQxjtcEqXUD/
	AZ7pSRK4PMvlSlhvRDbaLWy3mV52sjd6pBudUI5qQ7cCFU6mhXK49RzddvrarDEYUT3
	5qPQ3SRX8YtFJqRkRtJFmf/uR5rO7/OTxURRBkEE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o6D1BYR+mgdWv83NasyRgSXoc7z7qQ2gEae7DykrKiY=;
	b=ezNbacGLU9gGY22SYIUhXz9RkmvDslVI2dBv7IwkPPGTAuQjvyc9OXiXwVP1J4gE
	gs8o6g35YZ9y4moHIa9jZyGUNMCrdSmTMlkV9NuDAos852uFdzWGsaPXM7QAuoECm1k
	fig2ONZcU7EbeNi4d+2hhvWIkzxpZ7Y4t2NCoZqM=
Content-Type: multipart/mixed; boundary="===============0150061855238143085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.0.3 SUCCEEDED
Message-ID: <01010188c2544706-72aed5f1-1c78-4475-a9ea-f88933a273ea-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182938

--===============0150061855238143085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *2.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.0.2-2.0.3.patch
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
From 333889089145539ff87d628cedbd0fc4f57df5fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 14:13:59 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.0.2 -> 2.0.3

---
 ...lib3_2.0.2.bb => python3-urllib3_2.0.3.bb} | 25 +++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.2.bb => python3-urllib3_2.0.3.bb} (37%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
similarity index 37%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
index bc1cdb009f..5db86562d5 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
@@ -1,9 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.txt
+# +++ LICENSE.txt
+# @@ -1,6 +1,6 @@
+#  MIT License
+#  
+# -Copyright (c) 2008-2020 Andrey Petrov and contributors (see CONTRIBUTORS.txt)
+# +Copyright (c) 2008-2020 Andrey Petrov and contributors.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# 
+#
+
 SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
 HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "61717a1095d7e155cdb737ac7bb2f4324a858a1e2e6466f6d03ff630ca68d3cc"
+SRC_URI[sha256sum] = "bee28b5e56addb8226c96f7f13ac28cb4c301dd5ea8a6ca179c0b9835e032825"
 
 inherit pypi python_hatchling
 
-- 
2.39.2


--===============0150061855238143085==
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
meta-yocto-bsp       = "tmp-auh-upgrades:e135a2947eb52ab50b8a4992daea86815ded7957"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 64 Local 20 Mirrors 0 Missed 44 Current 476 (31% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 489 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 540 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-pytest/7.3.1-r0/temp/log.do_packagedata_setscene.1165870
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 537 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package_setscene)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 540 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1053 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1272 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_fetch)
NOTE: Running task 1302 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1303 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: Running task 1304 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: Running task 1698 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 540 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1705 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_unpack)
NOTE: Running task 1706 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1707 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1708 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1709 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1710 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1711 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1747 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata)
NOTE: Running task 1749 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: Running task 1750 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: Running task 1752 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Started
NOTE: Running task 1763 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1764 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1765 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1766 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: Running task 1767 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1768 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: Running task 1769 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: Running task 1770 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: Running task 1771 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1773 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1782 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Failed
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Tasks Summary: Attempted 1782 tasks of which 1754 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.75.7-r0/temp/log.do_packagedata.1167131
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata) failed with exit code '1'

--===============0150061855238143085==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.0.2-2.0.3.patch"

RnJvbSAzMzM4ODkwODkxNDU1MzlmZjg3ZDYyOGNlZGJkMGZjNGY1N2RmNWZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTQ6MTM6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi4wLjIgLT4gMi4wLjMKCi0tLQogLi4ubGliM18yLjAu
Mi5iYiA9PiBweXRob24zLXVybGxpYjNfMi4wLjMuYmJ9IHwgMjUgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzIuMC4yLmJi
ID0+IHB5dGhvbjMtdXJsbGliM18yLjAuMy5iYn0gKDM3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjAuMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuMC4zLmJiCnNpbWlsYXJpdHkg
aW5kZXggMzclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11cmxsaWIzXzIuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtdXJsbGliM18yLjAuMy5iYgppbmRleCBiYzFjZGIwMDlmLi41ZGI4NjU2MmQ1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18y
LjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGli
M18yLjAuMy5iYgpAQCAtMSw5ICsxLDMwIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NV
TSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBm
b2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxp
Y2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQs
IGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAn
TGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHly
aWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5T
RS50eHQKKyMgKysrIExJQ0VOU0UudHh0CisjIEBAIC0xLDYgKzEsNiBAQAorIyAgTUlUIExpY2Vu
c2UKKyMgIAorIyAtQ29weXJpZ2h0IChjKSAyMDA4LTIwMjAgQW5kcmV5IFBldHJvdiBhbmQgY29u
dHJpYnV0b3JzIChzZWUgQ09OVFJJQlVUT1JTLnR4dCkKKyMgK0NvcHlyaWdodCAoYykgMjAwOC0y
MDIwIEFuZHJleSBQZXRyb3YgYW5kIGNvbnRyaWJ1dG9ycy4KKyMgIAorIyAgUGVybWlzc2lvbiBp
cyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5n
IGEgY29weQorIyAgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9u
IGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgCisjCisKIFNVTU1BUlkgPSAiUHl0
aG9uIEhUVFAgbGlicmFyeSB3aXRoIHRocmVhZC1zYWZlIGNvbm5lY3Rpb24gcG9vbGluZywgZmls
ZSBwb3N0IHN1cHBvcnQsIHNhbml0eSBmcmllbmRseSwgYW5kIG1vcmUiCiBIT01FUEFHRSA9ICJo
dHRwczovL2dpdGh1Yi5jb20vc2hhem93L3VybGxpYjMiCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT1jMjgyM2NiOTk1NDM5Yzk4NGZk
NjJhOTczZDc5ODE1YyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21k
NT01MmQyNzNhMzA1NGNlZDU2MTI3NWQ0ZDE1MjYwZWNkYSIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjYxNzE3YTEwOTVkN2UxNTVjZGI3MzdhYzdiYjJmNDMyNGE4NThhMWUyZTY0NjZmNmQwM2Zm
NjMwY2E2OGQzY2MiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmVlMjhiNWU1NmFkZGI4MjI2Yzk2
ZjdmMTNhYzI4Y2I0YzMwMWRkNWVhOGE2Y2ExNzljMGI5ODM1ZTAzMjgyNSIKIAogaW5oZXJpdCBw
eXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi4zOS4yCgo=

--===============0150061855238143085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 2.0.2 [default] to 2.0.3 [default]
packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.0.2.tar.gz;downloadfilename=urllib3-2.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.0.3.tar.gz;downloadfilename=urllib3-2.0.3.tar.gz"
packages/core2-32-poky-linux/python3-urllib3: PV changed from "2.0.2" to "2.0.3"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.0.2 [default] to 2.0.3 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.0.2" to "2.0.3"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.0.2 [default] to 2.0.3 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.0.2" to "2.0.3"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.0.2 [default] to 2.0.3 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.0.2" to "2.0.3"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.0.2 [default] to 2.0.3 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.0.2" to "2.0.3"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.0.2 [default] to 2.0.3 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.0.2" to "2.0.3"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.0.2 [default] to 2.0.3 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.0.2" to "2.0.3"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.0.2 [default] to 2.0.3 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 850167 to 853347 (+0%)
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.0.2" to "2.0.3"
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-2.0.2.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-2.0.3.dist-info

--===============0150061855238143085==
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
meta-yocto-bsp       = "tmp-auh-upgrades:e135a2947eb52ab50b8a4992daea86815ded7957"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 62 Local 17 Mirrors 0 Missed 45 Current 478 (27% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 491 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-pytest/7.3.1-r0/temp/log.do_packagedata_setscene.1173217
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 539 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package_setscene)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1077 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 1303 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_fetch)
NOTE: Running task 1333 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1334 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1335 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: Running task 1634 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: Running task 1734 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: Running task 1738 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1739 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_unpack)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1740 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1741 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1742 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1743 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1744 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1745 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1779 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata)
NOTE: Running task 1782 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: Running task 1783 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata)
NOTE: Running task 1785 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1795 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_patch)
NOTE: Running task 1796 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: Running task 1798 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1799 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: Running task 1800 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Started
NOTE: Running task 1801 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1802 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: Running task 1803 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1804 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: Running task 1805 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1815 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1815 tasks of which 1784 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.75.7-r0/temp/log.do_packagedata.1173808
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata) failed with exit code '1'

--===============0150061855238143085==
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
meta-yocto-bsp       = "tmp-auh-upgrades:e135a2947eb52ab50b8a4992daea86815ded7957"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 17 Mirrors 0 Missed 43 Current 480 (28% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 493 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-pytest/7.3.1-r0/temp/log.do_packagedata_setscene.1226074
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 539 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package_setscene)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1077 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 1303 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_fetch)
NOTE: Running task 1333 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1334 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1335 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: Running task 1633 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1699 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_unpack)
NOTE: Running task 1700 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: Running task 1701 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1702 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1703 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1704 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1742 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1743 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1759 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_patch)
NOTE: Running task 1760 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1761 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1781 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: Running task 1782 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: Running task 1783 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1786 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata)
NOTE: Running task 1790 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Started
NOTE: Running task 1791 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1792 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: Running task 1802 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: Running task 1803 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1804 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1805 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Failed
NOTE: Setscene tasks completed
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1807 tasks of which 1779 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.75.7-r0/temp/log.do_packagedata.1226753
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata) failed with exit code '1'

--===============0150061855238143085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-2.0.2.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-2.0.3.dist-info

--===============0150061855238143085==
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
meta-yocto-bsp       = "tmp-auh-upgrades:e135a2947eb52ab50b8a4992daea86815ded7957"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 17 Mirrors 0 Missed 43 Current 480 (28% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 493 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-pytest/7.3.1-r0/temp/log.do_packagedata_setscene.1203065
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 539 of 540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package_setscene)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1077 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: Running task 1303 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_fetch)
NOTE: Running task 1333 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: Running task 1334 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 1335 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: Running task 1633 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1736 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1737 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_unpack)
NOTE: Running task 1738 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: Running task 1739 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1740 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1741 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1742 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1743 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1778 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata)
NOTE: Running task 1781 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: Running task 1784 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1795 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1796 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_patch)
NOTE: Running task 1797 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Started
NOTE: Running task 1798 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1799 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: Running task 1800 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Started
NOTE: Running task 1801 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1802 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: Running task 1803 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Started
NOTE: Running task 1804 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1805 of 1894 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Tasks Summary: Attempted 1805 tasks of which 1777 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.75.7-r0/temp/log.do_packagedata.1205225
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata) failed with exit code '1'

--===============0150061855238143085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 28 recipes from the core2-32 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e135a2947eb52ab50b8a4992daea86815ded7957"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 278 Local 222 Mirrors 0 Missed 56 Current 285 (79% match, 90% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 286 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 299 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_package_setscene)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_package_setscene)
NOTE: Running setscene task 305 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_package_setscene)
NOTE: Running setscene task 312 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 340 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 341 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package_setscene)
NOTE: Running setscene task 358 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-cryptography-39.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-pytest/7.3.1-r0/temp/log.do_packagedata_setscene.1231676
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 391 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package_setscene)
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 740 of 1959 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot)
NOTE: Running task 800 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 807 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running task 850 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 875 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_fetch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 951 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: Running task 967 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_fetch)
NOTE: Running task 981 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: Running task 982 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_fetch)
NOTE: Running task 983 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_fetch)
NOTE: Running task 1097 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 1098 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 412 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Started
NOTE: Running task 1200 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Started
NOTE: Running task 1205 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_unpack)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Started
NOTE: Running task 1206 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 416 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1211 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1212 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_unpack)
NOTE: Running task 1213 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1214 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package_setscene: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_package_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_setscene: Started
NOTE: Running task 1215 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: Running task 1216 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1217 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1218 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_patch)
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1219 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_patch)
NOTE: Running task 1220 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1221 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_patch)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_unpack: Succeeded
NOTE: Running task 1222 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_patch)
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: Running setscene task 430 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1243 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: recipe python3-psutil-5.9.5-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1248 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_patch: Succeeded
NOTE: Running task 1254 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_populate_lic)
NOTE: Running task 1255 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1260 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_23.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_package_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: Running task 1270 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1271 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_rust_gen_targets)
NOTE: Running setscene task 447 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_patch: Succeeded
NOTE: Running task 1272 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_populate_lic unihash changed to 50fca01cef6bcf3e841f8d277aea89f68df8a7865586f2d746ad4ce030094595
NOTE: Running setscene task 449 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1277 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyopenssl-23.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1295 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.2.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-39.0.2-r0: task do_patch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1303 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 483 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1308 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1310 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1357 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb:do_rust_gen_targets)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-39.0.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 541 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1405 of 1959 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cargo-native-1.70.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1406 of 1959 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_rust_create_wrappers)
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1407 of 1959 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_configure)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-native-1.70.0-r0: task do_configure: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1959 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_compile)
NOTE: recipe cargo-native-1.70.0-r0: task do_compile: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 563 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1592 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1661 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata)
NOTE: Running task 1698 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1722 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1723 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1749 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1750 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1777 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1780 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1838 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1839 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_collect_spdx_deps)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1841 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.5.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1843 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata)
NOTE: Running task 1844 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1846 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1854 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1855 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1856 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_configure)
NOTE: recipe python3-certifi-2022.12.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1857 of 1959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.12.7.bb:do_configure)
NOTE: recipe cargo-native-1.70.0-r0: task do_compile: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1858 of 1959 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_install)
NOTE: recipe python3-psutil-5.9.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.75.7-r0: task do_packagedata: Failed
NOTE: recipe python3-idna-3.4-r0: task do_configure: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Started
NOTE: recipe python3-idna-3.4-r0: task do_configure: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.12.7-r0: task do_configure: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1858 tasks of which 1791 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:7.3.2-r0 to 0:7.3.1-r0) [version-going-backwards]
ERROR: python3-pytest-7.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.78.2-r0 to 0:6.75.7-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.75.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.75.7-r0/temp/log.do_packagedata.1247167
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb:do_packagedata) failed with exit code '1'

--===============0150061855238143085==--

