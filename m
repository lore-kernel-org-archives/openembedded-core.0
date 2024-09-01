Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6037CC54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11369.1725172854874770929
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S5gTCIGA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dERGkqbo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191ac50ab10-2e2833d7-38ae-4a5d-83b3-38e98f8c771d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uV0u3tnhPPwu7IBCMwcHAD0FxHtCqnoa6x8XPgjkItc=;
	b=S5gTCIGAiU2WKy62nO66if6+NpQZV4P/LZ0FA8o93tUIkE+9QvJ4XMRFllRw/tNm
	atw1rdJnsZO1Q9iw35LCSiY3CQbiDl4f7f6oLYQqaFkEl9vQtjsQoV0f1H1P0vMpo7g
	/cNI4NuDL0Wv15Pvd5UHgkVz3tX5YM9zoZQ3KCU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uV0u3tnhPPwu7IBCMwcHAD0FxHtCqnoa6x8XPgjkItc=;
	b=dERGkqbotGbvfUMq82QB0jxI8VRXTXnCOjW0vBFh50nRdC5+yQI0H5zwJAn5K3n3
	yzcwuh9TH62813H5QKO+EipwZgVDtUe8YfOwsYPTYDOW2sJ31G9mQdvd3xay+gRdKZM
	PXlsC8cVohANAst2SP1vEbC+RuqfG3/8R5/byjUY=
Content-Type: multipart/mixed; boundary="===============0035657393518932427=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.24.7 FAILED
Message-ID: <01010191ac50ab10-2e2833d7-38ae-4a5d-83b3-38e98f8c771d-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204039

--===============0035657393518932427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.24.7* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake gst-devtools' failed
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
DISTRO_VERSION       = "5.0+snapshot-69fe8a0f5dace7480b8e2d398b3560c8d7759a73"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:69fe8a0f5dace7480b8e2d398b3560c8d7759a73"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 344 Local 295 Mirrors 0 Missed 49 Current 599 (85% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 658 of 943 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 747 of 943 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 943 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb:do_populate_lic_setscene)
NOTE: Running setscene task 763 of 943 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.46.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gst-devtools-1.24.6-r0: task do_populate_lic_setscene: Started
NOTE: recipe gst-devtools-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gst-devtools-1.24.6-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gst-devtools-1.24.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 938 of 943 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb:do_recipe_qa_setscene)
NOTE: recipe git-2.46.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 943 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gst-devtools-1.24.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-2.46.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gst-devtools-1.24.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1549 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_unpack)
NOTE: recipe git-2.46.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 943 of 943 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1622 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1664 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: recipe git-2.46.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_unpack: Started
NOTE: Running task 1742 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack)
NOTE: Running task 1816 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 1832 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.46.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Started
NOTE: Running task 1940 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: Running task 1942 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_unpack)
NOTE: Running task 2061 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2085 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_unpack)
NOTE: Running task 2086 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: Running task 2110 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_fetch)
NOTE: Running task 2137 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-9.0.0-r0: task do_unpack: Started
NOTE: Running task 2250 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb:do_fetch)
NOTE: Running task 2260 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_fetch)
NOTE: Running task 2276 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe pango-1.54.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.24.6-r0: task do_fetch: Started
NOTE: recipe git-2.46.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_write_config: Succeeded
NOTE: Running task 2340 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 2341 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_unpack)
NOTE: recipe gst-devtools-1.24.6-r0: task do_fetch: Succeeded
NOTE: Running task 2342 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb:do_unpack)
NOTE: recipe gst-devtools-1.24.6-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.24.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.24.6-r0: task do_write_config: Succeeded
NOTE: Running task 2352 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe git-2.46.0-r0: task do_fetch: Succeeded
NOTE: Running task 2353 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_unpack)
NOTE: recipe git-2.46.0-r0: task do_unpack: Started
NOTE: recipe git-2.46.0-r0: task do_unpack: Succeeded
NOTE: Running task 2354 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_patch)
NOTE: recipe git-2.46.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_unpack: Failed
NOTE: Running task 2355 of 2600 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Failed
NOTE: recipe git-2.46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Failed
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Failed
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Failed
NOTE: recipe harfbuzz-9.0.0-r0: task do_unpack: Failed
NOTE: recipe pango-1.54.0-r0: task do_unpack: Failed
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Failed
NOTE: recipe gst-devtools-1.24.6-r0: task do_unpack: Failed
NOTE: recipe gstreamer1.0-plugins-base-1.24.6-r0: task do_unpack: Failed
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Failed
NOTE: recipe git-2.46.0-r0: task do_patch: Failed
NOTE: recipe gstreamer1.0-1.24.6-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Failed
NOTE: recipe git-2.46.0-r0: task do_prepare_recipe_sysroot: Failed
NOTE: Tasks Summary: Attempted 2355 tasks of which 2332 didn't need to be rerun and 17 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063423.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901063423.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 17 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.24.6/temp/log.do_unpack.2675897
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/json-glib/1.8.0/temp/log.do_unpack.2675900
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cairo/1.18.0/temp/log.do_unpack.2675901
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa/24.0.7/temp/log.do_unpack.2675920
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxft/2.3.8/temp/log.do_unpack.2675925
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/harfbuzz/9.0.0/temp/log.do_unpack.2675926
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/pango/1.54.0/temp/log.do_unpack.2675934
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libglu/9.0.3/temp/log.do_unpack.2675935
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.6/temp/log.do_unpack.2675984
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_unpack
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.6/temp/log.do_unpack.2675981
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fontconfig/2.15.0/temp/log.do_collect_spdx_deps.2676002
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_patch
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/git/2.46.0/temp/log.do_patch.2676025
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.24.6/temp/log.do_prepare_recipe_sysroot.2675899
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxft/2.3.8/temp/log.do_prepare_recipe_sysroot.2675941
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/json-glib/1.8.0/temp/log.do_prepare_recipe_sysroot.2675921
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa/24.0.7/temp/log.do_prepare_recipe_sysroot.2675933
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_prepare_recipe_sysroot
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/git/2.46.0/temp/log.do_prepare_recipe_sysroot.2676033
Summary: There were 17 ERROR messages, returning a non-zero exit code.

