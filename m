Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBB3EEEC3E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.29473.1694804394522858603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BBMwSTB4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l10ZAwBU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a9a36c764-bb6fc4fd-0c01-496d-8371-2b38bbf78eda-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AU+Kka98opSqo1MBkKvIB8f8Ok1VpzUk6wmUCDmlzPE=;
	b=BBMwSTB47rxPkoVmoLDGGdkAgT58Voaux3JNK2AkxA63zZFgn4sYgcDRGCcHlYgE
	Wv/PvVLAi+f6ye+wv2CW2c6ce1jkWpDI8/DY/i0Nc/asdHUutXwjiZomAmQBRyEXn11
	Mnn0Pno/YBV3JC9FAVj6Fk4h/ki25marnPWSHgQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AU+Kka98opSqo1MBkKvIB8f8Ok1VpzUk6wmUCDmlzPE=;
	b=l10ZAwBU8MAPFiZxWHYYMqb8ugGxm/+FpSXkTwVE4gZSMwlKlPkRoSMFr6tjZ1BU
	MlWTENufsjzOTV32WzF9jW5yq116emhKSSNb4BcVJsWItOU/S04UwQG6rpslod0PdaE
	IbzEwxpHOxVmDIOi87p3oJgXCuowbZyGyuSIh2ec=
Content-Type: multipart/mixed; boundary="===============5544877296959815347=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 249 SUCCEEDED
Message-ID: <0101018a9a36c764-bb6fc4fd-0c01-496d-8371-2b38bbf78eda-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187764

--===============5544877296959815347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *249* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-244-249.patch
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
From e5bdca148bedd387dbd976fb896f212646dd1dc5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 18:21:18 +0000
Subject: [PATCH] diffoscope: upgrade 244 -> 249

