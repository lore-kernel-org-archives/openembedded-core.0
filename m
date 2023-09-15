Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01720EEEC38
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.29690.1694804396119460379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=I31YifzY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RR9hLDnS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a9a36c5d5-dcf81a91-7709-4c49-933d-29b6888c00ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2+ImZ7UkWEzbF7wnWc9tSmhHWpNXR++Rl1UajRHZPhI=;
	b=I31YifzY5POnQdc5ljYRc17JcuWOB+9ER6Ktl6PEtbyj8rfpTBlScq6lSY61WE4z
	/+8JZEbFHs8tGnDYRnHizdsb+QtXYJjHZdRa14rzg0L/npd74hgfUR4MnsoA2OaFwxo
	lIZz2dDp7G3X+n+cUHp8bartlyO2yE5duMMXnO5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2+ImZ7UkWEzbF7wnWc9tSmhHWpNXR++Rl1UajRHZPhI=;
	b=RR9hLDnSJZul/hl8fD9A0ySKM7Tg5bOJDIm68fJecnn4H3PScGJZjAUZRJVkVSE/
	tDM6Hgm7LzSZsrtXmQqEOq+kCozjbvtTnBNlQVJbZbNt7VIovPbXgig1ILchL9L/G8Z
	EhbsPJ74Pm0naV5szDDHhxYgNm80KZCVKUEkf8gc=
Content-Type: multipart/mixed; boundary="===============8821322971667305311=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-lib: upgrading to 1.2.10 FAILED
Message-ID: <0101018a9a36c5d5-dcf81a91-7709-4c49-933d-29b6888c00ba-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187762

--===============8821322971667305311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-lib* to *1.2.10* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-alsa-lib-upgrade-1.2.9-1.2.10.patch
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
From 59fe7771c04ba1bb89e4492c01f93e194bc290de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 16:55:32 +0000
Subject: [PATCH] alsa-lib: upgrade 1.2.9 -> 1.2.10

