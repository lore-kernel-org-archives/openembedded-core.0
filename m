Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1E3C87FDE
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7625.1685693431696639011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gvjGWc7x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b288ef4-aa7b4d6b-7ac6-4e0d-8c19-3850b128a296-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ChEwo2ceqGSfwcUip/yFaOUtwBGdBkGiGQDyzv2BxCI=;
	b=gvjGWc7xcTzPwuFWuJ3N5b7BgzrbP2HAOxPKKQN5UP2lpxeNevbk2UPe3dp3WPlT
	BWsjlRyi2ifvWi+lCUncCslbyZ7caBv53szh/xdfqvA8qW6rDNakz2ZEscS1s2OxyPk
	NrsE0T8oWWPmxCaAcDLU+rLQIa04n0xH0e2v5i7A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693436;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ChEwo2ceqGSfwcUip/yFaOUtwBGdBkGiGQDyzv2BxCI=;
	b=Hq3wlKmThql3H9MkZrEoIJKbjBFe5Gy709xz7BsY9+YzOQ1+b7XV6m0LO8upeZ52
	7g6DnTNP0ozgpyCuXA36lYQQagnvCYmy33anxaGylT02EO25gE/XnB+6e6awRk1/Mvx
	0nQLrMhhjry/uM9vo7jur5kvi93Fe+Z9iu6ua0yY=
Content-Type: multipart/mixed; boundary="===============1366605069262116660=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.3 SUCCEEDED
Message-ID: <010101887b288ef4-aa7b4d6b-7ac6-4e0d-8c19-3850b128a296-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182275

