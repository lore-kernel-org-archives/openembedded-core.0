Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FC9C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 06:54:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33924.1789109660705974591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 23:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=k/udcnto;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NArNP7Ot;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a08f3ee807-cdacf650-dad7-42bd-8ee1-67678698347f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789109659;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wYv4M9fF/vSaQzmRRpzq0gZJhn28jjNGOe7poJCIWWk=;
	b=k/udcnto440zQesiAXvc93B5CjCCVgG8I6/7gMP7I+Zyylk5ma56Ehloi5++Js5x
	oTrVNiz/knwfRiwOiAEtZ8/48PH+6MuAQugCUIyHZTgVgw7wIq9s37Vw3Huxl+fOCH2
	anD1dfWIxZ/+Ttj3pUZ4bT9RVwXQQJ/z4FSU243o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789109659;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wYv4M9fF/vSaQzmRRpzq0gZJhn28jjNGOe7poJCIWWk=;
	b=NArNP7OtZqCPX0dc0iORERxLRbNDS1fDvThBIPIz0Pq9S1ncMp97PuZJP8vP+YUA
	ZKuoYrK78FSKWAOH71pb0+pMVi6N/TBXVEpoiskptk5uNAkY6LSP9bXY/gCwjYtXxRi
	wzecy3CstICrUD/HjYnwEUZNvv9FIQusLX1lvLM4=
Content-Type: multipart/mixed; boundary="===============5536897479529182712=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.32.0 FAILED
Message-ID: <010101a08f3ee807-cdacf650-dad7-42bd-8ee1-67678698347f-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2026 06:54:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245610

--===============5536897479529182712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.32.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.31.0-1.32.0.patch
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
From 872fe97bf6099fd07d1459d329b64c6df25d8c5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 11 Sep 2026 05:45:33 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.31.0 -> 1.32.0

---
 ...{python3-hatchling_1.31.0.bb => python3-hatchling_1.32.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.31.0.bb => python3-hatchling_1.32.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
index 3acaa83638..e63c6ba3a4 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
 
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 
-SRC_URI[sha256sum] = "6b48ad4068a482ed7239b3a8215bc55b47aad3345d58dfc94e553c5d2d46211b"
+SRC_URI[sha256sum] = "0bdbde4a52b06c37e3eca395f85a762bf0ef06fe374fd8ae429dc6be10230f5f"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============5536897479529182712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1990 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-ac10d8a3838180255be5cba3f7cef08363d1b4f5"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ac10d8a3838180255be5cba3f7cef08363d1b4f5"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 225 Local 206 Mirrors 0 Missed 19 Current 526 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 665 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 681 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 687 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_create_spdx_setscene)
NOTE: Running task 1231 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_recipe_qa)
NOTE: Running task 1233 of 1935 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_recipe_qa)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 706 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 709 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 713 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 714 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 720 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1471 of 1935 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_fetch)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-build-native-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1472 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_fetch)
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-hatchling-1.32.0-r0: task do_fetch: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 730 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 733 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-hatchling-1.32.0-r0: task do_fetch: Succeeded
NOTE: Running task 1482 of 1935 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_unpack)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_fetch: Started
NOTE: Running setscene task 737 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_fetch: Succeeded
NOTE: Running task 1483 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_unpack)
NOTE: recipe python3-hatchling-1.32.0-r0: task do_unpack: Started
NOTE: recipe python3-build-native-1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1484 of 1935 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_patch)
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_unpack: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-build-native-1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_unpack: Succeeded
NOTE: Running task 1496 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_patch)
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1503 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-hatchling-1.32.0-r0: task do_patch: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 746 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_patch: Succeeded
NOTE: Running task 1523 of 1935 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1524 of 1935 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_populate_lic)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_patch: Succeeded
NOTE: Running task 1525 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_populate_lic: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1531 of 1935 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-vcs-versioning-native-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_84.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-hatchling-1.32.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hatchling-1.32.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hatchling-1.32.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-setuptools-native-84.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-build-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-build-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 751 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-build_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-build-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-build-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1803 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1917 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_configure)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_configure: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 1935 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_compile)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/recipe-sysroot-native/usr/bin/nativepython3):
| 	tomlkit>=0.11.1
| 		wanted: >=0.11.1
| 		found: not installed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.194021:155 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/sources/hatchling-1.32.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.194021, line 155
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.194021, line 150
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.194021, line 159
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1918 tasks of which 1902 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260911054518.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260911054518.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/log.do_compile.194021
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hatchling-native-1.32.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.194021' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/log.do_compile.194021
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_compile) failed with exit code '1'

--===============5536897479529182712==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.31.0-1.32.0.patch"

RnJvbSA4NzJmZTk3YmY2MDk5ZmQwN2QxNDU5ZDMyOWI2NGM2ZGYyNWQ4YzVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTEgU2VwIDIwMjYgMDU6NDU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjMxLjAgLT4gMS4zMi4wCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjMxLjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4zMi4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzEu
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjMyLjAuYmJ9ICg4MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMxLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzIuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDgyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMzEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMyLjAuYmIKaW5kZXggM2FjYWE4
MzYzOC4uZTYzYzZiYTNhNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjMxLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjMyLjAuYmIKQEAgLTcsNiArNyw2IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5h
dGl2ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0
aG9uMy1lZGl0YWJsZXMtbmF0aXZlIHB5dGhvbjMtdHJvdmUtY2xhc3NpZmllcnMtbmF0aXZlIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmI0OGFkNDA2OGE0ODJlZDcyMzliM2E4MjE1YmM1NWI0
N2FhZDMzNDVkNThkZmM5NGU1NTNjNWQyZDQ2MjExYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIw
YmRiZGU0YTUyYjA2YzM3ZTNlY2EzOTVmODVhNzYyYmYwZWYwNmZlMzc0ZmQ4YWU0MjlkYzZiZTEw
MjMwZjVmIgogCiBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0tIAoyLjQ3LjEK
Cg==

--===============5536897479529182712==--

