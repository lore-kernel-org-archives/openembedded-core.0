Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3CECD37B4
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11409.1725172853435315336
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HF4B00ec;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=MccNupd2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010191ac50a771-c84e2903-7dfe-4365-8768-1c186b9e7718-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t/dXufIdhSGhuBs3tTR3rQ8RDQngTwmxZdNuPUhpQfA=;
	b=HF4B00ecwc/1qzYPGM0dze66xJNWOprRYH+yUnYiiSb/47vNstWdTRMVs3KApKI2
	lZSSnpAJMfdN6i3zcys5b3weua7NBLxV1DlE+LEcllUzWUC8yebt3fPXC4GG5FHDmBA
	7UcxfMAvgXpEAcDtbbSXPK4Htt9Y9EzePblm3X+E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t/dXufIdhSGhuBs3tTR3rQ8RDQngTwmxZdNuPUhpQfA=;
	b=MccNupd2IKMxTNDlWMO0pxjvU2m6epUIez7ef/fENzgH0rb2lnxrcOOUCpSS0Dy0
	ETvxwylazi89b3ElC1iLBSnJy1J93pibzTvHNl5bUSjua0wkFUbW63cYaAn4d4RIcPU
	kdGcUUCK1I75KPS9DdNSZEsZCrJm/ui4IXMyPqRY=
Content-Type: multipart/mixed; boundary="===============3215461171832064309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202408 FAILED
Message-ID: <01010191ac50a771-c84e2903-7dfe-4365-8768-1c186b9e7718-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203993

--===============3215461171832064309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202408* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake ovmf' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ae0abf6bc5a042b7a57fd7144e3af09a957ed950"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ae0abf6bc5a042b7a57fd7144e3af09a957ed950"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 228 Local 219 Mirrors 0 Missed 9 Current 281 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 293 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 294 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 326 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_deploy_setscene)
NOTE: recipe qemu-system-native-9.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ovmf-edk2-stable202402-r0: task do_populate_lic_setscene: Started
NOTE: recipe ovmf-edk2-stable202402-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202402-r0: task do_create_spdx_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202402-r0: task do_deploy_setscene: Started
NOTE: recipe ovmf-edk2-stable202402-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe ovmf-native-edk2-stable202402-r0: task do_deploy_setscene: Succeeded
NOTE: recipe ovmf-native-edk2-stable202402-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 417 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 418 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_create_spdx_setscene)
NOTE: recipe ovmf-edk2-stable202402-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 420 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_populate_sysroot_setscene)
NOTE: recipe acpica-native-20240322-r0: task do_create_spdx_setscene: Started
NOTE: recipe ovmf-edk2-stable202402-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-native-2.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202402-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acpica-native-20240322-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ovmf-edk2-stable202402-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 421 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-native-2.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ovmf-edk2-stable202402-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ovmf-edk2-stable202402-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1249 of 1585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-edk2-stable202402-r0: task do_fetch: Started
NOTE: recipe ovmf-native-edk2-stable202402-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_populate_sysroot_setscene)
NOTE: recipe acpica-native-20240322-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202402-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ovmf-native-edk2-stable202402-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acpica-native-20240322-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/acpica/acpica_20240322.bb:do_recipe_qa_setscene)
NOTE: recipe acpica-native-20240322-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acpica-native-20240322-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemu-system-native-9.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-system-native_9.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 429 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe qemu-system-native-9.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-native-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsdl2-native-2.30.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libslirp-native-4.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-native-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-native-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dtc-native-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemu-system-native-9.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libslirp-native-4.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-native-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-native-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dtc-native-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsdl2-native-2.30.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb:do_recipe_qa_setscene)
NOTE: recipe virglrenderer-native-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libslirp-native-4.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-native-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-native-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dtc-native-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsdl2-native-2.30.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libslirp-native-4.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe virglrenderer-native-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-native-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-native-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dtc-native-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsdl2-native-2.30.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe virglrenderer-native-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-native-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 450 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-native-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-native-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-native-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-native-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_18.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 455 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-native-1.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-native-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-18.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-native-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-native-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-native-2.4.122-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-native-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-native-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-native-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-native-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-native-1.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-native-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 470 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-native-2.4.122-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.122.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 474 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-native-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-native-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-native-1.36-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-native-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-native-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-native-2.4.122-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-native-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-native-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-native-1.36-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-native-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-native-2.4.122-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-native-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-native-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-native-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-native-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-native-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-native-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-native-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-native-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 483 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 487 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-native-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-native-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-native-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-native-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-native-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-native-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 490 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-native-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-native-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-native-18.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_18.1.8.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-native-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-native-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-native-18.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-native-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-native-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 500 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe llvm-native-18.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-native-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-native-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-native-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-native-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-native-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-native-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-native-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-native-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-native-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-native-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-native-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-native-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 509 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-native-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-native-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-native-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-native-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-native-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-native-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-native-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-native-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe ovmf-edk2-stable202402-r0: task do_fetch: Succeeded
NOTE: Running task 1566 of 1585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1567 of 1585 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-edk2-stable202402-r0: task do_unpack: Started
NOTE: recipe ovmf-edk2-stable202402-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-edk2-stable202402-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe ovmf-edk2-stable202402-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1567 tasks of which 1564 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060729.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901060729.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202402/temp/log.do_prepare_recipe_sysroot.2594588
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: ovmf-edk2-stable202402-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202402/temp/log.do_prepare_recipe_sysroot.2594588
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3215461171832064309==--