ERROR: gstreamer1.0-1.24.6-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: json-glib-1.8.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: cairo-1.18.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: mesa-2_24.0.7-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libxft-1_2.3.8-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: harfbuzz-9.0.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libglu-2_9.0.3-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: pango-1.54.0-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: gst-devtools-1.24.6-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: gstreamer1.0-plugins-base-1.24.6-r0 do_unpack: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: fontconfig-2.15.0-r0 do_collect_spdx_deps: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: git-2.46.0-r0 do_patch: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.24.6/temp/log.do_unpack.2675897
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/json-glib/1.8.0/temp/log.do_unpack.2675900
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cairo/1.18.0/temp/log.do_unpack.2675901
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa/24.0.7/temp/log.do_unpack.2675920
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxft/2.3.8/temp/log.do_unpack.2675925
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/harfbuzz/9.0.0/temp/log.do_unpack.2675926
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/pango/1.54.0/temp/log.do_unpack.2675934
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libglu/9.0.3/temp/log.do_unpack.2675935
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_unpack) failed with exit code '1'
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack) failed with exit code '1'
ERROR: gstreamer1.0-1.24.6-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: libxft-1_2.3.8-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: json-glib-1.8.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: mesa-2_24.0.7-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.24.6/temp/log.do_unpack.2675984
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.6/temp/log.do_unpack.2675981
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb:do_unpack) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/fontconfig/2.15.0/temp/log.do_collect_spdx_deps.2676002
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/git/2.46.0/temp/log.do_patch.2676025
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_patch) failed with exit code '1'
ERROR: git-2.46.0-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'libtool-native:populate_sysroot' (multilib variant '') could not be found.
The pkgarchs considered were: x86_64, x86_64_almalinux-8.10.
But none of these manifests exists:
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64-libtool-native.populate_sysroot
    /home/pokybuild/yocto-worker/auh/build/build/tmp/sstate-control/manifest-x86_64_almalinux-8.10-libtool-native.populate_sysroot
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.24.6/temp/log.do_prepare_recipe_sysroot.2675899
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxft/2.3.8/temp/log.do_prepare_recipe_sysroot.2675941
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/json-glib/1.8.0/temp/log.do_prepare_recipe_sysroot.2675921
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mesa/24.0.7/temp/log.do_prepare_recipe_sysroot.2675933
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/git/2.46.0/temp/log.do_prepare_recipe_sysroot.2676033
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.46.0.bb:do_prepare_recipe_sysroot) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0035657393518932427==--

