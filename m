Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDF8F43828
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19743.1776261880454230442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WlW5GgnI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wJxMfCvP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d91759126-66e8a5d3-1b70-42e4-8f49-d6f2a174d2b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6fp5ndIrxlFKPEYtYwOxCxj9YP4ycsN1W6cll4+ZqQk=;
	b=WlW5GgnICqG4KjKaWEe/b7rOEmdgjDzEH3bT4cB9kiGlJnBPg4VpOo5p7jxzyhyG
	NCjFAx8q0+p5bHfhoC02hYg/JJkWK1i9RnCHKOS3U5nPSNjIg9++VzpjZdVvsDlAL+e
	K2/VZqAOvIvb2nSIMBnfRuVdHnlwB8m5BLirnb8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6fp5ndIrxlFKPEYtYwOxCxj9YP4ycsN1W6cll4+ZqQk=;
	b=wJxMfCvPJ60DmmQ+/HFzwfwW58jton/QR2TwjOuquf+oP7Zv1pzBcs/7RZ/x+xrU
	OqISjN1NsseGAeuQqEuP6f53AHTH271OcxupV+/lDR08f26nGpNdZ+vx0cwCQk3qGzA
	LUoVz7W17KSSfNMUWlSnHo96A9stHcggcbkVftb4=
Content-Type: multipart/mixed; boundary="===============6809159383294044868=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libfyaml: upgrading to 0.9.6 FAILED
Message-ID: <0101019d91759126-66e8a5d3-1b70-42e4-8f49-d6f2a174d2b1-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235300

--===============6809159383294044868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libfyaml* to *0.9.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libfyaml-upgrade-0.9.4-0.9.6.patch
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
From 85744652d71043738f83f646cfa8890fe7d91486 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 13:20:36 +0000
Subject: [PATCH] libfyaml: upgrade 0.9.4 -> 0.9.6

