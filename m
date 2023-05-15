Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFF9C87FDC
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3766.1684186747757284046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Cj8xTZC0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188215a61e2-870d8f69-2696-416d-8bc9-4cbd8dcaeb9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bjN2iXDSo1BcHq0WBTQNw4ETIBMgNyK2QcE6AJSL1IE=;
	b=Cj8xTZC0HdTE+oAZHeTytmLPIh8Jvw1i6xcF/RZZT/nrdPWHirySMVLEC0pbHAJY
	09rbRnaWn+KoG5Ll/VOO4BxiTVM4WeDxqOFKRmqc1ZX2S6vjW+WwUlqC/PGBNBxzNH7
	J8BT9hD0hBY8mFh/hSpx2aFWh1VPNTMjHrgSRuWo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bjN2iXDSo1BcHq0WBTQNw4ETIBMgNyK2QcE6AJSL1IE=;
	b=QQCRhIeDHKnv2cs/4+tF/aDuLEeOx/TaxEpz2tK86vtD62MD4cs1bBXR3XtqfHoq
	P4yKMLoORak0jy+1K9gOJbke9jyUXM2EaGvXvgOWwWPRSZTgDXnH3UHqNIlVpLSWAim
	PArJqIcWdXEirXZbakfhWDW+5m/IWDt+6BSURugI=
Content-Type: multipart/mixed; boundary="===============4969055760471229742=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 8237b02be4e6f92a9e1aebbed23d7b5de0e3543c
 SUCCEEDED
Message-ID: <01010188215a61e2-870d8f69-2696-416d-8bc9-4cbd8dcaeb9a-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181376

