Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A4FC3DA6C
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:14 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.173822.1692224352676109757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xi45JG4+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RWpWKb8c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a006e6f23-394e6157-2194-43a6-bd06-c27a2694764f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=45ichbc+73+YIhonPSCYBWXiR++6gLVqelc94qhpT14=;
	b=Xi45JG4+wiXR3AHdsCuUjGFqKwzL9gZT8VIpou3ve/hrKMPKsHUktUHkz5dXmHEs
	lLolP+tzlOJOoySr12P21Us9hL//WF+nBn80NEoVZo9zHhr3M5s1usgrxxMzB+DvbfJ
	bWoIJsASZveBc1v+iU1NoUAz26C9vJiXjWGnAZwU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=45ichbc+73+YIhonPSCYBWXiR++6gLVqelc94qhpT14=;
	b=RWpWKb8cRZ8IQuudHkC8CdIp+FnLdIz7ev5DnWTgXQqATjMEP2cMnGlL8zCGqW8w
	WFYBgYlmkkiwW21DC4jKkYfx9raE6me5yoE7BZJKf/O+DKmqNSW8eXeOyHvpqH1ULhF
	GzOxKTUuLULg9BJ7LYwr2c69L6XN7CWlLBOYJPqY=
Content-Type: multipart/mixed; boundary="===============4077294074321069870=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 247 SUCCEEDED
Message-ID: <0101018a006e6f23-394e6157-2194-43a6-bd06-c27a2694764f-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186256

--===============4077294074321069870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *247* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-244-247.patch
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
From 999592fd437767e3c88592fd4955f3ecd3bba6df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 21:51:38 +0000
Subject: [PATCH] diffoscope: upgrade 244 -> 247

---
 .../diffoscope/{diffoscope_244.bb => diffoscope_247.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_244.bb => diffoscope_247.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_244.bb b/meta/recipes-support/diffoscope/diffoscope_247.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_244.bb
rename to meta/recipes-support/diffoscope/diffoscope_247.bb
index c17bd81f5b..53d19cb1e3 100644
--- a/meta/recipes-support/diffoscope/diffoscope_244.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_247.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8bee8bbb144cdb7ddfa21886d5ce1822220139241c9a53def09b4adc3340db93"
+SRC_URI[sha256sum] = "3b05b4bf6390c7d1d23bf2741d2fc3d4ea65c12608b43420ef38175bd2dd5cfe"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.39.2


--===============4077294074321069870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 50 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-32 sysroot...done.
Removing 126 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============4077294074321069870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f062186c369b19c8c0519852c2e5a4b33ce585ad"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 141 Local 85 Mirrors 0 Missed 56 Current 1057 (60% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1114 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1115 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1154 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2255 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_recipe_qa)
NOTE: Running task 2256 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_recipe_qa)
NOTE: Running task 2533 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa)
NOTE: recipe lzo-2.10-r0: task do_recipe_qa: Started
NOTE: Running task 2575 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_recipe_qa)
NOTE: Running task 2656 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa)
NOTE: Running task 2658 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_recipe_qa)
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Started
NOTE: Running task 2659 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_recipe_qa)
NOTE: Running task 2660 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_recipe_qa)
NOTE: Running task 2851 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Started
NOTE: recipe diffoscope-247-r0: task do_recipe_qa: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Started
NOTE: Running task 3076 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.0.1592-r0: task do_recipe_qa: Started
NOTE: Running task 3111 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: Running task 3125 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe lzo-2.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3126 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe diffoscope-247-r0: task do_recipe_qa: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3127 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 3128 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 3129 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_fetch)
NOTE: Running task 3130 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 3131 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 3132 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 3133 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe diffoscope-247-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-247-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 3135 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_unpack)
NOTE: Running task 3136 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3137 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 3138 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3139 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 3140 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3141 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 3142 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3143 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 3144 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 3145 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe diffoscope-247-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3146 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 3147 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3148 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3149 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3150 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe diffoscope-247-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 3151 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_patch)
NOTE: Running task 3152 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_collect_spdx_deps)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 3153 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 3154 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 3155 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: Running task 3156 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 3157 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-247-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3158 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: Running task 3159 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 3160 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-247-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-247-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-247-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_patch: Succeeded
NOTE: Running task 3161 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 3162 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3163 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_deploy_source_date_epoch)
NOTE: Running task 3164 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-247-r0: task do_populate_lic: Started
NOTE: recipe diffoscope-247-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3165 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-247-r0: task do_populate_lic: Succeeded
NOTE: Running task 3166 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 3167 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_lic unihash changed to 24ff42d981138376a4fc0d85e8f8bcf8255c3094b6d118f892e5e7c001bf6b7b
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3168 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-247-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3169 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3170 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: Running task 3171 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 3172 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3173 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-247-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 3174 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 3175 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 3176 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-247-r0: task do_configure: Succeeded
NOTE: Running task 3177 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-247-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3178 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3179 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: Running task 3180 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: Running task 3181 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 3182 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3183 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 3184 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 3185 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe diffoscope-247-r0: task do_compile: Succeeded
NOTE: Running task 3186 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-247-r0: task do_install: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 3187 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3188 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 3189 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_install: Succeeded
NOTE: Running task 3190 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_package)
NOTE: Running task 3191 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_sysroot)
NOTE: recipe diffoscope-247-r0: task do_package: Started
NOTE: recipe diffoscope-247-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-247-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 3192 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 3193 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-247-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 3193 tasks of which 3114 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-libarchive-c/4.0/temp/log.do_packagedata.589072
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============4077294074321069870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 244 [default] to 247 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "244" to "247"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 244 [default] to 247 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "244" to "247"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 244 [default] to 247 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "244" to "247"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 244 [default] to 247 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "244" to "247"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 244 [default] to 247 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "244" to "247"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 244 [default] to 247 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "244" to "247"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1408493 to 1408502 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 244 [default] to 247 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "244" to "247"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-244.tar.gz;downloadfilename=diffoscope-244.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-247.tar.gz;downloadfilename=diffoscope-247.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 244 [default] to 247 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "244" to "247"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-244.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-247.dist-info