--===============1366605069262116660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.22.2-1.22.3.patch
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
--===============1366605069262116660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5243e4e2432fc398605728dc1dfb6374f9f7b12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 82 Local 38 Mirrors 0 Missed 44 Current 615 (46% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 642 of 697 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 697 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-native-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vala/0.56.6-r0/temp/log.do_packagedata_setscene.1848009
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 690 of 697 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
NOTE: recipe shaderc-native-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-native-1_1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-native-1_1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 697 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-native-1_1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: Running task 1868 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1988 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe spirv-headers-native-1_1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2031 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2050 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: Running task 2124 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2125 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2126 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2132 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2191 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2227 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2228 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2253 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_fetch)
NOTE: Running task 2254 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2276 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_write_config)
NOTE: Running task 2287 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2288 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2300 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_write_config)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: Running task 2321 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2329 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2330 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2331 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2332 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2333 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2334 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2335 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: Running task 2336 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Started
NOTE: Running task 2337 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2338 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: Running task 2339 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2340 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2341 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2342 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 2343 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2344 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2345 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 2346 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_patch)
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 2365 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 2371 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2372 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 2373 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2374 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2375 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2376 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2377 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic unihash changed to a2f6c8ee8f484ee1b9833a10098fd0c650c748a2af78e78b553e90d6b8de40da
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2378 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2382 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 2384 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: Running task 2385 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2386 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2387 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 2388 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 2389 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2390 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: Running task 2391 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2392 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 2393 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 2394 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: Running task 2395 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2396 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2397 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2400 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2402 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2404 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2405 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2407 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2409 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2410 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2413 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2414 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2415 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2417 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: Running task 2418 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2419 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2422 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2426 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2427 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2432 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2433 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2435 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2437 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2438 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2439 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2441 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 2442 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 2443 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2444 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2445 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 2447 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 2449 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot)
NOTE: Running task 2450 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2451 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2452 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2453 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 2456 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2457 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2458 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2459 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2460 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2461 of 2461 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2461 tasks of which 2337 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1366605069262116660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5243e4e2432fc398605728dc1dfb6374f9f7b12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 34 Mirrors 0 Missed 44 Current 615 (43% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 643 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vala/0.56.6-r0/temp/log.do_packagedata_setscene.1938476
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 692 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1866 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1983 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 2026 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: Running task 2050 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: Running task 2125 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2126 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2127 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2133 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2197 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2257 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_fetch)
NOTE: Running task 2258 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2272 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2273 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2282 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_write_config)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2292 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2293 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2308 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_write_config)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2310 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2311 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2312 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2313 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2314 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2315 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Started
NOTE: Running task 2316 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2317 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2318 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_unpack)
NOTE: Running task 2319 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 2320 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Started
NOTE: Running task 2321 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2322 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2323 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2324 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2325 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 2326 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2327 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2328 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 2348 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2349 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2352 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2356 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2357 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2358 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic)
NOTE: Running task 2359 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2360 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic unihash changed to a2f6c8ee8f484ee1b9833a10098fd0c650c748a2af78e78b553e90d6b8de40da
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2361 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2362 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2363 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2369 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: Running task 2370 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 2371 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2373 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 2375 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 2376 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: Running task 2377 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2378 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2379 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2382 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2386 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2387 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2389 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2390 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2392 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2397 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2401 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2404 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2407 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2408 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2409 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2414 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2418 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2422 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2426 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2427 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot)
NOTE: Running task 2432 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2433 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2435 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2436 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2442 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2443 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2443 tasks of which 2319 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1366605069262116660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 108 recipes from the core2-32 sysroot...done.
Removing 107 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5243e4e2432fc398605728dc1dfb6374f9f7b12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 461 Local 411 Mirrors 0 Missed 50 Current 227 (89% match, 92% complete)
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 228 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 240 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 255 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 256 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 688 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 319 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 951 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 978 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: Running task 979 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_fetch)
NOTE: Running task 996 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1007 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 1015 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: Running task 1034 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1036 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1037 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 1040 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe cargo-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 688 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.69.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1091 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_fetch)
NOTE: Running task 1102 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_fetch)
NOTE: Running task 1103 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1120 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_write_config)
NOTE: Running task 1123 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_write_config)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: Running task 1125 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1126 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running setscene task 338 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1127 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 1128 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1129 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe libstd-rs-1.69.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 341 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: Running task 1130 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Started
NOTE: Running task 1131 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Started
NOTE: Running setscene task 343 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 345 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 1136 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 1137 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_unpack)
NOTE: Running task 1138 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: Running setscene task 350 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: Running setscene task 354 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_unpack: Started
NOTE: Running setscene task 356 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Running setscene task 361 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: Running task 1161 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1164 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 1165 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vala/0.56.6-r0/temp/log.do_packagedata_setscene.2211569
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 376 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 1213 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_patch)
NOTE: Running task 1216 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 1221 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 1233 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1236 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 1237 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 1242 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1248 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 1251 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rust-native-1.69.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1270 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 1271 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1272 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1274 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1288 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic unihash changed to a2f6c8ee8f484ee1b9833a10098fd0c650c748a2af78e78b553e90d6b8de40da
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 447 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1312 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 478 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 509 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 520 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 523 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 534 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 548 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 599 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 621 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 1548 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 1550 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1551 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 669 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 688 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2151 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2182 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2223 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2267 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2269 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2284 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2289 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2324 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_configure)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2327 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_unpack: Succeeded
NOTE: Running task 2335 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_patch)
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_patch: Succeeded
NOTE: Running task 2337 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_gen_targets)
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2339 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2340 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2343 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: Running task 2344 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2345 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libunwind-1.6.2-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_compile)
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2348 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libunwind-1.6.2-r0: task do_compile: Succeeded
NOTE: Running task 2349 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2350 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libunwind-1.6.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2351 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2352 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2354 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_package)
NOTE: recipe libunwind-1.6.2-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2357 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2358 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2359 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libstd-rs-1.69.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2360 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_rust_create_wrappers)
NOTE: Running task 2361 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2362 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_configure)
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_configure: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_compile)
NOTE: Running task 2364 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata)
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2366 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2367 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2369 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2370 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2371 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2373 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2374 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2376 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2377 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2378 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2380 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2381 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2386 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2387 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2388 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libstd-rs-1.69.0-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_install)
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_package)
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2392 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2393 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2394 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_package: Succeeded
NOTE: Running task 2395 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.69.0.bb:do_packagedata)
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Started
NOTE: recipe libstd-rs-1.69.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2396 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2397 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 2398 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 2399 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2400 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 2404 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 2405 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot)
NOTE: Running task 2406 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2407 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2408 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2410 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 2412 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2413 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2414 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2415 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2416 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2417 of 2417 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2417 tasks of which 2271 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1366605069262116660==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.22.2-1.22.3.patch"