--===============4969055760471229742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *8237b02be4e6f92a9e1aebbed23d7b5de0e3543c* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
--===============4969055760471229742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 51 skipped, 0 masked, 0 errors.
Removing 98 recipes from the core2-32 sysroot...done.
Removing 104 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:45490f7178155d3444edde744c000f9e59302341"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 373 Local 365 Mirrors 0 Missed 8 Current 196 (97% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 197 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 208 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 952 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Succeeded
NOTE: Running task 977 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Succeeded
NOTE: Running task 978 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Succeeded
NOTE: Running task 979 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 980 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 981 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 5db8f8516c6852d1c8242799cbc13a3890fe4790cd8a2d5ca1e77e55f4a01934
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk+3-3.24.37-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 232 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 260 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 261 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.1256542
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 265 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.1256536
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 267 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 272 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 279 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 293 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 299 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 300 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 329 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 346 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 349 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 379 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 410 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 458 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 498 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 518 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 539 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 549 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 569 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1981 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: Running task 1982 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: Running task 1995 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2005 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2006 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.37-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Succeeded
NOTE: Running task 2007 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Succeeded
NOTE: Running task 2008 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Succeeded
NOTE: Running task 2009 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2010 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Succeeded
NOTE: Running task 2011 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Succeeded
NOTE: Running task 2012 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2013 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2014 of 2014 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2014 tasks of which 1995 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4969055760471229742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 73 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:45490f7178155d3444edde744c000f9e59302341"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 43 Mirrors 0 Missed 7 Current 544 (86% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 556 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.1249691
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 591 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.1249689
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: Running task 1919 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Succeeded
NOTE: Running task 2042 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: Running task 2053 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2077 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: Running task 2079 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Succeeded
NOTE: Running task 2080 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2081 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2082 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2083 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 5db8f8516c6852d1c8242799cbc13a3890fe4790cd8a2d5ca1e77e55f4a01934
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2088 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Succeeded
NOTE: Running task 2089 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Succeeded
NOTE: Running task 2090 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Succeeded
NOTE: Running task 2091 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2092 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Succeeded
NOTE: Running task 2093 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Succeeded
NOTE: Running task 2094 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2095 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2096 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2096 tasks of which 2078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4969055760471229742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:45490f7178155d3444edde744c000f9e59302341"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 43 Mirrors 0 Missed 7 Current 544 (86% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 556 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.1239491
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 591 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.1239489
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 592 of 594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: Running task 1919 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Succeeded
NOTE: Running task 2042 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: Running task 2053 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2077 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: Running task 2079 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Succeeded
NOTE: Running task 2080 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Succeeded
NOTE: Running task 2081 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2082 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2083 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 5db8f8516c6852d1c8242799cbc13a3890fe4790cd8a2d5ca1e77e55f4a01934
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2088 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Succeeded
NOTE: Running task 2089 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Succeeded
NOTE: Running task 2090 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Succeeded
NOTE: Running task 2091 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2092 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Succeeded
NOTE: Running task 2093 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Succeeded
NOTE: Running task 2094 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2095 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2096 of 2096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2096 tasks of which 2078 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4969055760471229742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+5a491c5ad3 [default] to 0.0+gitAUTOINC+8237b02be4 [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+8237b02be4"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+8237b02be4"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14299436 to 15368796 (+7%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+8237b02be4"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+8237b02be4"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+8237b02be4"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+8237b02be4"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3542339 to 3692462 (+4%)
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3
 -r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUT
 OINC+5a491c5ad3-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.c /usr/src/debug/puzzl
 es/2_0.0+gitAUTOINC+5a491c5ad3-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/ps.c /usr/src/debug/puzzle
 s/2_0.0+gitAUTOINC+5a491c5ad3-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sixteen.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/hat.c /usr/src/d
 ebug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/latin.h /us
 r/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02
 be4-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/map.c /usr/src/debug/puzzles/2_0.0+gitA
 UTOINC+8237b02be4-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/dsf.c /usr/src/debug/puzzles
 /2_0.0+gitAUTOINC+8237b02be4-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+8237b02be4-r0/sort.c"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+8237b02be4"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+8237b02be4"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7028162 to 7638470 (+9%)

--===============4969055760471229742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:45490f7178155d3444edde744c000f9e59302341"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 43 Mirrors 0 Missed 7 Current 540 (86% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 552 of 590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.1244565
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 587 of 590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.1244563
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 588 of 590 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: Running task 1907 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Succeeded
NOTE: Running task 2028 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: Running task 2039 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2063 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: Running task 2065 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Succeeded
NOTE: Running task 2066 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Succeeded
NOTE: Running task 2067 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2068 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2069 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 5db8f8516c6852d1c8242799cbc13a3890fe4790cd8a2d5ca1e77e55f4a01934
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2074 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Succeeded
NOTE: Running task 2075 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Succeeded
NOTE: Running task 2076 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Succeeded
NOTE: Running task 2077 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2078 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Succeeded
NOTE: Running task 2079 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Succeeded
NOTE: Running task 2080 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2081 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2082 of 2082 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2082 tasks of which 2064 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4969055760471229742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+8237b02be4

--===============4969055760471229742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1804 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:45490f7178155d3444edde744c000f9e59302341"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 43 Mirrors 0 Missed 7 Current 548 (86% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 560 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libxft/1_2.3.7-r0/temp/log.do_packagedata_setscene.1234363
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 595 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_package_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/harfbuzz/7.1.0-r0/temp/log.do_packagedata_setscene.1234361
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 598 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_package_setscene)
NOTE: Running task 1937 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_fetch: Succeeded
NOTE: Running task 2060 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_package_setscene: Succeeded
NOTE: Running task 2071 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2095 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata)
NOTE: Running task 2097 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_unpack: Succeeded
NOTE: Running task 2098 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_patch: Succeeded
NOTE: Running task 2099 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2100 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2101 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to 5db8f8516c6852d1c8242799cbc13a3890fe4790cd8a2d5ca1e77e55f4a01934
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2106 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_configure: Succeeded
NOTE: Running task 2107 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_compile: Succeeded
NOTE: Running task 2108 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_install: Succeeded
NOTE: Running task 2109 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2110 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package: Succeeded
NOTE: Running task 2111 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_packagedata: Succeeded
NOTE: Running task 2112 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2113 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+8237b02be4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2114 of 2114 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2114 tasks of which 2096 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-src went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dbg went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-staticdev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-dev went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-doc went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft-locale went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: QA Issue: Package version for package libxft went backwards which would break package feeds (from 1:2.3.8-r0 to 1:2.3.7-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: libxft-1_2.3.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:7.3.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4969055760471229742==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAyYTcxN2NjYTdlZWQzMTNhYzU5OWNhY2E5YzdiZTAwMWU1OGUzMTA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMjA6MTc6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggNGIwNDU4ODY4Mi4uZDg5NGIwMDFjZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICI1YTQ5MWM1YWQzMzNlZjM0YzFlNzcxM2Y5MjBmNTFj
YmIyMDVhZjYwIgorU1JDUkVWID0gIjgyMzdiMDJiZTRlNmY5MmE5ZTFhZWJiZWQyM2Q3YjVkZTBl
MzU0M2MiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============4969055760471229742==--

