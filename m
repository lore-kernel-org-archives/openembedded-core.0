Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A922BCD98F0
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 05:12:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14243.1782191526166186512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 22:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=e24wOcO7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3H10bSyl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ef2e48d4c-840c12fe-ec3d-4b2a-8efb-c9efe73a71fe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782191525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/xL1tF0CMR+6ppinRur874BRYMLMphsSWxGuBH4lGP4=;
	b=e24wOcO7dN8TzrlEq94DosuUhu8Dpw+ZYMSepdoco56IwOi/K/nyQosC9Pj/h2pJ
	+4e6TWJtmxLPwRRG0xRA9Msf8AUceREtRPq5POnV3uZCYPQS+xAYAkOkO3maXPTDf0X
	3fHcPb2HY2/227XB7IYgPnOiMsBuJXDXWwGTwlxw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782191525;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/xL1tF0CMR+6ppinRur874BRYMLMphsSWxGuBH4lGP4=;
	b=3H10bSylo1OHBqRSJdQi+FwLUq9yiZWAuGUFxKJY6vdoetnkc0JvNUiHn+hmPQQJ
	giNlCV+Q+vLlvQJaMnK3vME9T4rWjWiEcWIeX0BC8+yrNCI6BfwBLKXgrGoThCOJCS3
	rrGU0hQIvzFuPX3t4wd3IvEfJ5qEO4Aw7dKLRQVM=
Content-Type: multipart/mixed; boundary="===============0693879615625711708=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.1.2 FAILED
Message-ID: <0101019ef2e48d4c-840c12fe-ec3d-4b2a-8efb-c9efe73a71fe-000000@us-west-2.amazonses.com>
Date: Tue, 23 Jun 2026 05:12:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.23-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 05:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239330

--===============0693879615625711708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.1.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-10.0.5-10.1.2.patch
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
From c5b0709bb11d76863273841b75b09c771e43259b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 23 Jun 2026 05:09:37 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 10.0.5 -> 10.1.2

---
 ...etuptools-scm_10.0.5.bb => python3-setuptools-scm_10.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0.5.bb => python3-setuptools-scm_10.1.2.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
index 3e86c4fd2c..d762dc7ed1 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb52ae26813d4838c3"
+SRC_URI[sha256sum] = "24079818acc46e99aae0d65b8d511fafe965970d9cbd060c7b9f7275ded520fb"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============0693879615625711708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-3708b75057d51a52474a70a253c148a925e48f14"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3708b75057d51a52474a70a253c148a925e48f14"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 528 Local 505 Mirrors 0 Missed 23 Current 251 (95% match, 97% complete)
done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 290 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1083 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_recipe_qa)
NOTE: Running task 1138 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_recipe_qa)
NOTE: recipe python3-setuptools-82.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-setuptools-82.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 747 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_package_setscene)
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 754 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 755 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_spdx_setscene)
NOTE: Running task 1242 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_fetch)
NOTE: Running task 1244 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1245 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1246 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_unpack)
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_unpack: Started
NOTE: Running setscene task 759 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 760 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1251 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_patch)
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 762 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1252 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_unpack)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_unpack: Started
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 767 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1295 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1296 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1297 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_populate_lic)
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.2-r0: task do_package_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_populate_lic: Started
NOTE: Running task 1303 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 773 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1304 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_unpack: Started
NOTE: Running task 1343 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_patch)
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_patch: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-26.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 779 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-9.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-26.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-26.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1791 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1857 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1951 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_configure: Started
NOTE: Running task 1952 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_configure: Started
NOTE: Running task 1953 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_compile)
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1954 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "<string>", line 36, in _package_version
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/sources/setuptools_scm-10.1.2/src/setuptools_scm/_get_version.py", line 55, in get_version
|     from vcs_versioning._environment import VcsEnvironment
| ModuleNotFoundError: No module named 'vcs_versioning._environment'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/temp/run.do_compile.1376161:154 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/sources/setuptools_scm-10.1.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/temp/run.do_compile.1376161, line 154
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/temp/run.do_compile.1376161, line 149
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/temp/run.do_compile.1376161, line 158
NOTE: recipe python3-setuptools-scm-native-10.1.2-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "<string>", line 36, in _package_version
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/sources/setuptools_scm-10.1.2/src/setuptools_scm/_get_version.py", line 55, in get_version
|     from vcs_versioning._environment import VcsEnvironment
| ModuleNotFoundError: No module named 'vcs_versioning._environment'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/temp/run.do_compile.1376181:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/sources/setuptools_scm-10.1.2'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/temp/run.do_compile.1376181, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/temp/run.do_compile.1376181, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/temp/run.do_compile.1376181, line 163
NOTE: recipe python3-setuptools-scm-10.1.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1954 tasks of which 1933 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260623050919.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260623050919.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/temp/log.do_compile.1376161
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/temp/log.do_compile.1376181
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.1.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/temp/run.do_compile.1376161' failed with exit code 1
ERROR: python3-setuptools-scm-10.1.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/temp/run.do_compile.1376181' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.1.2/temp/log.do_compile.1376161
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.1.2/temp/log.do_compile.1376181
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.1.2.bb:do_compile) failed with exit code '1'

--===============0693879615625711708==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-10.0.5-10.1.2.patch"

RnJvbSBjNWIwNzA5YmIxMWQ3Njg2MzI3Mzg0MWI3NWIwOWM3NzFlNDMyNTliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjMgSnVuIDIwMjYgMDU6MDk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDEwLjAuNSAtPiAxMC4xLjIKCi0tLQogLi4u
ZXR1cHRvb2xzLXNjbV8xMC4wLjUuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4xLjIu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV8xMC4wLjUuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4xLjIuYmJ9ICg4OSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtc2NtXzEwLjAuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zZXR1cHRvb2xzLXNjbV8xMC4xLjIuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzEw
LjAuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtc2NtXzEwLjEuMi5iYgppbmRleCAzZTg2YzRmZDJjLi5kNzYyZGM3ZWQxIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1z
Y21fMTAuMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzLXNjbV8xMC4xLjIuYmIKQEAgLTYsNyArNiw3IEBAIGFyZ3VtZW50IG9yIGluIGEg
U0NNIG1hbmFnZWQgZmlsZS4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTgzOGMzNjZmNjliNzJjNWRmMDVjOTZkZmY3OWIzNWYyIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmJiYThmZTc1NDUxNmNkZWZkMDE3ZjQ0NTY3MjE3NzVlNmVm
OTY2MmJkNzg4N2ZiNTJhZTI2ODEzZDQ4MzhjMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNDA3
OTgxOGFjYzQ2ZTk5YWFlMGQ2NWI4ZDUxMWZhZmU5NjU5NzBkOWNiZDA2MGM3YjlmNzI3NWRlZDUy
MGZiIgogCiBQWVBJX1BBQ0tBR0UgPSAic2V0dXB0b29sc19zY20iCiAKLS0gCjIuNDcuMQoK

--===============0693879615625711708==--