RnJvbSAwNzFkZWE3ZjYwMTlkYmFiYTBhNmQwNzg3ZTk5NTNjMjg1Nzg2N2M3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMzo1NTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1vbXg6IHVwZ3JhZGUgMS4yMi4yIC0+IDEuMjIuMwoKLS0tCiAuLi4ve2dzdHJl
YW1lcjEuMC1vbXhfMS4yMi4yLmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi4zLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1vbXhfMS4y
Mi4yLmJiID0+IGdzdHJlYW1lcjEuMC1vbXhfMS4yMi4zLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
Mi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214
XzEuMjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIyLjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
My5iYgppbmRleCBkMmQyMzA1MGQ5Li42OTRhMTJiMWMxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIyLjIuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi4z
LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIFwKIAogU1JDX1VSSSA9ICJodHRw
czovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1vbXgvZ3N0LW9teC0ke1BWfS50
YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxYjBjNTdmMmNjNGRkZWVjNWU3ZjBjNDM2
ZTUwMmYwNjY2NWM0ZTkzYzczMjYxODU1Yjk0ZTA0ZmM5NDMzN2IyIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjZmNTFjMjMzMWMzMzQ1OTNjMmMzY2YxMmU5ZjIyYjllM2I0MTlhMzI0N2NmYjJmZWMw
ZTFiZDg0NTU2OTg2M2EiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3Qtb214LSR7UFZ9IgogCi0tIAoy
LjM5LjIKCg==

