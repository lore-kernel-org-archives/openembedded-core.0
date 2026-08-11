Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6436C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 07:24:00 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49079.1786433032291808249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 00:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EfDFbYhu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hIDfAf4I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fefb4cbdc-cfa62604-8cf6-4f79-9679-bf4050ed965c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786433031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YwJ9DHot+jmaekWPTxni8tCiweqOyNVz83kEptiSxHI=;
	b=EfDFbYhuOyAQ2yQiyPk71ub/C98vMSa2T9RSvuRgiUqRaC2WZFEfrndh3pbzvAUf
	5POF1i/S+5J+8GoJyDyoR1ngUiv0muMSRvCxV4CxB2eKO8TGybJtRhPsYGO0GWCYUiU
	uCCSaaleQhQcPr5uaOzVPRrkOajAvSQ4Z03lPsf0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786433031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YwJ9DHot+jmaekWPTxni8tCiweqOyNVz83kEptiSxHI=;
	b=hIDfAf4IbXogh7inOl0S9F2iShUfxEa+rbrT6W9Fk83igcpKHTUrpNsnM8ySzO6v
	0ANmOg10AIH6JmPvYC3jznCMCfSkksNWaudHDzrhDegEJ0J+5V/A4lTqy+oXr/rTPJN
	d44rDNAWa0zZUiso1koqttiRQLgruUTz5Qf9Bz7s=
Content-Type: multipart/mixed; boundary="===============0798518612853032430=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.32.0 FAILED
Message-ID: <0101019fefb4cbdc-cfa62604-8cf6-4f79-9679-bf4050ed965c-000000@us-west-2.amazonses.com>
Date: Tue, 11 Aug 2026 07:23:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243159

--===============0798518612853032430==
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
From 77ecc06ab367cb212db8b4dee5197745bd60ddc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 11 Aug 2026 05:53:57 +0000
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


--===============0798518612853032430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 956 .bb files complete (0 cached, 956 parsed). 1987 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.0.99+snapshot-2528d68cd1b3f23c7334d4be52a3199223f16d95"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:2528d68cd1b3f23c7334d4be52a3199223f16d95"
meta-yocto-bsp       
meta-poky            = "master:0afedb9b1195525861f9140d6f33e9cd4118b199"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 246 Local 227 Mirrors 0 Missed 19 Current 507 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 650 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 665 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 671 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running task 1244 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_recipe_qa)
NOTE: Running task 1246 of 1934 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_recipe_qa)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 716 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 717 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 721 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 722 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1444 of 1934 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_fetch)
NOTE: recipe python3-editables-native-0.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 1445 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_fetch)
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 731 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-editables-native-0.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-editables_0.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-trove-classifiers_2026.6.1.19.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-1.32.0-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 1661 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_unpack)
NOTE: Running task 1666 of 1934 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_unpack)
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-native-26.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-editables-native-0.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pathspec-native-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-trove-classifiers-native-2026.6.1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1842 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-hatchling-1.32.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-native-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_unpack: Succeeded
NOTE: Running task 1853 of 1934 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_patch)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 745 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-calver_2025.10.20.bb:do_recipe_qa_setscene)
NOTE: Running task 1854 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_patch)
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_patch: Started
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_patch: Succeeded
NOTE: Running task 1855 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-calver-native-2025.10.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-1.32.0-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 1934 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1879 of 1934 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_populate_lic)
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-vcs-versioning_2.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-hatchling-1.32.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-1.32.0-r0: task do_populate_lic: Started
NOTE: Running task 1880 of 1934 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-hatchling-1.32.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-vcs-versioning-native-2.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatchling-1.32.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hatchling-1.32.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 753 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-hatchling-1.32.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-typing-extensions-native-4.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1911 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1916 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_configure)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_configure: Started
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_configure: Succeeded
NOTE: Running task 1917 of 1934 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_compile)
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/recipe-sysroot-native/usr/bin/nativepython3):
| 	tomlkit>=0.11.1
| 		wanted: >=0.11.1
| 		found: not installed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.859891:155 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/sources/hatchling-1.32.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.859891, line 155
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.859891, line 150
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.859891, line 159
NOTE: recipe python3-hatchling-native-1.32.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1917 tasks of which 1901 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260811055342.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260811055342.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/log.do_compile.859891
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hatchling-native-1.32.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/run.do_compile.859891' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.32.0/temp/log.do_compile.859891
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb:do_compile) failed with exit code '1'

--===============0798518612853032430==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.31.0-1.32.0.patch"

RnJvbSA3N2VjYzA2YWIzNjdjYjIxMmRiOGI0ZGVlNTE5Nzc0NWJkNjBkZGMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTEgQXVnIDIwMjYgMDU6NTM6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
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

--===============0798518612853032430==--