---
 .../diffoscope/{diffoscope_244.bb => diffoscope_249.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_244.bb => diffoscope_249.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_244.bb b/meta/recipes-support/diffoscope/diffoscope_249.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_244.bb
rename to meta/recipes-support/diffoscope/diffoscope_249.bb
index c17bd81f5b..b679103694 100644
--- a/meta/recipes-support/diffoscope/diffoscope_244.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_249.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8bee8bbb144cdb7ddfa21886d5ce1822220139241c9a53def09b4adc3340db93"
+SRC_URI[sha256sum] = "bc4d8cb3198025013784ef7e3fa61b7a642de39e5b790c45d7c29d153306fbdd"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.39.2


--===============5544877296959815347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1809 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-69722c460d49c96ab1ce328b3d563f6cba54449c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:69722c460d49c96ab1ce328b3d563f6cba54449c"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 25 Mirrors 0 Missed 61 Current 1120 (29% match, 94% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1923 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2255 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_recipe_qa)
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Started
NOTE: Running task 2546 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 2548 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2587 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_recipe_qa)
NOTE: Running task 2661 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_recipe_qa)
NOTE: Running task 2662 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_recipe_qa)
NOTE: Running task 2663 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa)
NOTE: Running task 2664 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_recipe_qa)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: Running task 2883 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_recipe_qa)
NOTE: recipe diffoscope-249-r0: task do_recipe_qa: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Started
NOTE: Running task 2979 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: recipe vim-9.0.1894-r0: task do_recipe_qa: Started
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3088 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 3089 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe diffoscope-249-r0: task do_recipe_qa: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: Running task 3090 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_fetch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3091 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 3092 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 3093 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe vim-9.0.1894-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3094 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 3095 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3096 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3097 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 3098 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 3099 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe diffoscope-249-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-249-r0: task do_fetch: Succeeded
NOTE: Running task 3100 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 3101 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 3102 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 3103 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_unpack)
NOTE: Running task 3104 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 3105 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 3106 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1894-r0: task do_fetch: Started
NOTE: Running task 3107 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 3108 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3109 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 3110 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 3111 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 3112 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1894-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3113 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe diffoscope-249-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-249-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 3114 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 3115 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: Running task 3116 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 3117 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-249-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3118 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 3119 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3120 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.0.1894-r0: task do_unpack: Started
NOTE: Running task 3121 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3122 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 3123 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 3124 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe diffoscope-249-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-249-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5b28f4df3b7a45811ba331aec74ee1e0153bfdd8dbe8eb7a349a0da3250c4fef
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: Running task 3156 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3157 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 3158 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3159 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: Running task 3160 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 3161 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 3162 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-249-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-249-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3163 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-249-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 3164 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_deploy_source_date_epoch)
NOTE: Running task 3165 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_lic)
NOTE: Running task 3166 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3167 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 3168 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-249-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-249-r0: task do_populate_lic: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3169 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 3170 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 3171 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3172 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe diffoscope-249-r0: task do_populate_lic: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_lic unihash changed to ca76cb341c03bacd19601ef5365ea5ae73186c7d36c207954723c0babfddea25
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe diffoscope-249-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3173 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3174 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 3175 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe diffoscope-249-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 3176 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe diffoscope-249-r0: task do_configure: Succeeded
NOTE: Running task 3177 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to bbd9eabba2f33064b48fb5e4dcfe60a80e24085bebcd82aaeb2bc06e214d6d13
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 78dd584855dc9f7a5c062558642b35aa353e8d7c3410400a6cdfa3ab205c18d0 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '8224d60220c15486b0605cacf2bb5bc5669d39a21ff4c0a10a14f03392e98ea6', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '78dd584855dc9f7a5c062558642b35aa353e8d7c3410400a6cdfa3ab205c18d0'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 8224d60220c15486b0605cacf2bb5bc5669d39a21ff4c0a10a14f03392e98ea6 -> 78dd584855dc9f7a5c062558642b35aa353e8d7c3410400a6cdfa3ab205c18d0 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 3186 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 3187 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3204 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe diffoscope-249-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.1894-r0: task do_unpack: Succeeded
NOTE: Running task 3205 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1894-r0: task do_patch: Started
NOTE: recipe vim-9.0.1894-r0: task do_patch: Succeeded
NOTE: Running task 3206 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1894-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1894-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 3207 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: Running task 3208 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-249-r0: task do_compile: Succeeded
NOTE: Running task 3209 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_install)
NOTE: recipe diffoscope-249-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 3210 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 3211 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-249-r0: task do_install: Succeeded
NOTE: Running task 3212 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_package)
NOTE: Running task 3213 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_sysroot)
NOTE: recipe diffoscope-249-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-249-r0: task do_package: Started
NOTE: recipe diffoscope-249-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 3214 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 3215 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 3216 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 3217 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-249-r0: task do_package: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3217 tasks of which 3131 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-libarchive-c/4.0/temp/log.do_packagedata.341116
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============5544877296959815347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-69722c460d49c96ab1ce328b3d563f6cba54449c"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:69722c460d49c96ab1ce328b3d563f6cba54449c"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 87 Local 26 Mirrors 0 Missed 61 Current 1111 (29% match, 94% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1137 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1923 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2246 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_recipe_qa)
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Started
NOTE: Running task 2526 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 2527 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2567 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_recipe_qa)
NOTE: Running task 2640 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa)
NOTE: Running task 2641 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_recipe_qa)
NOTE: Running task 2642 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_recipe_qa)
NOTE: Running task 2643 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_recipe_qa)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe diffoscope-249-r0: task do_recipe_qa: Started
NOTE: Running task 2863 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_recipe_qa)
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2905 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Started
NOTE: recipe vim-9.0.1894-r0: task do_recipe_qa: Started
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe diffoscope-249-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3064 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3065 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 3066 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_fetch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3067 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Succeeded
NOTE: recipe vim-9.0.1894-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3068 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3069 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 3070 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3071 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3072 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 3073 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 3074 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-249-r0: task do_fetch: Started
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 3075 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: Running task 3076 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 3077 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-249-r0: task do_fetch: Succeeded
NOTE: Running task 3078 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 3079 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1894-r0: task do_fetch: Started
NOTE: Running task 3080 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_unpack)
NOTE: Running task 3081 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 3082 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 3083 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3084 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 3085 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 3086 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1894-r0: task do_fetch: Succeeded
NOTE: Running task 3087 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 3088 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: Running task 3089 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-249-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-249-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3090 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 3091 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 3092 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 3093 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1894-r0: task do_unpack: Started
NOTE: recipe diffoscope-249-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: Running task 3094 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 3095 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3096 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_patch)
NOTE: Running task 3097 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3098 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 3099 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 3100 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-249-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-249-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d0ef6662ae372fa27fc72347367b49c49f9a3fa83629e8c158b959f0b7205cdd
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3132 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3133 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 3134 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 3135 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 3136 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 3137 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 3138 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-249-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-249-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-249-r0: task do_patch: Succeeded
NOTE: Running task 3139 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_deploy_source_date_epoch)
NOTE: Running task 3140 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3141 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3142 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: Running task 3143 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 3144 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-249-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-249-r0: task do_populate_lic: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3145 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3146 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3147 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe diffoscope-249-r0: task do_populate_lic: Succeeded
NOTE: Running task 3148 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_lic unihash changed to ca76cb341c03bacd19601ef5365ea5ae73186c7d36c207954723c0babfddea25
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe diffoscope-249-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: Running task 3149 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: Running task 3150 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3151 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-249-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 3152 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-249-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 3153 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 47494d9e181fcc292c328be9c9d3307004fa465e0edc79a25fb3affe9de5dbf5
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 033c83fe6406c549717fcb26b494bc7692469c3f00270eaa72ef87d5f0599919 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'dd6740756f252c1c6e6a4cca2a409b39248d67a1e45598ccbc2029fd73e68b33', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '033c83fe6406c549717fcb26b494bc7692469c3f00270eaa72ef87d5f0599919'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed dd6740756f252c1c6e6a4cca2a409b39248d67a1e45598ccbc2029fd73e68b33 -> 033c83fe6406c549717fcb26b494bc7692469c3f00270eaa72ef87d5f0599919 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 3178 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3180 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe diffoscope-249-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.1894-r0: task do_unpack: Succeeded
NOTE: Running task 3181 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1894-r0: task do_patch: Started
NOTE: recipe vim-9.0.1894-r0: task do_patch: Succeeded
NOTE: Running task 3182 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1894-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1894-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 3183 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 3184 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-249-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_install)
NOTE: recipe diffoscope-249-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 3186 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 3187 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe diffoscope-249-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_package)
NOTE: Running task 3189 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_sysroot)
NOTE: recipe diffoscope-249-r0: task do_package: Started
NOTE: recipe diffoscope-249-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-249-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 3190 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-249-r0: task do_package: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3191 tasks of which 3107 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-libarchive-c/4.0/temp/log.do_packagedata.375493
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============5544877296959815347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 114 recipes from the core2-32 sysroot...done.
Removing 126 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============5544877296959815347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-69722c460d49c96ab1ce328b3d563f6cba54449c"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:69722c460d49c96ab1ce328b3d563f6cba54449c"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 87 Local 26 Mirrors 0 Missed 61 Current 1111 (29% match, 94% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1137 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1923 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2247 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2524 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2526 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 2565 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_recipe_qa)
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Started
NOTE: Running task 2640 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_recipe_qa)
NOTE: Running task 2642 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_recipe_qa)
NOTE: Running task 2643 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa)
NOTE: Running task 2644 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_recipe_qa)
NOTE: Running task 2861 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_recipe_qa)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe diffoscope-249-r0: task do_recipe_qa: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2996 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Started
NOTE: recipe vim-9.0.1894-r0: task do_recipe_qa: Started
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe diffoscope-249-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3064 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3065 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 3066 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_fetch)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3067 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3068 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe vim-9.0.1894-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3069 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 3070 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 3071 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3072 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3073 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3074 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3075 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-249-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 3076 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 3077 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 3078 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-249-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 3079 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_unpack)
NOTE: Running task 3080 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1894-r0: task do_fetch: Started
NOTE: Running task 3081 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 3082 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 3083 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 3084 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 3085 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 3086 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 3087 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: Running task 3088 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1894-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 3089 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-249-r0: task do_unpack: Started
NOTE: recipe diffoscope-249-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 3090 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 3091 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 3092 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 3093 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3094 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3095 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-9.0.1894-r0: task do_unpack: Started
NOTE: recipe diffoscope-249-r0: task do_unpack: Succeeded
NOTE: Running task 3096 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_patch)
NOTE: Running task 3097 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3098 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 3099 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: Running task 3100 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9493080bb9803e924e9207643fec480cf0b240db3a3e6063b46080b85022abf3
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-249-r0: task do_patch: Started
NOTE: recipe diffoscope-249-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3132 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3133 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 3134 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 3135 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: Running task 3136 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 3137 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 3138 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-249-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-249-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-249-r0: task do_patch: Succeeded
NOTE: Running task 3139 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_deploy_source_date_epoch)
NOTE: Running task 3140 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 3141 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 3142 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3143 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3144 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe diffoscope-249-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-249-r0: task do_populate_lic: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3145 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3146 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 3147 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-249-r0: task do_populate_lic: Succeeded
NOTE: Running task 3148 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_lic unihash changed to ca76cb341c03bacd19601ef5365ea5ae73186c7d36c207954723c0babfddea25
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-249-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3149 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3150 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_configure)
NOTE: Running task 3151 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-249-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: Running task 3152 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5c46eaaea9a95ec3cdfae4336e00821ada1f410bba53862e1d7f98f1b5ab10f8
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 59cda1416e9e1d4bd834ef654bf9d749bd13070e15b73d7d74cee635d6f66d22 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '5b45612330f49665eba11aa0c5be65b8e3ad3476132ff9cb44bac0a25a9bb58e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '59cda1416e9e1d4bd834ef654bf9d749bd13070e15b73d7d74cee635d6f66d22'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5b45612330f49665eba11aa0c5be65b8e3ad3476132ff9cb44bac0a25a9bb58e -> 59cda1416e9e1d4bd834ef654bf9d749bd13070e15b73d7d74cee635d6f66d22 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-249-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 3177 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 3178 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_compile)
NOTE: Running task 3179 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3180 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-249-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.1894-r0: task do_unpack: Succeeded
NOTE: Running task 3181 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.1894-r0: task do_patch: Started
NOTE: recipe vim-9.0.1894-r0: task do_patch: Succeeded
NOTE: Running task 3182 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1894-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1894-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 3183 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 3184 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-249-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_install)
NOTE: recipe diffoscope-249-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 3186 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 3187 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-249-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_package)
NOTE: Running task 3189 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_sysroot)
NOTE: recipe diffoscope-249-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-249-r0: task do_package: Started
NOTE: recipe diffoscope-249-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 3190 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 3191 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 3192 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: Running task 3193 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-249-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3193 tasks of which 3107 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-libarchive-c/4.0/temp/log.do_packagedata.364074
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============5544877296959815347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-69722c460d49c96ab1ce328b3d563f6cba54449c"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:69722c460d49c96ab1ce328b3d563f6cba54449c"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 87 Local 26 Mirrors 0 Missed 61 Current 1111 (29% match, 94% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1137 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1923 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2247 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2526 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 2528 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2567 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_recipe_qa)
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Started
NOTE: Running task 2641 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_recipe_qa)
NOTE: Running task 2642 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa)
NOTE: Running task 2643 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_recipe_qa)
NOTE: Running task 2644 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_recipe_qa)
NOTE: Running task 2863 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_recipe_qa)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe diffoscope-249-r0: task do_recipe_qa: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Started
NOTE: recipe vim-9.0.1894-r0: task do_recipe_qa: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3063 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe diffoscope-249-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3064 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 3065 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 3066 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_fetch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3067 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3068 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1894-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3069 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 3070 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3071 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3072 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3073 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 3074 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe diffoscope-249-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: Running task 3075 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-249-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 3076 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 3077 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_unpack)
NOTE: Running task 3078 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1894-r0: task do_fetch: Started
NOTE: Running task 3079 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 3080 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 3081 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 3082 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 3083 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 3084 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 3085 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 3086 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 3087 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe vim-9.0.1894-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3088 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3089 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe diffoscope-249-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-249-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 3090 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3091 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-249-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 3092 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_patch)
NOTE: Running task 3093 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 3094 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 3095 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_collect_spdx_deps)
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1894-r0: task do_unpack: Started
NOTE: Running task 3096 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: Running task 3097 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3098 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 3099 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: Running task 3100 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe diffoscope-249-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe diffoscope-249-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 3101 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bbed31d8c22a06808d37b4890d92fb48e12c87ded35bea0d18c00e01704fdf4b
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3133 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 3134 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 3135 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3136 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 3137 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 3138 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-249-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-249-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-249-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3139 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_deploy_source_date_epoch)
NOTE: Running task 3140 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3141 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3142 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3143 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: Running task 3144 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-249-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-249-r0: task do_populate_lic: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3145 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3146 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3147 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe diffoscope-249-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_lic unihash changed to ca76cb341c03bacd19601ef5365ea5ae73186c7d36c207954723c0babfddea25
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 3148 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe diffoscope-249-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3149 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_configure)
NOTE: Running task 3150 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: Running task 3151 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-249-r0: task do_configure: Started
NOTE: Running task 3152 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-249-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 3153 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_compile)
NOTE: Running task 3154 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 74767825f4c36d5bdaa875783dc6b2eb411b129256d8a55c59fc108cf1e64ed1
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash e6ef8c5f50b7116ad00f512d3aaef87845d82d8c84bbb92c6f641859951e5013 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '8087a14e80bcb01c6a1c4f2e65fe3fbc163e88c9461daf5f96dc3ab407331570', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'e6ef8c5f50b7116ad00f512d3aaef87845d82d8c84bbb92c6f641859951e5013'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 8087a14e80bcb01c6a1c4f2e65fe3fbc163e88c9461daf5f96dc3ab407331570 -> e6ef8c5f50b7116ad00f512d3aaef87845d82d8c84bbb92c6f641859951e5013 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: Running task 3180 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-249-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe vim-9.0.1894-r0: task do_unpack: Succeeded
NOTE: Running task 3181 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-9.0.1894-r0: task do_patch: Started
NOTE: recipe vim-9.0.1894-r0: task do_patch: Succeeded
NOTE: Running task 3182 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1894-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1894-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 3183 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 3184 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-249-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_install)
NOTE: recipe diffoscope-249-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 3186 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 3187 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-249-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_package)
NOTE: Running task 3189 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_249.bb:do_populate_sysroot)
NOTE: recipe diffoscope-249-r0: task do_package: Started
NOTE: recipe diffoscope-249-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-249-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 3190 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 3191 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3192 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 3193 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 3194 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-249-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3194 tasks of which 3107 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-src went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dbg went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-staticdev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-dev went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-doc went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c-locale went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: QA Issue: Package version for package python3-libarchive-c went backwards which would break package feeds (from 0:5.0-r0 to 0:4.0-r0) [version-going-backwards]
ERROR: python3-libarchive-c-4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-libarchive-c/4.0/temp/log.do_packagedata.352791
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============5544877296959815347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 244 [default] to 249 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "244" to "249"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 244 [default] to 249 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "244" to "249"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 244 [default] to 249 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "244" to "249"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 244 [default] to 249 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "244" to "249"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 244 [default] to 249 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "244" to "249"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 244 [default] to 249 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "244" to "249"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 244 [default] to 249 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "244" to "249"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1408493 to 1411418 (+0%)
packages/core2-32-poky-linux/diffoscope: PKGV changed from 244 [default] to 249 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "244" to "249"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-244.tar.gz;downloadfilename=diffoscope-244.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-249.tar.gz;downloadfilename=diffoscope-249.tar.gz"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-244.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-249.dist-info

--===============5544877296959815347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-244.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-249.dist-info

--===============5544877296959815347==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-244-249.patch"

RnJvbSBlNWJkY2ExNDhiZWRkMzg3ZGJkOTc2ZmI4OTZmMjEyNjQ2ZGQxZGM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTg6MjE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI0NCAtPiAyNDkKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjQ0LmJiID0+IGRpZmZvc2NvcGVfMjQ5LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNDQuYmIgPT4gZGlmZm9zY29wZV8y
NDkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI0NC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNDkuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0NC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0OS5iYgppbmRleCBjMTdiZDgx
ZjViLi5iNjc5MTAzNjk0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjQ0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNDkuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOGJlZThiYmIxNDRjZGI3ZGRmYTIxODg2ZDVjZTE4MjIyMjAxMzkyNDFjOWE1M2RlZjA5
YjRhZGMzMzQwZGI5MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiYzRkOGNiMzE5ODAyNTAxMzc4
NGVmN2UzZmE2MWI3YTY0MmRlMzllNWI3OTBjNDVkN2MyOWQxNTMzMDZmYmRkIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjM5LjIKCg==

--===============5544877296959815347==--