--===============1366605069262116660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5243e4e2432fc398605728dc1dfb6374f9f7b12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 34 Mirrors 0 Missed 44 Current 605 (43% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 633 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vala/0.56.6-r0/temp/log.do_packagedata_setscene.2028681
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 682 of 683 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1854 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: Running task 1970 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 2013 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2034 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: Running task 2101 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2102 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2103 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2109 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2165 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_fetch)
NOTE: Running task 2223 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_fetch)
NOTE: Running task 2224 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2244 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_write_config)
NOTE: Running task 2252 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: Running task 2253 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2270 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_write_config)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2272 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2273 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2274 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2275 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2276 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2277 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2278 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Started
NOTE: Running task 2279 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: Running task 2280 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2281 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 2282 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_unpack)
NOTE: Running task 2283 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2284 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2285 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: Running task 2286 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2288 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2291 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 2292 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_patch)
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2311 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2314 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2318 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2319 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2320 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2321 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2322 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic)
NOTE: Running task 2323 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic unihash changed to a2f6c8ee8f484ee1b9833a10098fd0c650c748a2af78e78b553e90d6b8de40da
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2324 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: Running task 2325 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: Running task 2326 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 2327 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_patch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2332 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2333 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2334 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 2335 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2336 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2337 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 2339 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 2340 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: Running task 2341 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2342 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2343 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2346 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2348 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2349 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2351 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2353 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2355 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2356 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2357 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2359 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2360 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2361 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2362 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2363 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2365 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2367 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2368 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2374 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2375 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2378 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2379 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2380 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2385 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 2389 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2390 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2391 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 2392 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 2395 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2399 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2401 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 2402 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2404 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2406 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2407 of 2407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2407 tasks of which 2283 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1366605069262116660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e5243e4e2432fc398605728dc1dfb6374f9f7b12"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 34 Mirrors 0 Missed 44 Current 615 (43% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 643 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vala/0.56.6-r0/temp/log.do_packagedata_setscene.2119146
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 692 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_package_setscene)
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Started
NOTE: Running task 1866 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1983 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_fetch)
NOTE: Running task 2026 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2050 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_fetch)
NOTE: Running task 2125 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2126 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_fetch)
NOTE: Running task 2127 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2133 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2197 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2216 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2217 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.2-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2259 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_fetch)
NOTE: Running task 2260 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_unpack)
NOTE: Running task 2261 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2262 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2283 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2285 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_write_config)
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Started
NOTE: Running task 2309 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_write_config)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2311 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 2312 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_unpack)
NOTE: Running task 2313 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2314 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: Running task 2315 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Started
NOTE: Running task 2316 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 2317 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Started
NOTE: recipe flac-1.4.2-r0: task do_unpack: Started
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2318 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_fetch: Succeeded
NOTE: Running task 2319 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Started
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2320 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 2321 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Started
NOTE: Running task 2322 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_patch)
NOTE: Running task 2323 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: Running task 2324 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2325 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_patch)
NOTE: Running task 2326 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2327 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Started
NOTE: recipe vala-0.56.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2346 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Started
NOTE: Running task 2350 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_patch)
NOTE: Running task 2353 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe flac-1.4.2-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2354 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2355 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2356 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_patch: Succeeded
NOTE: Running task 2357 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2358 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2359 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2360 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_configure)
NOTE: Running task 2361 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_lic unihash changed to a2f6c8ee8f484ee1b9833a10098fd0c650c748a2af78e78b553e90d6b8de40da
NOTE: recipe libomxil-0.9.3-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2362 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2367 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_patch)
NOTE: recipe flac-1.4.2-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libomxil-0.9.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2369 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 2371 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2373 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 2374 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.0-r0: task do_unpack: Succeeded
NOTE: Running task 2375 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_patch)
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_patch: Succeeded
NOTE: Running task 2376 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_create_wrappers)
NOTE: Running task 2377 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2378 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2379 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_configure)
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 2380 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 2382 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_compile)
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_configure: Succeeded
NOTE: Running task 2385 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_compile)
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 2386 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2387 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2389 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2391 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 2392 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_compile)
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_install)
NOTE: recipe libomxil-0.9.3-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_configure: Succeeded
NOTE: Running task 2395 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_compile)
NOTE: recipe flac-1.4.2-r0: task do_compile: Started
NOTE: recipe libomxil-0.9.3-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package)
NOTE: Running task 2397 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_populate_sysroot)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libomxil-0.9.3-r0: task do_package: Succeeded
NOTE: Running task 2399 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_packagedata)
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Started
NOTE: recipe libomxil-0.9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2400 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb:do_package_write_rpm)
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libwebp-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2401 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_install)
NOTE: recipe libwebp-1.3.0-r0: task do_install: Started
NOTE: recipe libomxil-0.9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2402 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 2403 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_package)
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.0-r0: task do_package: Started
NOTE: recipe libwebp-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2404 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.0.bb:do_packagedata)
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_install)
NOTE: recipe flac-1.4.2-r0: task do_install: Started
NOTE: recipe flac-1.4.2-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot)
NOTE: Running task 2407 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_package)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2408 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2409 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.2-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata)
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.2-r0: task do_packagedata: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2412 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2413 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2414 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2417 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2418 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 2422 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.56.0-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_install)
NOTE: recipe librsvg-2.56.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_populate_sysroot)
NOTE: Running task 2425 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_package)
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Started
NOTE: recipe librsvg-2.56.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2426 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2427 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.0.bb:do_packagedata)
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_populate_sysroot)
NOTE: Running task 2432 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2433 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_configure)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_configure: Succeeded
NOTE: Running task 2435 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_compile)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2436 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_install)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.2.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2439 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2441 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_write_rpm)
NOTE: Running task 2442 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_package_qa)
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_qa: Succeeded
NOTE: recipe gstreamer1.0-omx-1.22.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2443 of 2443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2443 tasks of which 2319 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.8-r0 to 0:0.56.6-r0) [version-going-backwards]
ERROR: vala-0.56.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1366605069262116660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.22.2 [default] to 1.22.3 [default]
packages/core2-32-poky-linux/gstreamer1.0-omx: PV changed from "1.22.2" to "1.22.3"
packages/core2-32-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.3.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-omx: PKGV changed from 1.22.2 [default] to 1.22.3 [default]

--===============1366605069262116660==--