--===============4077294074321069870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f062186c369b19c8c0519852c2e5a4b33ce585ad"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 141 Local 85 Mirrors 0 Missed 56 Current 1057 (60% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1114 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1115 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1154 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2255 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_recipe_qa)
NOTE: Running task 2256 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_recipe_qa)
NOTE: Running task 2532 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2573 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_recipe_qa)
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Started
NOTE: Running task 2656 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_recipe_qa)
NOTE: Running task 2658 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_recipe_qa)
NOTE: Running task 2659 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa)
NOTE: Running task 2660 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_recipe_qa)
NOTE: recipe lzo-2.10-r0: task do_recipe_qa: Started
NOTE: Running task 2851 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe diffoscope-247-r0: task do_recipe_qa: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Started
NOTE: Running task 3076 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.0.1592-r0: task do_recipe_qa: Started
NOTE: Running task 3110 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: Running task 3124 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3125 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe diffoscope-247-r0: task do_recipe_qa: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3126 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3127 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 3128 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_fetch)
NOTE: Running task 3129 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 3130 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 3131 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 3132 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 3133 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: Running task 3134 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe diffoscope-247-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: Running task 3137 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 3138 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: Running task 3139 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_unpack)
NOTE: Running task 3140 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 3141 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3142 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 3143 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: Running task 3144 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3145 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 3146 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: Running task 3147 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 3148 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: Running task 3149 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe diffoscope-247-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-247-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: Running task 3150 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 3151 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 3152 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3153 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 3154 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 3155 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 3156 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-247-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 3157 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_patch)
NOTE: Running task 3158 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 3159 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 3160 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-247-r0: task do_patch: Started
NOTE: recipe diffoscope-247-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3161 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 3162 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 3163 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-247-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-247-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3164 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-247-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 3165 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_deploy_source_date_epoch)
NOTE: Running task 3166 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_lic)
NOTE: Running task 3167 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3168 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: Running task 3169 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-247-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3170 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: Running task 3171 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-247-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_lic unihash changed to 24ff42d981138376a4fc0d85e8f8bcf8255c3094b6d118f892e5e7c001bf6b7b
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3172 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe diffoscope-247-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3173 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3174 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3175 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: Running task 3176 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: Running task 3177 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe diffoscope-247-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe diffoscope-247-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 3178 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: Running task 3180 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 3181 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-247-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3182 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 3183 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 3184 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 3186 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: Running task 3187 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_install)
NOTE: recipe diffoscope-247-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 3189 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe diffoscope-247-r0: task do_install: Succeeded
NOTE: Running task 3190 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_package)
NOTE: Running task 3191 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_sysroot)
NOTE: recipe diffoscope-247-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-247-r0: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-247-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 3192 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 3193 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 3194 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 3195 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-247-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3195 tasks of which 3114 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-libarchive-c/4.0/temp/log.do_packagedata.521200
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============4077294074321069870==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-244-247.patch"

