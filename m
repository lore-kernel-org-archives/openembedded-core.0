Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E4BCDE013
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:11:47 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29408.1782454299849470281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bzT5LsDF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QpIqWw9z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f028e28f0-aa8cefb8-9714-4945-a221-570f78865f7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782454299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jxt3vvQ6Ef6+95c6aoMKNFled9Lvdr9pd+cR7Jy7dNg=;
	b=bzT5LsDFQ9E5jJTTJ03DBqVroOVJaHrYLXIqHZpPCguv0U7BZDnCBoKVDNJAQcty
	hKU9+UfkF9XSjoVTO2lXs+QOsF1MPHCcPymWGFJToVqUgKH/Ui2cVsJnLNKHDYfya9N
	+UAPjSxyuI5FIt0Z0WusAJTOJPoCuLSJNt05Pdsk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782454299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jxt3vvQ6Ef6+95c6aoMKNFled9Lvdr9pd+cR7Jy7dNg=;
	b=QpIqWw9zM3LrCghZpWPbE6dpvbNpxRkteMLo2oozIrbPDx+PR8CRYrP1VQKNCE9z
	syZI+4/HRufWlcxL4fHg/n3xtRCvrsTRI67+Sj0rGq3PWf+KpH+lUqR1RwnjjhD2ai0
	56vSh30PUO73jStKH6+/cDKP1E7+nGKLayCxZtPk=
Content-Type: multipart/mixed; boundary="===============5263841200952363649=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.2.0 FAILED
Message-ID: <0101019f028e28f0-aa8cefb8-9714-4945-a221-570f78865f7b-000000@us-west-2.amazonses.com>
Date: Fri, 26 Jun 2026 06:11:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.26-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239597

--===============5263841200952363649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.2.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-10.0.5-10.2.0.patch
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
From acd890b3fe8b3900292e17ecbdd536ec404b53d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 26 Jun 2026 06:06:10 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 10.0.5 -> 10.2.0

---
 ...etuptools-scm_10.0.5.bb => python3-setuptools-scm_10.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_10.0.5.bb => python3-setuptools-scm_10.2.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