---
 .../libfyaml/{libfyaml_0.9.4.bb => libfyaml_0.9.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libfyaml/{libfyaml_0.9.4.bb => libfyaml_0.9.6.bb} (83%)

diff --git a/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
similarity index 83%
rename from meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
rename to meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
index 77fe0a15b0..b48cc4efcd 100644
--- a/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb
+++ b/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6399094fbc639a289cfca2d660c010aa"
 
 GITHUB_BASE_URI = "https://github.com/pantoniou/libfyaml"
 SRC_URI = "${GITHUB_BASE_URI}/releases/download/v${PV}/libfyaml-${PV}.tar.gz"
-SRC_URI[sha256sum] = "dac2b0af7b757b32a4fa7c6493d85d0f7dea6effd20ae4352570b6a450b9e5fb"
+SRC_URI[sha256sum] = "a59cc3331e2eb903ec36933ad52a45888041cac31e44f553a00511131242c483"
 
 inherit autotools pkgconfig github-releases
 
-- 
2.47.1


--===============6809159383294044868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-d3f509a11fe9a3aaa02890f915dfb64070b0812c"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:d3f509a11fe9a3aaa02890f915dfb64070b0812c"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 119 Local 108 Mirrors 0 Missed 11 Current 209 (90% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 235 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 268 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 272 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 273 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 275 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 752 of 899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 276 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 281 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 282 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_fetch: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 753 of 899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 288 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_unpack: Succeeded
NOTE: Running task 759 of 899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 777 of 899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_recipe_spdx)
NOTE: recipe libfyaml-0.9.6-r0: task do_patch: Succeeded
NOTE: Running task 778 of 899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 301 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 305 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libfyaml-0.9.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 310 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_deploy_source_date_epoch unihash changed to b99541e0a5bd9ca82e602ad62f51d96e6836b684ad9309f655fcb104bc412b5f
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 326 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 328 of 328 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 883 of 899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfyaml-0.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 887 of 899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_configure)
NOTE: recipe libfyaml-0.9.6-r0: task do_configure: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_configure: Succeeded
NOTE: Running task 888 of 899 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_compile)
NOTE: recipe libfyaml-0.9.6-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75
| Making all in src
|   CC    tool/fy_tool-fy-tool.o
|   CC    tool/fy_tool-fy-tool-util.o
|   CC    tool/fy_tool-fy-tool-dump.o
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/tool/fy-tool-dump.c:26:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/tool/fy-tool.c:29:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/tool/fy-tool-util.c:27:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1734: tool/fy_tool-fy-tool-util.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: *** [Makefile:1748: tool/fy_tool-fy-tool-dump.o] Error 1
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1720: tool/fy_tool-fy-tool.o] Error 1
|   CC    lib/fy-types.o
|   CC    lib/fy-doc.o
|   CC    lib/fy-token.o
|   CC    lib/fy-diag.o
|   CC    lib/fy-dump.o
|   CC    lib/fy-atom.o
|   CC    lib/fy-input.o
|   CC    lib/fy-docstate.o
|   CC    lib/fy-parse.o
|   CC    lib/fy-accel.o
|   CC    lib/fy-event.o
|   CC    lib/fy-emit.o
|   CC    lib/fy-docbuilder.o
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-types.c:20:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-doc.c:20:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-accel.c:15:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-docstate.c:19:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-dump.c:20:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-diag.c:20:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-parse.c:21:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-emit.c:20:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-token.c:21:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-docbuilder.c:19:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-event.c:21:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-atom.c:22:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| In file included from ../../sources/libfyaml-0.9.6/include/libfyaml.h:84,
|                  from ../../sources/libfyaml-0.9.6/src/lib/fy-input.c:29:
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_decode_size_nocheck':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:813:48: error: passing argument 2 of 'fy_decode_size32_nocheck' from incompatible pointer type [-Wincompatible-pointer-types]
|   813 |         return fy_decode_size32_nocheck(start, sizep);
|       |                                                ^~~~~
|       |                                                |
|       |                                                size_t * {aka unsigned int *}
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:266:58: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
|   266 | fy_decode_size32_nocheck(const uint8_t *start, uint64_t *sizep)
|       |                                                ~~~~~~~~~~^~~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h: In function 'fy_skip_size':
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: error: 'sz' undeclared (first use in this function)
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                                              ^~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:46: note: each undeclared identifier is reported only once for each function it appears in
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:819:16: error: too many arguments to function 'fy_skip_size32'; expected 2, have 3
|   819 |         return fy_skip_size32(start, bufsz, &sz);
|       |                ^~~~~~~~~~~~~~               ~~~
| ../../sources/libfyaml-0.9.6/include/libfyaml/libfyaml-vlsize.h:300:1: note: declared here
|   300 | fy_skip_size32(const uint8_t *start, size_t bufsz)
|       | ^~~~~~~~~~~~~~
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1426: lib/libfyaml_la-fy-types.lo] Error 1
| make[2]: *** [Makefile:1440: lib/libfyaml_la-fy-dump.lo] Error 1
| make[2]: *** [Makefile:1503: lib/libfyaml_la-fy-accel.lo] Error 1
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1468: lib/libfyaml_la-fy-docstate.lo] Error 1
| make[2]: *** [Makefile:1482: lib/libfyaml_la-fy-docbuilder.lo] Error 1
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1433: lib/libfyaml_la-fy-diag.lo] Error 1
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1496: lib/libfyaml_la-fy-event.lo] Error 1
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1461: lib/libfyaml_la-fy-input.lo] Error 1
| make[2]: *** [Makefile:1454: lib/libfyaml_la-fy-token.lo] Error 1
| make[2]: *** [Makefile:1447: lib/libfyaml_la-fy-atom.lo] Error 1
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1489: lib/libfyaml_la-fy-emit.lo] Error 1
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1475: lib/libfyaml_la-fy-doc.lo] Error 1
| At top level:
| cc1: note: unrecognized command-line option '-Wno-tautological-constant-out-of-range-compare' may have been intended to silence earlier diagnostics
| make[2]: *** [Makefile:1419: lib/libfyaml_la-fy-parse.lo] Error 1
| make[1]: *** [Makefile:610: all-recursive] Error 1
| make: *** [Makefile:515: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/run.do_compile.2698716:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/run.do_compile.2698716, line 180
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/run.do_compile.2698716, line 164
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/run.do_compile.2698716, line 159
| 	#4: autotools_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/run.do_compile.2698716, line 154
| 	#5: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/run.do_compile.2698716, line 149
| 	#6: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/run.do_compile.2698716, line 193
NOTE: recipe libfyaml-0.9.6-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 888 tasks of which 880 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415132015.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415132015.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/log.do_compile.2698716
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libfyaml-0.9.6-r0 do_compile: oe_runmake failed
ERROR: libfyaml-0.9.6-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/run.do_compile.2698716' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libfyaml/0.9.6/temp/log.do_compile.2698716
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_compile) failed with exit code '1'