---
 .../alsa/{alsa-lib_1.2.9.bb => alsa-lib_1.2.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.9.bb => alsa-lib_1.2.10.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
index d482e27683..2722a38dd2 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2"
+SRC_URI[sha256sum] = "c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e"
 
 inherit autotools pkgconfig
 
-- 
2.39.2


--===============8821322971667305311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 6 recipes from the core2-32 sysroot...done.
Removing 5 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-98ee6d69d2132058e78abd3cc869314f4ee04cb3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:98ee6d69d2132058e78abd3cc869314f4ee04cb3"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 80 Local 58 Mirrors 0 Missed 22 Current 216 (72% match, 92% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86...done.
Removing 10 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 220 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 227 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 705 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa)
NOTE: Running task 706 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_recipe_qa)
NOTE: Running task 707 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_recipe_qa)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_recipe_qa: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_recipe_qa unihash changed to 20185f9d11d16262ab09aba867719b293f8cc9cfedff60ab083fc826a2cd635d
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_recipe_qa unihash changed to f669f02793a0ddbb424cdebe0d8fd368e9b07f51baaae4c811d47a12b0f46cf7
NOTE: Running setscene task 234 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 708 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_fetch)
NOTE: Running task 709 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 710 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 247 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_fetch: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_fetch: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_fetch: Succeeded
NOTE: Running task 711 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_unpack)
NOTE: Running task 712 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 713 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_unpack)
NOTE: Running task 714 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_fetch: Succeeded
NOTE: Running task 715 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_unpack: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_unpack: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 716 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_patch)
NOTE: Running task 717 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_collect_spdx_deps)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 250 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_unpack: Started
NOTE: Running task 723 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_patch)
NOTE: Running task 724 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_collect_spdx_deps)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 725 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_patch: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_patch: Succeeded
NOTE: Running task 726 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 256 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_unpack: Succeeded
NOTE: Running task 727 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_patch)
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 259 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 260 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_deploy_source_date_epoch unihash changed to 5ad047879e06d5090d1c8e670805355401a25f3885b977724288a91196d02bc4
NOTE: recipe alsa-lib-1.2.10-r0: task do_patch: Started
NOTE: Running task 728 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_configure)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_deploy_source_date_epoch unihash changed to 50d52d8928aea82987aedfab182771f90e9d95fc944766fd0d84959fa5270c0b
NOTE: Running task 729 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_configure)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_configure: Started
NOTE: Running task 730 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 731 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_lic)
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_configure: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_configure: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 734 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_compile)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 265 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_lic: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_configure: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 735 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_compile)
NOTE: Running setscene task 266 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_compile: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_compile: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_lic unihash changed to 0d7cec428b94d31772b4ef59865246760e6bd85842ee962b8f9c504d371ca4d4
NOTE: Running task 736 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_install)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_compile: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 270 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 279 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: Running task 741 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_install)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_install: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_install: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 284 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 286 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 287 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_install: Succeeded
NOTE: Running task 747 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_package)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_package: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_install: Succeeded
NOTE: Running task 766 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_package)
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_package: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_package unihash changed to 2bb4625af3d4df51e5a4ca7917aac2f6ec6366ddcefd8ef745d202e77433534b
NOTE: Running task 767 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_packagedata)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 291 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_packagedata unihash changed to f8648bffac7d45237eb0b0a73b16cb37edad7fa8bec2df6486d529b7b22511e9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_package_write_rpm became valid
NOTE: Running setscene task 291 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running task 779 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.5.1.bb:do_create_spdx)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_create_spdx: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-topology-conf-1.2.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 296 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 864 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 871 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 872 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_configure)
NOTE: recipe alsa-lib-1.2.10-r0: task do_configure: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_package unihash changed to ee2503ef42daba5e90d7496e41becb7d671a9757fa73db8d1c63c8bb9c9dc644
NOTE: Setscene tasks completed
NOTE: Running task 873 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_packagedata)
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_packagedata: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_packagedata unihash changed to 62b7d5b25e6830404d2cb8618b1a19ea228082995902315094d8f212efa99a91
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_package_write_rpm became valid
NOTE: Running setscene task 296 of 296 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running task 874 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.10.bb:do_create_spdx)
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_create_spdx: Started
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe alsa-ucm-conf-1.2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_configure: Succeeded
NOTE: Running task 876 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_compile)
NOTE: recipe alsa-lib-1.2.10-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-musl', 'i686-linux-musl', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| Making all in doc
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/doc'
| Making all in pictures
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/doc/pictures'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/doc/pictures'
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/doc'
| make[2]: Nothing to be done for 'all-am'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/doc'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/doc'
| Making all in include
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include'
| (CDPATH="${ZSH_VERSION+.}:" && cd ../../alsa-lib-1.2.10 && /bin/bash '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10/missing' autoheader)
| rm -f stamp-h1
| touch ../../alsa-lib-1.2.10/include/config.h.in
| cd .. && /bin/bash ./config.status include/config.h
| config.status: creating include/config.h
| config.status: include/config.h is unchanged
| make  all-recursive
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include'
| Making all in sound
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include/sound'
| Making all in uapi
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include/sound/uapi'
| make[4]: Nothing to be done for 'all'.
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include/sound/uapi'
| make[4]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include/sound'
| make[4]: Nothing to be done for 'all-am'.
| make[4]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include/sound'
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include/sound'
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include'
| if ! test -r alsa/local.h; then \
| 	ln -s ../../alsa-lib-1.2.10/include alsa; \
| fi
| Updating version.h
| for f in asoundlib.h version.h; do \
| 	if ! test -r ../../alsa-lib-1.2.10/include/$f; then \
| 		ln -s /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include/$f ../../alsa-lib-1.2.10/include/$f; \
| 	fi; \
| done
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include'
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/include'
| Making all in src
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/src'
| Making all in control
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/src/control'
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o cards.lo ../../../alsa-lib-1.2.10/src/control/cards.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o tlv.lo ../../../alsa-lib-1.2.10/src/control/tlv.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o eld.lo ../../../alsa-lib-1.2.10/src/control/eld.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o namehint.lo ../../../alsa-lib-1.2.10/src/control/namehint.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o hcontrol.lo ../../../alsa-lib-1.2.10/src/control/hcontrol.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o control.lo ../../../alsa-lib-1.2.10/src/control/control.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o control_hw.lo ../../../alsa-lib-1.2.10/src/control/control_hw.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o control_empty.lo ../../../alsa-lib-1.2.10/src/control/control_empty.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o setup.lo ../../../alsa-lib-1.2.10/src/control/setup.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o ctlparse.lo ../../../alsa-lib-1.2.10/src/control/ctlparse.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o control_plugin.lo ../../../alsa-lib-1.2.10/src/control/control_plugin.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o control_symbols.lo ../../../alsa-lib-1.2.10/src/control/control_symbols.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o control_remap.lo ../../../alsa-lib-1.2.10/src/control/control_remap.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o control_shm.lo ../../../alsa-lib-1.2.10/src/control/control_shm.c
| /bin/bash ../../libtool  --tag=CC   --mode=compile i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include  -I../../../alsa-lib-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native=  -c -o control_ext.lo ../../../alsa-lib-1.2.10/src/control/control_ext.c
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/tlv.c  -fPIC -DPIC -o .libs/tlv.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/eld.c  -fPIC -DPIC -o .libs/eld.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/control_empty.c  -fPIC -DPIC -o .libs/control_empty.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/hcontrol.c  -fPIC -DPIC -o .libs/hcontrol.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/control_ext.c  -fPIC -DPIC -o .libs/control_ext.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/ctlparse.c  -fPIC -DPIC -o .libs/ctlparse.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/namehint.c  -fPIC -DPIC -o .libs/namehint.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/control.c  -fPIC -DPIC -o .libs/control.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/control_remap.c  -fPIC -DPIC -o .libs/control_remap.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/cards.c  -fPIC -DPIC -o .libs/cards.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/control_symbols.c  -fPIC -DPIC -o .libs/control_symbols.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/control_plugin.c  -fPIC -DPIC -o .libs/control_plugin.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/setup.c  -fPIC -DPIC -o .libs/setup.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/control_shm.c  -fPIC -DPIC -o .libs/control_shm.o
| libtool: compile:  i686-poky-linux-musl-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../../alsa-lib-1.2.10/src/control -I../../include -I../../../alsa-lib-1.2.10/include -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/alsa-lib-1.2.10=/usr/src/debug/alsa-lib/1.2.10-r0 -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/bui
 ld=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build=/usr/src/debug/alsa-lib/1.2.10-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/recipe-sysroot-native= -c ../../../alsa-lib-1.2.10/src/control/control_hw.c  -fPIC -DPIC -o .libs/control_hw.o
