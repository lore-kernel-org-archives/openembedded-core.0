Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C95EC00528
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.824.1686887483280370536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KOPny0FW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c2544b36-62319d7a-2b2e-4e40-aea8-a0374f85e147-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n0YZ+uBUVkQlnCelC9yoKJPrfI1skpSnFqjFwzHoCNU=;
	b=KOPny0FW0WpvQMffGOeSs9sjtPVFM+/a58+Gdjj1GPJ042evBk4418uvjBOBFifH
	kVQ1natvhjVk9c9NXumc+XQqyzZXc/oAzTvoa0hVYbPEyQYvRnPb2BUQouN4KRIOKXy
	t8WgawFIGuT+0sMId5/WrKd4xiOmmCw4ef6jx3qU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n0YZ+uBUVkQlnCelC9yoKJPrfI1skpSnFqjFwzHoCNU=;
	b=FsZqOJ2+kXavp1K6IFVu0UUNm4YLsFuMXyiZmp7Lxv1wKS7QqwlPNXazjc4T5Vsx
	7/QAvMa1RXj2jhoA3ff3NqQ3TKh2SecMH7DSTBn/olnIE0D+Ab1bgmrlGqGVcbd3Rsb
	JfZk88h8ycxqv3si0/OttN6WSAoqiT09ZqAgMscc=
Content-Type: multipart/mixed; boundary="===============8922147305197477706=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to b8a094494356111860821ac14917c12d39329aa0
 SUCCEEDED
Message-ID: <01010188c2544b36-62319d7a-2b2e-4e40-aea8-a0374f85e147-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182967

--===============8922147305197477706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *b8a094494356111860821ac14917c12d39329aa0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
From 2b5db83d8b6686ee40bebee8f935840fcab7584b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 20:42:54 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index cd97ee5354..6dde87775f 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "5036601c43fff63f7be5cd8ad7b319a5c1f6652c"
+SRCREV = "b8a094494356111860821ac14917c12d39329aa0"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.39.2


--===============8922147305197477706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8ef1eae8d94dec0dd6323b79d54e0fe269b79d23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 66 Local 32 Mirrors 0 Missed 34 Current 635 (48% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 679 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1662879
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 700 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: Running task 1661 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1711 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1815 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1871 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1881 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 1893 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1894 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1992 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1996 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: Running task 2161 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2162 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 2173 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 2174 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2175 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 2176 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Succeeded
NOTE: Running task 2177 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2179 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Started
NOTE: Running task 2180 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: Running task 2181 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2182 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2185 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2186 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2187 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2188 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2189 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Succeeded
NOTE: Running task 2191 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2192 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2193 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Succeeded
NOTE: Running task 2194 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2195 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Setscene tasks completed
NOTE: Running task 2207 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: Running task 2208 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2209 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2211 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2212 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 15d1bb8c7262721d73f189056989e3b5dfe96873fedc92cacc007c7077dc1e89
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2213 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2215 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: Running task 2216 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2217 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2218 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2220 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2223 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2224 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2225 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_create_spdx)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2227 tasks of which 2173 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-markupsafe/2.1.2-r0/temp/log.do_packagedata.1667093
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata) failed with exit code '1'

--===============8922147305197477706==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAyYjVkYjgzZDhiNjY4NmVlNDBiZWJlZThmOTM1ODQwZmNhYjc1ODRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjA6NDI6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgppbmRleCBjZDk3ZWU1MzU0Li42ZGRlODc3NzVmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAi
MSIKIAotU1JDUkVWID0gIjUwMzY2MDFjNDNmZmY2M2Y3YmU1Y2Q4YWQ3YjMxOWE1YzFmNjY1MmMi
CitTUkNSRVYgPSAiYjhhMDk0NDk0MzU2MTExODYwODIxYWMxNDkxN2MxMmQzOTMyOWFhMCIKICMg
KHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4w
K2dpdHIke1NSQ1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============8922147305197477706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+5036601c43 [default] to 1.0+gitrAUTOINC+b8a0944943 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22594 to 22650 (+0%)
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/arb_gpu_shader5/execution/built-in-functions/fs-bitfieldInsert-pow2-and-zero.shader_test /usr/lib/piglit/bin/depth-clear-with-copy"
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+b8a0944943"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2050727412 to 2050742148 (+0%)
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943

--===============8922147305197477706==
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
meta-yocto-bsp       = "tmp-auh-upgrades:8ef1eae8d94dec0dd6323b79d54e0fe269b79d23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 33 Mirrors 0 Missed 34 Current 634 (49% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 679 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1661 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1711 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1815 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1871 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1881 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 1892 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1893 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1670565
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 700 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: Running task 1956 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 1957 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: Running task 1958 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1959 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 1960 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 1961 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1962 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2001 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2002 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 2168 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: Running task 2179 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: Running task 2180 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 2181 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2182 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2185 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2186 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2187 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2188 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2189 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Succeeded
NOTE: Running task 2191 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2192 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2193 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2205 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: Running task 2206 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2207 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Succeeded
NOTE: Running task 2209 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2210 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2211 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2212 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 15d1bb8c7262721d73f189056989e3b5dfe96873fedc92cacc007c7077dc1e89
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2213 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2215 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: Running task 2216 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2217 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2220 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2223 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2224 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: Running task 2225 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_create_spdx)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Started
NOTE: Running task 2227 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2228 tasks of which 2173 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-markupsafe/2.1.2-r0/temp/log.do_packagedata.1674908
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata) failed with exit code '1'