RnJvbSA5OTk1OTJmZDQzNzc2N2UzYzg4NTkyZmQ0OTU1ZjNlY2QzYmJhNmRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMjE6NTE6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI0NCAtPiAyNDcKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjQ0LmJiID0+IGRpZmZvc2NvcGVfMjQ3LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNDQuYmIgPT4gZGlmZm9zY29wZV8y
NDcuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI0NC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNDcuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0NC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0Ny5iYgppbmRleCBjMTdiZDgx
ZjViLi41M2QxOWNiMWUzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjQ0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNDcuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiOGJlZThiYmIxNDRjZGI3ZGRmYTIxODg2ZDVjZTE4MjIyMjAxMzkyNDFjOWE1M2RlZjA5
YjRhZGMzMzQwZGI5MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYjA1YjRiZjYzOTBjN2QxZDIz
YmYyNzQxZDJmYzNkNGVhNjVjMTI2MDhiNDM0MjBlZjM4MTc1YmQyZGQ1Y2ZlIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjM5LjIKCg==

--===============4077294074321069870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1805 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f062186c369b19c8c0519852c2e5a4b33ce585ad"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 141 Local 85 Mirrors 0 Missed 56 Current 1057 (60% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1114 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1115 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1154 of 1198 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2255 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_recipe_qa)
NOTE: Running task 2256 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_recipe_qa)
NOTE: Running task 2534 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2575 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_recipe_qa)
NOTE: Running task 2656 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_recipe_qa)
NOTE: Running task 2657 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa)
NOTE: Running task 2659 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_recipe_qa)
NOTE: Running task 2660 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_recipe_qa)
NOTE: recipe lzo-2.10-r0: task do_recipe_qa: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Started
NOTE: Running task 2850 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe diffoscope-247-r0: task do_recipe_qa: Started
NOTE: Running task 3075 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Started
NOTE: Running task 3110 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.0.1592-r0: task do_recipe_qa: Started
NOTE: Running task 3124 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3125 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Succeeded
NOTE: recipe diffoscope-247-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3126 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 3127 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 3128 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_fetch)
NOTE: Running task 3129 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 3130 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 3131 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 3132 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 3133 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: Running task 3134 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-247-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 3137 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 3138 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3139 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 3140 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: Running task 3141 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 3142 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3143 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_unpack)
NOTE: Running task 3144 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 3145 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 3146 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3147 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: Running task 3148 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 3149 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe diffoscope-247-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: Running task 3150 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-247-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3151 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 3152 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: Running task 3153 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 3154 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-247-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 3155 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 3156 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: Running task 3157 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_patch)
NOTE: Running task 3158 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_collect_spdx_deps)
NOTE: Running task 3159 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 3160 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-247-r0: task do_patch: Started
NOTE: recipe diffoscope-247-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3161 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3162 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 3163 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-247-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_patch: Succeeded
NOTE: Running task 3164 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 3165 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_deploy_source_date_epoch)
NOTE: Running task 3166 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3167 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_lic)
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: Running task 3168 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-247-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3169 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3170 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_populate_lic: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3171 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_lic unihash changed to 24ff42d981138376a4fc0d85e8f8bcf8255c3094b6d118f892e5e7c001bf6b7b
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-247-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3172 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 3173 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3174 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: Running task 3175 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3176 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe diffoscope-247-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3177 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 3178 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe diffoscope-247-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 3180 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 3181 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: Running task 3182 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe diffoscope-247-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3183 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 3184 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 3185 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 3186 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-247-r0: task do_compile: Succeeded
NOTE: Running task 3187 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_install)
NOTE: recipe diffoscope-247-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 3189 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-247-r0: task do_install: Succeeded
NOTE: Running task 3190 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_package)
NOTE: Running task 3191 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_sysroot)
NOTE: recipe diffoscope-247-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-247-r0: task do_package: Started
NOTE: recipe diffoscope-247-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 3192 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 3193 of 3243 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe diffoscope-247-r0: task do_package: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 3193 tasks of which 3114 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-libarchive-c/4.0/temp/log.do_packagedata.443736
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============4077294074321069870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f062186c369b19c8c0519852c2e5a4b33ce585ad"
workspace            = "master:05affd7d0d143d6fa5c6aff0d40c5d9e046f4b0c"