| In file included from ../../../alsa-lib-1.2.10/include/local.h:177,
|                  from ../../../alsa-lib-1.2.10/src/control/control_local.h:22,
|                  from ../../../alsa-lib-1.2.10/src/control/control.c:188:
| ../../../alsa-lib-1.2.10/src/control/control.c: In function 'snd_ctl_open_conf':
| ../../../alsa-lib-1.2.10/include/global.h:98:36: warning: implicit declaration of function '__STRING' [-Wimplicit-function-declaration]
|    98 | #define SND_DLSYM_VERSION(version) __STRING(version)
|       |                                    ^~~~~~~~
| ../../../alsa-lib-1.2.10/src/control/control.c:1541:25: note: in expansion of macro 'SND_DLSYM_VERSION'
|  1541 |                         SND_DLSYM_VERSION(SND_CONTROL_DLSYM_VERSION), 1);
|       |                         ^~~~~~~~~~~~~~~~~
| ../../../alsa-lib-1.2.10/include/control.h:43:41: error: '_dlsym_control_001' undeclared (first use in this function)
|    43 | #define SND_CONTROL_DLSYM_VERSION       _dlsym_control_001
|       |                                         ^~~~~~~~~~~~~~~~~~
| ../../../alsa-lib-1.2.10/include/global.h:98:45: note: in definition of macro 'SND_DLSYM_VERSION'
|    98 | #define SND_DLSYM_VERSION(version) __STRING(version)
|       |                                             ^~~~~~~
| ../../../alsa-lib-1.2.10/src/control/control.c:1541:43: note: in expansion of macro 'SND_CONTROL_DLSYM_VERSION'
|  1541 |                         SND_DLSYM_VERSION(SND_CONTROL_DLSYM_VERSION), 1);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
| ../../../alsa-lib-1.2.10/include/control.h:43:41: note: each undeclared identifier is reported only once for each function it appears in
|    43 | #define SND_CONTROL_DLSYM_VERSION       _dlsym_control_001
|       |                                         ^~~~~~~~~~~~~~~~~~
| ../../../alsa-lib-1.2.10/include/global.h:98:45: note: in definition of macro 'SND_DLSYM_VERSION'
|    98 | #define SND_DLSYM_VERSION(version) __STRING(version)
|       |                                             ^~~~~~~
| ../../../alsa-lib-1.2.10/src/control/control.c:1541:43: note: in expansion of macro 'SND_CONTROL_DLSYM_VERSION'
|  1541 |                         SND_DLSYM_VERSION(SND_CONTROL_DLSYM_VERSION), 1);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
| make[2]: *** [Makefile:418: control.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/src/control'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/build/src'
| make[1]: *** [Makefile:554: all-recursive] Error 1
| make: *** [Makefile:405: all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/run.do_compile.3384412:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/run.do_compile.3384412, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/run.do_compile.3384412, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/run.do_compile.3384412, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/run.do_compile.3384412, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/run.do_compile.3384412, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/run.do_compile.3384412, line 195
NOTE: recipe alsa-lib-1.2.10-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 876 tasks of which 840 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: alsa-lib-1.2.10-r0 do_compile: oe_runmake failed
ERROR: alsa-lib-1.2.10-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/run.do_compile.3384412', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.10/temp/log.do_compile.3384412
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_compile) failed with exit code '1'

--===============8821322971667305311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/alsa-lib/alsa-conf: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-conf: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PKGSIZE changed from 3022612 to 3068284 (+2%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dbg: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PKGSIZE changed from 440459 to 472963 (+7%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: FILELIST: added "/usr/include/alsa/ump.h /usr/include/alsa/ump_msg.h"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-doc: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-doc: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-locale: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-locale: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PKGSIZE changed from 3400062 to 3476272 (+2%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: FILELIST: directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/src/control -> /usr/src/debug/alsa-lib/1.2.10-r0/src/control, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/include/sound/uapi -> /usr/src/debug/alsa-lib/1.2.10-r0/include/sound/uapi, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/src/hwdep -> /usr/src/debug/alsa-lib/1.2.10-r0/src/hwdep, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/src/timer -> /usr/src/debug/alsa-lib/1.2.10-r0/src/timer, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/src/mixer -> /usr/src/debug/alsa-lib/1.2.10-r0/src/mixer, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/src/topology -> /usr/src/debug/alsa-lib/1.2.10-r0/src/topology, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/src/ucm -> /usr/src/debug/alsa-lib/1.2.10-r0/src/ucm, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/src -> /usr/src/debug/alsa-lib/1.2.10-r0/src, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/s
 rc/seq -> /usr/src/debug/alsa-lib/1.2.10-r0/src/seq, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/aserver -> /usr/src/debug/alsa-lib/1.2.10-r0/aserver, directory renamed /usr/src/debug/alsa-lib/1.2.9-r0/src/pcm -> /usr/src/debug/alsa-lib/1.2.10-r0/src/pcm, removed "/usr/src/debug/alsa-lib/1.2.9-r0/include/topology.h /usr/src/debug/alsa-lib/1.2.9-r0/include/list.h /usr/src/debug/alsa-lib/1.2.9-r0/include/mixer_abst.h /usr/src/debug/alsa-lib/1.2.9-r0/include/pcm_extplug.h /usr/src/debug/alsa-lib/1.2.9-r0/include/local.h /usr/src/debug/alsa-lib/1.2.9-r0/src/rawmidi/rawmidi_hw.c /usr/src/debug/alsa-lib/1.2.9-r0/src/rawmidi/rawmidi.c /usr/src/debug/alsa-lib/1.2.9-r0/include/hwdep.h /usr/src/debug/alsa-lib/1.2.9-r0/src/rawmidi/rawmidi_virt.c /usr/src/debug/alsa-lib/1.2.9-r0/src/rawmidi/rawmidi_local.h /usr/src/debug/alsa-lib/1.2.9-r0/include/pcm_plugin.h /usr/src/debug/alsa-lib/1.2.9-r0/include/seq_midi_event.h /usr/src/debug/alsa-lib/1.2.9-r0/include/pcm.h /usr/src/debug/alsa-lib/1
 .2.9-r0/include/pcm_ioplug.h /usr/src/debug/alsa-lib/1.2.9-r0/include/aserver.h /usr/src/debug/alsa-lib/1.2.9-r0/include/control.h /usr/src/debug/alsa-lib/1.2.9-r0/include/rawmidi.h /usr/src/debug/alsa-lib/1.2.9-r0/include/conf.h /usr/src/debug/alsa-lib/1.2.9-r0/include/mixer.h /usr/src/debug/alsa-lib/1.2.9-r0/include/timer.h /usr/src/debug/alsa-lib/1.2.9-r0/include/input.h /usr/src/debug/alsa-lib/1.2.9-r0/include/control_external.h /usr/src/debug/alsa-lib/1.2.9-r0/include/seq.h /usr/src/debug/alsa-lib/1.2.9-r0/include/pcm_rate.h /usr/src/debug/alsa-lib/1.2.9-r0/include/use-case.h /usr/src/debug/alsa-lib/1.2.9-r0/include/error.h /usr/src/debug/alsa-lib/1.2.9-r0/include/global.h /usr/src/debug/alsa-lib/1.2.9-r0/include/output.h /usr/src/debug/alsa-lib/1.2.9-r0/include/seqmid.h /usr/src/debug/alsa-lib/1.2.9-r0/include/seq_event.h", added "/usr/src/debug/alsa-lib/1.2.10-r0/src/rawmidi/rawmidi_local.h /usr/src/debug/alsa-lib/1.2.10-r0/include/input.h /usr/src/debug/alsa-lib/1.2.10-r0/in
 clude/hwdep.h /usr/src/debug/alsa-lib/1.2.10-r0/include/local.h /usr/src/debug/alsa-lib/1.2.10-r0/include/error.h /usr/src/debug/alsa-lib/1.2.10-r0/include/mixer.h /usr/src/debug/alsa-lib/1.2.10-r0/include/rawmidi.h /usr/src/debug/alsa-lib/1.2.10-r0/include/timer.h /usr/src/debug/alsa-lib/1.2.10-r0/include/pcm_plugin.h /usr/src/debug/alsa-lib/1.2.10-r0/include/pcm_rate.h /usr/src/debug/alsa-lib/1.2.10-r0/src/rawmidi/ump_local.h /usr/src/debug/alsa-lib/1.2.10-r0/src/rawmidi/rawmidi_hw.c /usr/src/debug/alsa-lib/1.2.10-r0/include/control.h /usr/src/debug/alsa-lib/1.2.10-r0/include/seq_event.h /usr/src/debug/alsa-lib/1.2.10-r0/include/pcm.h /usr/src/debug/alsa-lib/1.2.10-r0/include/ump.h /usr/src/debug/alsa-lib/1.2.10-r0/src/rawmidi/rawmidi_virt.c /usr/src/debug/alsa-lib/1.2.10-r0/src/rawmidi/ump.c /usr/src/debug/alsa-lib/1.2.10-r0/include/control_external.h /usr/src/debug/alsa-lib/1.2.10-r0/include/pcm_extplug.h /usr/src/debug/alsa-lib/1.2.10-r0/include/seq_midi_event.h /usr/src/debug/
 alsa-lib/1.2.10-r0/include/ump_msg.h /usr/src/debug/alsa-lib/1.2.10-r0/include/pcm_ioplug.h /usr/src/debug/alsa-lib/1.2.10-r0/include/conf.h /usr/src/debug/alsa-lib/1.2.10-r0/include/topology.h /usr/src/debug/alsa-lib/1.2.10-r0/src/rawmidi/rawmidi.c /usr/src/debug/alsa-lib/1.2.10-r0/include/mixer_abst.h /usr/src/debug/alsa-lib/1.2.10-r0/include/list.h /usr/src/debug/alsa-lib/1.2.10-r0/include/seq.h /usr/src/debug/alsa-lib/1.2.10-r0/include/global.h /usr/src/debug/alsa-lib/1.2.10-r0/include/output.h /usr/src/debug/alsa-lib/1.2.10-r0/include/seqmid.h /usr/src/debug/alsa-lib/1.2.10-r0/include/aserver.h /usr/src/debug/alsa-lib/1.2.10-r0/include/use-case.h"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-src: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-lib-staticdev: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-lib-staticdev: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-lib: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-lib: PKGSIZE changed from 1210098 to 1222386 (+1%)
packages/core2-32-poky-linux/alsa-lib/alsa-lib: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/alsa-server: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/alsa-server: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib: SRC_URI changed from "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.9.tar.bz2" to "https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.10.tar.bz2"
packages/core2-32-poky-linux/alsa-lib: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib: PV changed from "1.2.9" to "1.2.10"
packages/core2-32-poky-linux/alsa-lib/libatopology: PKGV changed from 1.2.9 [default] to 1.2.10 [default]
packages/core2-32-poky-linux/alsa-lib/libatopology: PV changed from "1.2.9" to "1.2.10"
Changes to packages/core2-32-poky-linux/alsa-lib (sysroot):
  /usr/include/alsa/ump.h was added
  /usr/include/alsa/ump_msg.h was added
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-13.2.0 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxcomplexintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxfp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxneconvertintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/prfchiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/raointintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/logical-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/m2 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/make-unique.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/xcoff.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-13.2.0 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxfp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/prfchiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/raointintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/logical-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/m2 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/make-unique.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/xcoff.h was removed

--===============8821322971667305311==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-lib-upgrade-1.2.9-1.2.10.patch"

RnJvbSA1OWZlNzc3MWMwNGJhMWJiODllNDQ5MmMwMWY5M2UxOTRiYzI5MGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTY6NTU6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
bHNhLWxpYjogdXBncmFkZSAxLjIuOSAtPiAxLjIuMTAKCi0tLQogLi4uL2Fsc2Eve2Fsc2EtbGli
XzEuMi45LmJiID0+IGFsc2EtbGliXzEuMi4xMC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS1saWJfMS4yLjkuYmIgPT4gYWxzYS1saWJfMS4y
LjEwLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2Ev
YWxzYS1saWJfMS4yLjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGli
XzEuMi4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi4xMC5iYgppbmRleCBkNDgyZTI3NjgzLi4yNzIy
YTM4ZGQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGli
XzEuMi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4y
LjEwLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PWE5MTY0NjdiOTEwNzZlNjMxZGQ4ZWRiNzQyNDc2OWM3IFwKICAgICAgICAgICAgICAg
ICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMv
cHViL2xpYi8ke0JQfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImRjOWM2NDNmZGM0
Y2NmZDA1NzJjYzY4NTg1OGRkNDFlMDhhZmI1ODNmMzA0NjBiMzE3ZTQxODgyNzVmNjE1YjIiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYzg2YTQ1YTg0NjMzMWIxYjBhYTZlNmJlMTAwYmUyYTdhZWY5
MmVmZDQwNWNmNmJhYzdlZWY4MTc0YmFhOTIwZSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29u
ZmlnCiAKLS0gCjIuMzkuMgoK

--===============8821322971667305311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/alsa-lib/alsa-lib-dev: FILELIST: added "/usr/include/alsa/ump.h /usr/include/alsa/ump_msg.h"
Changes to packages/core2-32-poky-linux/alsa-lib (sysroot):
  /usr/include/alsa/ump.h was added
  /usr/include/alsa/ump_msg.h was added
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-13.2.0 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/13.2.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxcomplexintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxfp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512fp16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxneconvertintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mwaitintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/prfchiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/raointintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ctfc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/logical-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/m2 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/make-unique.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/pointer-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/value-relation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/13.2.0/plugin/include/xcoff.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-13.2.0 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxfp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mwaitintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/prfchiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/raointintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ctfc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/logical-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/m2 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/make-unique.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/value-relation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/13.2.0/plugin/include/xcoff.h was removed

--===============8821322971667305311==--