--===============6809159383294044868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dev: FILELIST: added "/usr/include/libfyaml/libfyaml-composer.h /usr/include/libfyaml/libfyaml-dociter.h /usr/include/libfyaml/libfyaml-path-exec.h /usr/include/libfyaml/libfyaml-util.h /usr/include/libfyaml/libfyaml-blake3.h /usr/include/libfyaml/libfyaml-atomics.h /usr/include/libfyaml/libfyaml-thread.h /usr/include/libfyaml/libfyaml-align.h /usr/include/libfyaml/libfyaml-core.h /usr/include/libfyaml/libfyaml-allocator.h /usr/include/libfyaml/libfyaml-endian.h /usr/include/libfyaml/libfyaml-docbuild.h /usr/include/libfyaml/libfyaml-vlsize.h"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dev: PKGSIZE changed from 280962 to 390678 (+39%)
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-doc: FILELIST: added "/usr/share/man/man3/libfyaml-core.3 /usr/share/man/man3/libfyaml.3 /usr/share/man/man3/libfyaml-misc.3"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-doc: PKGSIZE changed from 19922 to 443532 (+2126%)
Changes to packages/x86-64-v3-poky-linux/libfyaml (sysroot):
  /usr/include/libfyaml was added
  /usr/include/libfyaml/libfyaml-align.h was added
  /usr/include/libfyaml/libfyaml-allocator.h was added
  /usr/include/libfyaml/libfyaml-atomics.h was added
  /usr/include/libfyaml/libfyaml-blake3.h was added
  /usr/include/libfyaml/libfyaml-composer.h was added
  /usr/include/libfyaml/libfyaml-core.h was added
  /usr/include/libfyaml/libfyaml-docbuild.h was added
  /usr/include/libfyaml/libfyaml-dociter.h was added
  /usr/include/libfyaml/libfyaml-endian.h was added
  /usr/include/libfyaml/libfyaml-path-exec.h was added
  /usr/include/libfyaml/libfyaml-thread.h was added
  /usr/include/libfyaml/libfyaml-util.h was added
  /usr/include/libfyaml/libfyaml-vlsize.h was added

--===============6809159383294044868==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libfyaml-upgrade-0.9.4-0.9.6.patch"