Initialising tasks...done.
Sstate summary: Wanted 139 Local 83 Mirrors 0 Missed 56 Current 1067 (59% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 1162 of 1206 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2261 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_recipe_qa)
NOTE: Running task 2262 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_recipe_qa)
NOTE: Running task 2554 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa)
NOTE: Running task 2595 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_recipe_qa)
NOTE: Running task 2676 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_recipe_qa)
NOTE: Running task 2677 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_recipe_qa)
NOTE: Running task 2678 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_recipe_qa)
NOTE: Running task 2680 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_recipe_qa)
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Started
NOTE: recipe lzo-2.10-r0: task do_recipe_qa: Started
NOTE: Running task 2868 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-247-r0: task do_recipe_qa: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Started
NOTE: Running task 3097 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Started
NOTE: recipe vim-9.0.1592-r0: task do_recipe_qa: Started
NOTE: Running task 3134 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: Running task 3148 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe diffoscope-247-r0: task do_recipe_qa: Succeeded
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_recipe_qa: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_recipe_qa: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3151 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 3152 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 3153 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 3154 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_fetch)
NOTE: Running task 3155 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 3156 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 3157 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 3158 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 3159 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Started
NOTE: Running task 3160 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe diffoscope-247-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 3161 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 3162 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3163 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 3164 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: Running task 3165 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 3166 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3167 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_unpack)
NOTE: Running task 3168 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 3169 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3170 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3171 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 3172 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3173 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-247-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: Running task 3174 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-247-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3175 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 3176 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: Running task 3177 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 3178 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-247-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3179 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_patch)
NOTE: Running task 3180 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: Running task 3181 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 3182 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3183 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 3184 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe diffoscope-247-r0: task do_patch: Started
NOTE: recipe diffoscope-247-r0: task do_collect_spdx_deps: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3185 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: Running task 3186 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_collect_spdx_deps)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 3187 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-247-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-247-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 3188 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_patch: Succeeded
NOTE: Running task 3189 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3190 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 3191 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_deploy_source_date_epoch)
NOTE: Running task 3192 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_lic)
NOTE: recipe squashfs-tools-4.6.1-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-247-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3193 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-247-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3194 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-247-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_lic unihash changed to 24ff42d981138376a4fc0d85e8f8bcf8255c3094b6d118f892e5e7c001bf6b7b
NOTE: Running task 3195 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3196 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3197 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-247-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3198 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 3199 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: Running task 3200 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-247-r0: task do_configure: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3201 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3202 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 3203 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: Running task 3204 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe diffoscope-247-r0: task do_configure: Succeeded
NOTE: Running task 3205 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 3206 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_compile)
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-247-r0: task do_compile: Started
NOTE: Running task 3207 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 3208 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 3209 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 3210 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-247-r0: task do_compile: Succeeded
NOTE: Running task 3211 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_install)
NOTE: recipe diffoscope-247-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 3212 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 3213 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe diffoscope-247-r0: task do_install: Succeeded
NOTE: Running task 3214 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_package)
NOTE: Running task 3215 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_247.bb:do_populate_sysroot)
NOTE: recipe diffoscope-247-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-247-r0: task do_package: Started
NOTE: recipe diffoscope-247-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 3216 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: Running task 3217 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 3218 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 3219 of 3267 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Failed
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-247-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 3219 tasks of which 3138 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-libarchive-c/4.0/temp/log.do_packagedata.340216
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata) failed with exit code '1'

--===============4077294074321069870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-244.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-247.dist-info

--===============4077294074321069870==--