index 3e86c4fd2c..d3ff181ad6 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb52ae26813d4838c3"
+SRC_URI[sha256sum] = "ec8ea1738b92e42146a46e29a0e9de9ad462744c63cf9778677b95dfd605adde"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============5263841200952363649==
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
DISTRO_VERSION       = "6.0.99+snapshot-9f79921dbbc171a670e41c1d199494bc4f313641"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:9f79921dbbc171a670e41c1d199494bc4f313641"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 267 Local 244 Mirrors 0 Missed 23 Current 512 (91% match, 97% complete)
done.
Removing 4 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 635 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_package_setscene)
NOTE: Running setscene task 660 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 676 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 677 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-82.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 688 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-82.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_spdx_setscene)
NOTE: Running task 794 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_recipe_qa)
NOTE: Running task 848 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_recipe_qa)
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 694 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 698 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_1.1.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pytest-9.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pytest-9.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 927 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_fetch)
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 702 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-26.2-r0: task do_package_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-vcs-versioning-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pytest-9.1.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glibc-2.43+git-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 709 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 712 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.43.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 714 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-9.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 968 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_unpack)
NOTE: recipe python3-packaging-native-26.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 969 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 970 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_fetch)
NOTE: recipe python3-pytest-9.1.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 971 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_unpack)
NOTE: recipe python3-pytest-9.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-26.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 976 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.0.bb:do_patch)
NOTE: Running setscene task 730 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-2.43+git-r1: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 731 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 738 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 741 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 981 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 982 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_patch)
NOTE: recipe python3-pytest-9.1.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-26.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-26.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 987 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_patch)
NOTE: recipe python3-pytest-9.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-native-82.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 744 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-wheel_0.47.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 745 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_patch: Succeeded
NOTE: Running task 993 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 994 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_populate_lic)
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_patch: Started
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_patch: Succeeded
NOTE: Running task 995 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.47.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 747 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 748 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.5.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.5.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 752 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-installer_1.0.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-installer-native-1.0.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-native-3.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 779 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-native-3.14.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1103 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-cross-x86_64-16.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 779 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe binutils-cross-x86_64-2.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1759 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1843 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1951 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_configure: Started
NOTE: Running task 1952 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_configure: Started
NOTE: Running task 1953 of 1977 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_compile)
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1954 of 1977 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "<string>", line 36, in _package_version
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/sources/setuptools_scm-10.2.0/src/setuptools_scm/_get_version.py", line 55, in get_version
|     from vcs_versioning._environment import VcsEnvironment
| ModuleNotFoundError: No module named 'vcs_versioning._environment'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/temp/run.do_compile.3426123:154 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/sources/setuptools_scm-10.2.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/temp/run.do_compile.3426123, line 154
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/temp/run.do_compile.3426123, line 149
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/temp/run.do_compile.3426123, line 158
NOTE: recipe python3-setuptools-scm-native-10.2.0-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 49, in <module>
|   File "<string>", line 36, in _package_version
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/sources/setuptools_scm-10.2.0/src/setuptools_scm/_get_version.py", line 55, in get_version
|     from vcs_versioning._environment import VcsEnvironment
| ModuleNotFoundError: No module named 'vcs_versioning._environment'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/temp/run.do_compile.3426141:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/sources/setuptools_scm-10.2.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/temp/run.do_compile.3426141, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/temp/run.do_compile.3426141, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/temp/run.do_compile.3426141, line 163
NOTE: recipe python3-setuptools-scm-10.2.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1954 tasks of which 1933 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260626060553.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260626060553.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/temp/log.do_compile.3426123
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/temp/log.do_compile.3426141
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.2.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/temp/run.do_compile.3426123' failed with exit code 1
ERROR: python3-setuptools-scm-10.2.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/temp/run.do_compile.3426141' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.2.0/temp/log.do_compile.3426123
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.2.0/temp/log.do_compile.3426141
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.0.bb:do_compile) failed with exit code '1'

--===============5263841200952363649==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-10.0.5-10.2.0.patch"

RnJvbSBhY2Q4OTBiM2ZlOGIzOTAwMjkyZTE3ZWNiZGQ1MzZlYzQwNGI1M2QyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjYgSnVuIDIwMjYgMDY6MDY6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDEwLjAuNSAtPiAxMC4yLjAKCi0tLQogLi4u
ZXR1cHRvb2xzLXNjbV8xMC4wLjUuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4yLjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zZXR1cHRvb2xz
LXNjbV8xMC4wLjUuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV8xMC4yLjAuYmJ9ICg4OSUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMtc2NtXzEwLjAuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zZXR1cHRvb2xzLXNjbV8xMC4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzEw
LjAuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtc2NtXzEwLjIuMC5iYgppbmRleCAzZTg2YzRmZDJjLi5kM2ZmMTgxYWQ2IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1z
Y21fMTAuMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzLXNjbV8xMC4yLjAuYmIKQEAgLTYsNyArNiw3IEBAIGFyZ3VtZW50IG9yIGluIGEg
U0NNIG1hbmFnZWQgZmlsZS4iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTgzOGMzNjZmNjliNzJjNWRmMDVjOTZkZmY3OWIzNWYyIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmJiYThmZTc1NDUxNmNkZWZkMDE3ZjQ0NTY3MjE3NzVlNmVm
OTY2MmJkNzg4N2ZiNTJhZTI2ODEzZDQ4MzhjMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlYzhl
YTE3MzhiOTJlNDIxNDZhNDZlMjlhMGU5ZGU5YWQ0NjI3NDRjNjNjZjk3Nzg2NzdiOTVkZmQ2MDVh
ZGRlIgogCiBQWVBJX1BBQ0tBR0UgPSAic2V0dXB0b29sc19zY20iCiAKLS0gCjIuNDcuMQoK

--===============5263841200952363649==--