RnJvbSA4NTc0NDY1MmQ3MTA0MzczOGY4M2Y2NDZjZmE4ODkwZmU3ZDkxNDg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTM6MjA6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJmeWFtbDogdXBncmFkZSAwLjkuNCAtPiAwLjkuNgoKLS0tCiAuLi4vbGliZnlhbWwve2xpYmZ5
YW1sXzAuOS40LmJiID0+IGxpYmZ5YW1sXzAuOS42LmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJmeWFtbC97bGliZnlhbWxfMC45LjQuYmIgPT4gbGliZnlhbWxfMC45
LjYuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZnlhbWwv
bGliZnlhbWxfMC45LjQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmeWFtbC9saWJmeWFt
bF8wLjkuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJmeWFtbC9saWJmeWFtbF8wLjkuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZnlhbWwvbGliZnlhbWxfMC45LjYuYmIKaW5kZXggNzdmZTBhMTViMC4uYjQ4
Y2M0ZWZjZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZnlhbWwvbGliZnlh
bWxfMC45LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZnlhbWwvbGliZnlhbWxf
MC45LjYuYmIKQEAgLTUsNyArNSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTYzOTkwOTRmYmM2MzlhMjg5Y2ZjYTJkNjYwYzAxMGFhIgogCiBHSVRIVUJfQkFTRV9V
UkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3BhbnRvbmlvdS9saWJmeWFtbCIKIFNSQ19VUkkgPSAi
JHtHSVRIVUJfQkFTRV9VUkl9L3JlbGVhc2VzL2Rvd25sb2FkL3Yke1BWfS9saWJmeWFtbC0ke1BW
fS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGFjMmIwYWY3Yjc1N2IzMmE0ZmE3YzY0
OTNkODVkMGY3ZGVhNmVmZmQyMGFlNDM1MjU3MGI2YTQ1MGI5ZTVmYiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJhNTljYzMzMzFlMmViOTAzZWMzNjkzM2FkNTJhNDU4ODgwNDFjYWMzMWU0NGY1NTNh
MDA1MTExMzEyNDJjNDgzIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgZ2l0aHViLXJl
bGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============6809159383294044868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libfyaml: SRC_URI changed from "https://github.com/pantoniou/libfyaml/releases/download/v0.9.4/libfyaml-0.9.4.tar.gz" to "https://github.com/pantoniou/libfyaml/releases/download/v0.9.6/libfyaml-0.9.6.tar.gz"
packages/x86-64-v3-poky-linux/libfyaml: PV changed from "0.9.4" to "0.9.6"
packages/x86-64-v3-poky-linux/libfyaml: PKGV changed from 0.9.4 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dbg: PKGSIZE changed from 5379424 to 5454672 (+1%)
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dbg: PV changed from "0.9.4" to "0.9.6"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dbg: PKGV changed from 0.9.4 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dev: PKGSIZE changed from 280962 to 390678 (+39%)
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dev: FILELIST: added "/usr/include/libfyaml/libfyaml-util.h /usr/include/libfyaml/libfyaml-align.h /usr/include/libfyaml/libfyaml-vlsize.h /usr/include/libfyaml/libfyaml-endian.h /usr/include/libfyaml/libfyaml-allocator.h /usr/include/libfyaml/libfyaml-path-exec.h /usr/include/libfyaml/libfyaml-thread.h /usr/include/libfyaml/libfyaml-core.h /usr/include/libfyaml/libfyaml-blake3.h /usr/include/libfyaml/libfyaml-composer.h /usr/include/libfyaml/libfyaml-docbuild.h /usr/include/libfyaml/libfyaml-atomics.h /usr/include/libfyaml/libfyaml-dociter.h"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dev: PV changed from "0.9.4" to "0.9.6"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-dev: PKGV changed from 0.9.4 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-doc: PKGSIZE changed from 19922 to 443532 (+2126%)
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-doc: FILELIST: added "/usr/share/man/man3/libfyaml-core.3 /usr/share/man/man3/libfyaml.3 /usr/share/man/man3/libfyaml-misc.3"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-doc: PV changed from "0.9.4" to "0.9.6"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-doc: PKGV changed from 0.9.4 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-locale: PV changed from "0.9.4" to "0.9.6"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-locale: PKGV changed from 0.9.4 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-src: PKGSIZE changed from 1949450 to 1994919 (+2%)
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-src: FILELIST: directory renamed /usr/src/debug/libfyaml/0.9.4/src/allocator -> /usr/src/debug/libfyaml/0.9.6/src/allocator, directory renamed /usr/src/debug/libfyaml/0.9.4/src/blake3 -> /usr/src/debug/libfyaml/0.9.6/src/blake3, directory renamed /usr/src/debug/libfyaml/0.9.4/src/lib -> /usr/src/debug/libfyaml/0.9.6/src/lib, directory renamed /usr/src/debug/libfyaml/0.9.4/src/valgrind -> /usr/src/debug/libfyaml/0.9.6/src/valgrind, directory renamed /usr/src/debug/libfyaml/0.9.4/src/thread -> /usr/src/debug/libfyaml/0.9.6/src/thread, directory renamed /usr/src/debug/libfyaml/0.9.4/src/tool -> /usr/src/debug/libfyaml/0.9.6/src/tool, directory renamed /usr/src/debug/libfyaml/0.9.4/src/xxhash -> /usr/src/debug/libfyaml/0.9.6/src/xxhash, removed "/usr/src/debug/libfyaml/0.9.4/src/util/fy-align.h /usr/src/debug/libfyaml/0.9.4/src/util/fy-id.h /usr/src/debug/libfyaml/0.9.4/src/util/fy-list.h /usr/src/debug/libfyaml/0.9.4/include/libfyaml.h /us
 r/src/debug/libfyaml/0.9.4/src/util/fy-utils.h /usr/src/debug/libfyaml/0.9.4/src/util/fy-atomics.h /usr/src/debug/libfyaml/0.9.4/src/util/fy-bit64.h /usr/src/debug/libfyaml/0.9.4/src/util/fy-blob.h /usr/src/debug/libfyaml/0.9.4/src/util/fy-ctype.c /usr/src/debug/libfyaml/0.9.4/src/util/fy-utf8.c /usr/src/debug/libfyaml/0.9.4/src/util/fy-utils.c /usr/src/debug/libfyaml/0.9.4/src/util/fy-blob.c /usr/src/debug/libfyaml/0.9.4/src/util/fy-utf8.h /usr/src/debug/libfyaml/0.9.4/src/util/fy-ctype.h", added "/usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-path-exec.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-blob.h /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-allocator.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-blob.c /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-docbuild.h /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-dociter.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-ctype.c /usr/src/debug/libfyaml/0.9.6/src/util/fy-utf8.c /usr/src/debug/libfyaml/0.9
 .6/src/util/fy-utils.c /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-align.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-utf8.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-ctype.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-bit64.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-utils.h /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-core.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-list.h /usr/src/debug/libfyaml/0.9.6/src/util/fy-id.h /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-composer.h /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-atomics.h /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-thread.h /usr/src/debug/libfyaml/0.9.6/include/libfyaml/libfyaml-blake3.h"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-src: PV changed from "0.9.4" to "0.9.6"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-src: PKGV changed from 0.9.4 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-staticdev: PV changed from "0.9.4" to "0.9.6"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml-staticdev: PKGV changed from 0.9.4 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libfyaml/libfyaml: PKGSIZE changed from 926611 to 943059 (+2%)