--===============8922147305197477706==
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
meta-yocto-bsp       = "tmp-auh-upgrades:8ef1eae8d94dec0dd6323b79d54e0fe269b79d23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 33 Mirrors 0 Missed 34 Current 634 (49% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 679 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 684 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 699 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1701659
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 700 of 701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: Running task 1661 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1711 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1815 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1870 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1881 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 1892 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1893 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1994 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 2022 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Started
NOTE: Running task 2159 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2171 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 2172 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 2173 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: Running task 2174 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 2175 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 2176 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Succeeded
NOTE: Running task 2177 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2178 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2179 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: Running task 2180 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2181 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2182 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2185 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2186 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2187 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: Running task 2188 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2189 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: Running task 2190 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2202 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: Running task 2203 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2204 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 2205 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2207 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: Running task 2208 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Succeeded
NOTE: Running task 2209 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2210 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2211 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2212 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2214 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 2215 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2216 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 15d1bb8c7262721d73f189056989e3b5dfe96873fedc92cacc007c7077dc1e89
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2217 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2219 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2220 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2221 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2223 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2224 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2226 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_create_spdx)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: Running task 2228 of 2262 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Failed
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2228 tasks of which 2173 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-markupsafe/2.1.2-r0/temp/log.do_packagedata.1706062
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata) failed with exit code '1'

--===============8922147305197477706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/depth-clear-with-copy /usr/lib/piglit/tests/spec/arb_gpu_shader5/execution/built-in-functions/fs-bitfieldInsert-pow2-and-zero.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+b8a0944943

--===============8922147305197477706==
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
meta-yocto-bsp       = "tmp-auh-upgrades:8ef1eae8d94dec0dd6323b79d54e0fe269b79d23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 67 Local 33 Mirrors 0 Missed 34 Current 629 (49% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 674 of 696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 679 of 696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 694 of 696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1651 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1701 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1803 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1857 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 1867 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 1878 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1880 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1981 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1678307
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 695 of 696 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2053 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 2054 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: Running task 2055 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 2056 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 2057 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 2058 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 2059 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2060 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2150 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2162 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2163 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: Running task 2164 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: Running task 2165 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2166 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2167 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2168 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2169 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2170 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2171 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2172 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2173 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2174 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Succeeded
NOTE: Running task 2175 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2176 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 2188 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2189 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2190 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2191 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Succeeded
NOTE: Running task 2193 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2194 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2195 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2196 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 15d1bb8c7262721d73f189056989e3b5dfe96873fedc92cacc007c7077dc1e89
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2199 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 2200 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2201 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2204 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2205 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 2206 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2207 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2208 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2209 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2210 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_create_spdx)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Started
NOTE: Running task 2211 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2212 of 2246 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2212 tasks of which 2157 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-markupsafe/2.1.2-r0/temp/log.do_packagedata.1682785
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata) failed with exit code '1'

--===============8922147305197477706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 72 recipes from the core2-32 sysroot...done.
Removing 80 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:8ef1eae8d94dec0dd6323b79d54e0fe269b79d23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 404 Local 370 Mirrors 0 Missed 34 Current 266 (91% match, 94% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 267 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 275 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 284 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 306 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 307 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 316 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 318 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 332 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 334 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 347 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: Running setscene task 348 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 356 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 749 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 750 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 765 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 770 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 771 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 775 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 776 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 790 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 842 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 843 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 848 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 853 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 380 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 383 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running task 859 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: Running task 862 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: Running task 865 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: Running task 866 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: Running task 867 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1710494
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 399 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 880 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 893 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: Running task 915 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 925 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 445 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 452 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 455 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 946 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1163 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1205 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_patch: Succeeded
NOTE: Running task 1206 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1207 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1208 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 477 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 480 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running task 1218 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 15d1bb8c7262721d73f189056989e3b5dfe96873fedc92cacc007c7077dc1e89
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 495 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+b8a0944943-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 501 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 576 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 608 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 622 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 643 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 670 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: Running task 1904 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1935 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1987 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2017 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2101 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_collect_spdx_deps)
NOTE: Running task 2103 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2113 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 2115 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 2116 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2117 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2118 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: Running task 2119 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2120 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2121 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2122 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2123 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2124 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2125 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2126 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 2127 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 2128 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2129 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2130 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2131 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 2132 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package)
NOTE: Running task 2133 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 2134 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2135 of 2167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_create_spdx)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2135 tasks of which 2078 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 43 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.2-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.3-r0 to 0:2.1.2-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-markupsafe/2.1.2-r0/temp/log.do_packagedata.1724893
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata) failed with exit code '1'

--===============8922147305197477706==--