packages/x86-64-v3-poky-linux/libfyaml/libfyaml: PV changed from "0.9.4" to "0.9.6"
packages/x86-64-v3-poky-linux/libfyaml/libfyaml: PKGV changed from 0.9.4 [default] to 0.9.6 [default]
Changes to packages/x86-64-v3-poky-linux/libfyaml (sysroot):
  /usr/include/libfyaml was added
  /usr/include/libfyaml/libfyaml-align.h was added
  /usr/include/libfyaml/libfyaml-allocator.h was added
  /usr/include/libfyaml/libfyaml-atomics.h was added
  /usr/include/libfyaml/libfyaml-blake3.h was added
  /usr/include/libfyaml/libfyaml-composer.h was added
  /usr/include/libfyaml/libfyaml-core.h was added
  /usr/include/libfyaml/libfyaml-docbuild.h was added
  /usr/include/libfyaml/libfyaml-dociter.h was added
  /usr/include/libfyaml/libfyaml-endian.h was added
  /usr/include/libfyaml/libfyaml-path-exec.h was added
  /usr/include/libfyaml/libfyaml-thread.h was added
  /usr/include/libfyaml/libfyaml-util.h was added
  /usr/include/libfyaml/libfyaml-vlsize.h was added

--===============6809159383294044868==--

