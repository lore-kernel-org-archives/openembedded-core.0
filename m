Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398A2C7EE21
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.13531.1681581686258227478
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DW6j6KV0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018786143fe2-f318988c-7540-4fab-80be-26df670bad4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1RqhFH6YfIghLZ93pKDf9G39qwKxH5YIA7AZuAlKd5o=;
	b=DW6j6KV0+dz4rRkFDDpzDAq3LiKCKfHLvpeMVhpvVCSEG1AroIO0Jxi+GEJ7KaZL
	bpBmdhvM6mYn8+7V0lWfDGcMn4HM/WtoyA3fr0GMgHQjKH5QWGvFx3Y95hrwL1eF7C8
	MNjiRGprbkSkMLOsWhX1jJvnyQVv0LnQBYc/kfXs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1RqhFH6YfIghLZ93pKDf9G39qwKxH5YIA7AZuAlKd5o=;
	b=O+Zvjg4fjBh0g+qCiqvGVxnkC+FIvISpU0obb5Uq4FqSdBwppTDsoknHRUCeNrcQ
	Ah0M9eL+4IbO23QSxG81DP7HZx6qUb3YElq8RljRXWQTkKPUeIdMyR5UDa2gM8k3h5o
	9HQX5SHllB5MjQEnMmMz3ltqPWHObNuyTnoTAKbc=
Content-Type: multipart/mixed; boundary="===============4458964067092060066=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-good: upgrading to 1.22.2 SUCCEEDED
Message-ID: <0101018786143fe2-f318988c-7540-4fab-80be-26df670bad4b-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180097

--===============4458964067092060066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-good* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-good-upgrade-1.22.0-1.22.2.patch
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
--===============4458964067092060066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:088f7a42c0e8459daf9854475faf7902315bdfff"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 85 Local 22 Mirrors 0 Missed 63 Current 619 (25% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 634 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/log.do_packagedata_setscene.2460822
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 703 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_setscene)
NOTE: Running task 1904 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1914 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1976 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 1977 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1979 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1980 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 2038 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2048 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 2061 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2081 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 2115 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2116 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_fetch)
NOTE: Running task 2117 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2118 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2125 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2166 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_fetch)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2205 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_write_config)
NOTE: Running task 2219 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 2220 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: Running task 2221 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2222 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 2241 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_write_config)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 2251 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 2252 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: Running task 2253 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: Running task 2254 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: Running task 2255 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: Running task 2256 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2257 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running task 2258 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: Running task 2259 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2260 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: Running task 2261 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2262 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: Running task 2263 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 2264 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2265 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_unpack)
NOTE: Running task 2266 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2267 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2268 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 2269 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_unpack)
NOTE: Running task 2270 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2271 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: Running task 2272 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: Running task 2273 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: Running task 2274 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2275 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2276 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2277 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: Running task 2278 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2279 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 2280 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2281 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: Running task 2282 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 2283 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2284 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2285 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: Running task 2286 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2287 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2288 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2289 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 2290 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 2293 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 2294 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2295 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2296 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2297 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2298 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2300 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2301 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2302 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: Running task 2303 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 2304 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2305 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: Running task 2306 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic)
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2307 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2308 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic unihash changed to ddbf6b27387096f3295bedeb481d38a4565eb81108b4e26a99ff9690ee17880c
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2309 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2322 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2323 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe ofono-2.0-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2324 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2325 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2326 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_package)
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_package: Started
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_package: Succeeded
NOTE: Running task 2330 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_packagedata)
NOTE: recipe taglib-1.13-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2333 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 2334 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 2335 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 2336 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 2337 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 2339 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2341 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2345 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2347 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2349 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2350 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2351 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2352 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2353 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2354 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe ofono-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2355 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_compile)
NOTE: recipe ofono-2.0-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2356 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2358 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2359 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2360 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2361 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe ofono-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2362 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 2363 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2364 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ofono-2.0-r0: task do_install: Succeeded
NOTE: Running task 2365 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_populate_sysroot)
NOTE: Running task 2366 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_package)
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2367 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2368 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 2369 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 2370 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 2371 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2372 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_package: Succeeded
NOTE: Running task 2373 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata)
NOTE: recipe ofono-2.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2374 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2414 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata)
NOTE: recipe libsoup-3.4.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Started
NOTE: recipe ofono-2.0-r0: task do_packagedata: Failed
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2375 tasks of which 2239 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata
Summary: There were 113 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ofono/2.0-r0/temp/log.do_packagedata.2512000
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata) failed with exit code '1'

--===============4458964067092060066==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-good-upgrade-1.22.0-1.22.2.patch"

RnJvbSBmNDQ4MGJkMDQ4ODUzODhkMDZkMDYxNWQ2MjU3NDUyOTc5MTlhYmYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTY6MjY6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kOiB1cGdyYWRlIDEuMjIuMCAtPiAxLjIyLjIKCi0tLQog
Li4udWdpbnMtZ29vZF8xLjIyLjAuYmIgPT4gZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIy
LjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIx
LjAtcGx1Z2lucy1nb29kXzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1nb29kXzEu
MjIuMi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIyLjAuYmIgYi9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29vZF8xLjIyLjIuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4yMi4wLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtZ29v
ZF8xLjIyLjIuYmIKaW5kZXggNjdhNmEyMjQwNC4uYTkzNTI5NDliNSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Rf
MS4yMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1nb29kXzEuMjIuMi5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICJo
dHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5vcmcvc3JjL2dzdC1wbHVnaW5zLWdvb2QvZ3N0
LXBsdWdpbnMtZ28KICAgICAgICAgICAgZmlsZTovLzAwMDEtcXQtaW5jbHVkZS1leHQtcXQtZ3N0
cXRnbC5oLWluc3RlYWQtb2YtZ3N0LWdsLWdzdGdsZi5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLXY0bDItRGVmaW5lLWlvY3RsX3JlcV90LWZvci1wb3NpeC1saW51eC1jYXNlLnBhdGNo
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTgyZTYxNzI3MWU3ZjMxNGQxYTIyMTFlM2UzODU2
YWUyZTQzMDNjOGMwZDYxMTRlOWM0YTVlYTU3MTkyOTRiMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI3YzhjYzU5NDI1ZjJiMjMyZjYwY2E3ZDEzZTU2ZWRkNjE1ZGE0ZjcxMWU3M2RkMDFhN2NmZmE0
NmU2YmMwY2RkIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMtZ29vZC0ke1BWfSIKIAot
LSAKMi4zOS4yCgo=

--===============4458964067092060066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-adaptivedemux2: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alaw: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alpha: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-alphacolor: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apetag: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-apps: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audiofx: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-audioparsers: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-auparse: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-autodetect: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-avi: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cairo: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-cutter: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGSIZE changed from 17478600 to 17485468 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-debug: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-deinterlace: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-dtmf: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-effectv: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-equalizer: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flac: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flv: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-flxdec: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-gdkpixbuf: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-glib: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-goom2k1: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-icydemux: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-id3demux: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-imagefreeze: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-interleave: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-isomp4: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-jpeg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-lame: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-level: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-af: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-az: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-bg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ca: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-cs: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-da: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-de: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-el: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-en-gb: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eo: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-es: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-eu: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fi: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fr: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGSIZE changed from 10887 to 14036 (+29%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-gl: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hr: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-hu: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-id: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-it: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ja: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ka: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ky: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lt: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-lv: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-mt: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nb: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-nl: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-or: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pl: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-pt-br: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ro: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-ru: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sk: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sl: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sq: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sr: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-sv: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-tr: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-uk: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-vi: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-cn: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-hk: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGSIZE changed from 11449 to 12179 (+6%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-zh-tw: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-matroska: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-meta: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-monoscope: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mpg123: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-mulaw: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multifile: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-multipart: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-navigationtest: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ossaudio: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-png: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-pulseaudio: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-replaygain: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtp: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGSIZE changed from 671696 to 675792 (+1%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtpmanager: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-rtsp: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-shapewipe: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-smpte: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-soup: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-spectrum: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-speex: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGSIZE changed from 12928600 to 12939908 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-taglib: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-udp: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-video4linux2: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videobox: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videocrop: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videofilter: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-videomixer: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavenc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-wavparse: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-ximagesrc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-xingmux: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-y4menc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.0.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.22.2.tar.xz file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
packages/core2-32-poky-linux/gstreamer1.0-plugins-good: PKGV changed from 1.22.0 [default] to 1.22.2 [default]

--===============4458964067092060066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:088f7a42c0e8459daf9854475faf7902315bdfff"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 23 Mirrors 0 Missed 63 Current 614 (26% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 630 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/log.do_packagedata_setscene.2633367
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 699 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_setscene)
NOTE: Running task 1898 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1906 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1957 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 1959 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1960 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1961 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 2020 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2030 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 2046 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2063 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 2096 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2097 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_fetch)
NOTE: Running task 2098 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2099 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2107 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2148 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_fetch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: Running task 2184 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_write_config)
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: Running task 2195 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: Running task 2196 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2197 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2198 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 2218 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 2219 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: Running task 2225 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_write_config)
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: Running task 2229 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2230 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: Running task 2231 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Started
NOTE: Running task 2232 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2233 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2234 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: Running task 2235 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2236 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2237 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: Running task 2238 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2239 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_unpack)
NOTE: Running task 2240 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2241 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2242 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2243 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: Running task 2244 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Started
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: Running task 2245 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: Running task 2246 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_unpack)
NOTE: Running task 2247 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: Running task 2248 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: Running task 2249 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2256 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Started
NOTE: Running task 2257 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 2258 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2259 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: Running task 2260 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: Running task 2261 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_patch)
NOTE: Running task 2263 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 2264 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2265 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: Running task 2266 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2267 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2268 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2269 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: Running task 2270 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2271 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 2272 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: Running task 2273 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 2274 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running task 2275 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 2276 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2277 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2278 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2279 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2280 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: Running task 2281 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 2282 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2283 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: Running task 2284 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2285 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 2286 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2287 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2288 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2289 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: Running task 2290 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic unihash changed to ddbf6b27387096f3295bedeb481d38a4565eb81108b4e26a99ff9690ee17880c
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2291 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2293 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2305 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2306 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2307 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2308 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: Running task 2309 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_populate_sysroot)
NOTE: Running task 2310 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_package)
NOTE: recipe taglib-1.13-r0: task do_package: Started
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: recipe taglib-1.13-r0: task do_package: Succeeded
NOTE: Running task 2312 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: Running task 2313 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 2314 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2322 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: Running task 2324 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2325 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: Running task 2326 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2329 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2330 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2331 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2332 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2333 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2334 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: Running task 2335 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2336 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe ofono-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_compile)
NOTE: recipe ofono-2.0-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2338 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2341 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2342 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2343 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe ofono-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_install)
NOTE: recipe ofono-2.0-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2346 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ofono-2.0-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_populate_sysroot)
NOTE: Running task 2348 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2349 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2350 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 2353 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2354 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.0-r0: task do_package: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2355 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata)
NOTE: recipe ofono-2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-2.0-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2355 tasks of which 2221 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata
Summary: There were 113 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/ofono/2.0-r0/temp/log.do_packagedata.2683540
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata) failed with exit code '1'

--===============4458964067092060066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-good/gstreamer1.0-plugins-good-locale-fur: PKGSIZE changed from 10887 to 14036 (+29%)

--===============4458964067092060066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 116 recipes from the core2-32 sysroot...done.
Removing 115 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:088f7a42c0e8459daf9854475faf7902315bdfff"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 467 Local 408 Mirrors 0 Missed 59 Current 214 (87% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 215 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 217 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 229 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 275 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 934 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 937 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 950 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 951 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 952 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 961 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 962 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 965 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 968 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 973 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 974 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 975 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 976 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_fetch)
NOTE: Running task 984 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: Running task 989 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_fetch)
NOTE: Running task 1003 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_write_config)
NOTE: Running task 1007 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.56-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: Running task 1009 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: Running task 1010 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: Running task 1011 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1012 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: Running task 1013 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 1014 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 310 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: Running task 1015 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: Running task 1016 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1017 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running setscene task 313 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running task 1018 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata_setscene)
NOTE: Running task 1019 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1020 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_unpack)
NOTE: recipe ell-0.56-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1021 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 319 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ell-0.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20221107-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 324 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: Running setscene task 327 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.68-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1042 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 1044 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: Running task 1052 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Started
NOTE: Running task 1053 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1054 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: Running task 1055 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1056 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 334 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1058 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: Running setscene task 336 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1059 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: Running task 1060 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: Running setscene task 343 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1061 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 1062 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gstreamer1.0-plugins-base/1.22.0-r0/temp/log.do_packagedata_setscene.2690580
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 345 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_setscene)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 346 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running setscene task 350 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 352 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1092 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: Running task 1093 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: Running task 1095 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1096 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1097 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: Running task 1098 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_patch)
NOTE: Running task 1099 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_patch)
NOTE: Running task 1100 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1101 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: Running task 1102 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 1103 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1104 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: Running task 1115 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1116 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 1117 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 373 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 1140 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1141 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1146 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic unihash changed to ddbf6b27387096f3295bedeb481d38a4565eb81108b4e26a99ff9690ee17880c
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 1156 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 380 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 391 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 395 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 417 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 459 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 468 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 515 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.239.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 534 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 560 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 574 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 575 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 611 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 656 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 666 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 681 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2073 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2078 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2106 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2107 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2168 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2169 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2190 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2191 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2238 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2240 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 2241 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 2242 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2243 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2244 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2245 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2246 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2247 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_configure)
NOTE: recipe ofono-2.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2248 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: Running task 2250 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_populate_sysroot)
NOTE: Running task 2251 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_package)
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: Running task 2252 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 2253 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe taglib-1.13-r0: task do_package: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 2254 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_packagedata)
NOTE: Running task 2255 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 2256 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe taglib-1.13-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe taglib-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2258 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 2259 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2260 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: Running task 2261 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2262 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2263 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2264 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2266 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2267 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2268 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2269 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2270 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: Running task 2272 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2273 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: recipe ofono-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2274 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: Running task 2275 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_compile)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe ofono-2.0-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2276 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2277 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 2279 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2280 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2281 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2282 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2283 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_install)
NOTE: recipe ofono-2.0-r0: task do_install: Started
NOTE: recipe ofono-2.0-r0: task do_install: Succeeded
NOTE: Running task 2284 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_populate_sysroot)
NOTE: Running task 2285 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_package)
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_package: Started
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2286 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 2287 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2288 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_compile)
NOTE: recipe speex-1.2.1-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 2289 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 2290 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2291 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_package: Succeeded
NOTE: Running task 2292 of 2332 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata)
NOTE: recipe ofono-2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-2.0-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_compile: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2292 tasks of which 2168 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata
Summary: There were 113 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ofono/2.0-r0/temp/log.do_packagedata.2753514
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata) failed with exit code '1'

--===============4458964067092060066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:088f7a42c0e8459daf9854475faf7902315bdfff"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 23 Mirrors 0 Missed 63 Current 614 (26% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 630 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1898 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1908 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1959 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1960 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 1961 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1962 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 2021 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2030 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 2046 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2063 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 2096 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2097 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_fetch)
NOTE: Running task 2098 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2099 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2110 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: Running task 2148 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_fetch)
NOTE: Running task 2184 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_write_config)
NOTE: Running task 2219 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_write_config)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gstreamer1.0-plugins-base/1.22.0-r0/temp/log.do_packagedata_setscene.2518382
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 699 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2229 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: Running task 2230 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2231 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: Running task 2232 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: Running task 2233 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: Running task 2234 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2235 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2236 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Succeeded
NOTE: Running task 2237 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Succeeded
NOTE: Running task 2238 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2239 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2240 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2241 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2242 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2243 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: Running task 2244 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2245 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_unpack)
NOTE: Running task 2246 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2247 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2248 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2249 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2250 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_unpack)
NOTE: Running task 2251 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2252 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: Running task 2253 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: Running task 2254 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: Running task 2255 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 2256 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2257 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2258 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: Running task 2259 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2260 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: Running task 2261 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 2262 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: Running task 2263 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2264 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: Running task 2265 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: Running task 2266 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2267 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2268 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2269 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_patch)
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2270 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2271 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 2272 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: Running task 2273 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: Running task 2274 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 2275 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: Running task 2276 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running task 2277 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2278 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2279 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2280 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2281 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2282 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2283 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2284 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2285 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: Running task 2286 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2287 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2288 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2289 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2290 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic unihash changed to ddbf6b27387096f3295bedeb481d38a4565eb81108b4e26a99ff9690ee17880c
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2293 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2305 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe ofono-2.0-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2306 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2307 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2308 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: Running task 2309 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_populate_sysroot)
NOTE: Running task 2310 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_package)
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_package: Started
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: Running task 2311 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2312 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_package: Succeeded
NOTE: Running task 2313 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_packagedata: Started
NOTE: recipe taglib-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 2314 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2321 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: Running task 2322 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: Running task 2324 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: Running task 2325 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2326 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2329 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2330 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2331 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2332 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2333 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_compile)
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_compile: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2335 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2337 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2339 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2341 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: Running task 2343 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe ofono-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_install)
NOTE: recipe ofono-2.0-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: recipe ofono-2.0-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: Running task 2346 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_populate_sysroot)
NOTE: Running task 2347 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2348 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_package)
NOTE: Running task 2349 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2350 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 2352 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 2353 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2354 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_package: Succeeded
NOTE: Running task 2355 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata)
NOTE: recipe ofono-2.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2356 of 2396 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: recipe ofono-2.0-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.0-r0: task do_configure: Started
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2356 tasks of which 2221 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata
Summary: There were 113 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/ofono/2.0-r0/temp/log.do_packagedata.2568658
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata) failed with exit code '1'

--===============4458964067092060066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:088f7a42c0e8459daf9854475faf7902315bdfff"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 23 Mirrors 0 Missed 63 Current 604 (26% match, 90% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 620 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1886 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_fetch)
NOTE: Running task 1894 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1945 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_fetch)
NOTE: Running task 1946 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 1949 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_fetch)
NOTE: Running task 1950 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_fetch)
NOTE: Running task 2006 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_fetch)
NOTE: Running task 2015 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_fetch)
NOTE: Running task 2026 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_fetch)
NOTE: Running task 2045 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_fetch)
NOTE: Running task 2076 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_fetch)
NOTE: Running task 2077 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_fetch)
NOTE: Running task 2078 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_fetch)
NOTE: Running task 2080 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_fetch)
NOTE: Running task 2087 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_write_config)
NOTE: Running task 2122 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_fetch)
NOTE: Running task 2150 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_write_config)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: Running task 2183 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_write_config)
NOTE: recipe speexdsp-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: Running task 2193 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_unpack)
NOTE: recipe ofono-2.0-r0: task do_fetch: Started
NOTE: Running task 2194 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2195 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 2196 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_fetch: Succeeded
NOTE: Running task 2197 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: Running task 2198 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Started
NOTE: recipe ofono-2.0-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_fetch: Started
NOTE: Running task 2199 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_unpack)
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Started
NOTE: Running task 2200 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lame-3.100-r0: task do_fetch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Started
NOTE: recipe speex-1.2.1-r0: task do_fetch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_fetch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2201 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe mpg123-1.31.3-r0: task do_fetch: Succeeded
NOTE: recipe lame-3.100-r0: task do_fetch: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gstreamer1.0-plugins-base/1.22.0-r0/temp/log.do_packagedata_setscene.2575668
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe pulseaudio-16.1-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Started
NOTE: Running setscene task 689 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_package_setscene)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Started
NOTE: Running task 2202 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_unpack)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.0-r0: task do_unpack: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_write_config: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_write_config: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 2203 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2204 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: Running task 2205 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_patch)
NOTE: Running task 2206 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2207 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_patch)
NOTE: Running task 2208 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_unpack)
NOTE: Running task 2209 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_unpack)
NOTE: Running task 2210 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2211 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_unpack)
NOTE: Running task 2212 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_unpack)
NOTE: Running task 2213 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_unpack)
NOTE: Running task 2214 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_unpack)
NOTE: Running task 2215 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_unpack)
NOTE: Running task 2216 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_unpack)
NOTE: Running task 2217 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2218 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2219 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_unpack)
NOTE: Running task 2220 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2221 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Started
NOTE: recipe ofono-2.0-r0: task do_patch: Started
NOTE: recipe taglib-1.13-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Started
NOTE: recipe speex-1.2.1-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Started
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_patch: Succeeded
NOTE: Running task 2222 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13-r0: task do_unpack: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2223 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_patch)
NOTE: Running task 2224 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_patch)
NOTE: recipe lame-3.100-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2225 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_patch)
NOTE: Running task 2226 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 2227 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_patch: Started
NOTE: recipe libtool-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 2228 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_patch)
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_unpack: Succeeded
NOTE: Running task 2229 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_patch)
NOTE: recipe libsoup-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2230 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_patch)
NOTE: recipe nghttp2-1.52.0-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2231 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_patch)
NOTE: recipe speex-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pulseaudio-16.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_patch: Started
NOTE: Running task 2233 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_patch)
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2234 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2235 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_configure)
NOTE: recipe lame-3.100-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Started
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2236 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_patch)
NOTE: recipe taglib-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe taglib-1.13-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_unpack: Succeeded
NOTE: Running task 2238 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_generate_toolchain_file)
NOTE: Running task 2239 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2240 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_patch)
NOTE: recipe nghttp2-1.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.31.3-r0: task do_patch: Succeeded
NOTE: Running task 2241 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2242 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lame-3.100-r0: task do_patch: Succeeded
NOTE: Running task 2243 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Started
NOTE: Running task 2244 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Started
NOTE: Running task 2245 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_generate_toolchain_file)
NOTE: Running task 2246 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_deploy_source_date_epoch)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Started
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Started
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.2-r0: task do_patch: Succeeded
NOTE: Running task 2247 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_deploy_source_date_epoch)
NOTE: recipe speex-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe taglib-1.13-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe taglib-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_patch: Succeeded
NOTE: Running task 2248 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2249 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2250 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic)
NOTE: recipe mpg123-1.31.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-16.1-r0: task do_patch: Succeeded
NOTE: recipe lame-3.100-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2251 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2252 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_configure)
NOTE: recipe ofono-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_patch: Succeeded
NOTE: Running task 2253 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe taglib-1.13-r0: task do_configure: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2254 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_configure)
NOTE: recipe libpsl-0.21.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lame-3.100-r0: task do_configure: Started
NOTE: Running task 2255 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_configure)
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_populate_lic: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.2.bb:do_populate_lic unihash changed to ddbf6b27387096f3295bedeb481d38a4565eb81108b4e26a99ff9690ee17880c
NOTE: recipe gstreamer1.0-plugins-good-1.22.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Started
NOTE: recipe pulseaudio-16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ofono-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2256 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_configure)
NOTE: recipe ofono-2.0-r0: task do_configure: Started
NOTE: recipe libtool-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2257 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2269 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.0.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2270 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.0-r0: task do_packagedata: Succeeded
NOTE: recipe taglib-1.13-r0: task do_configure: Succeeded
NOTE: Running task 2271 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_compile)
NOTE: recipe taglib-1.13-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_compile: Succeeded
NOTE: Running task 2272 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_install)
NOTE: recipe taglib-1.13-r0: task do_install: Started
NOTE: recipe taglib-1.13-r0: task do_install: Succeeded
NOTE: Running task 2273 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_populate_sysroot)
NOTE: Running task 2274 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_package)
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Started
NOTE: recipe taglib-1.13-r0: task do_package: Started
NOTE: recipe taglib-1.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_configure: Succeeded
NOTE: Running task 2275 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_configure: Succeeded
NOTE: Running task 2276 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Started
NOTE: recipe taglib-1.13-r0: task do_package: Succeeded
NOTE: Running task 2277 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/taglib/taglib_1.13.bb:do_packagedata)
NOTE: recipe taglib-1.13-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_install)
NOTE: recipe taglib-1.13-r0: task do_packagedata: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_compile: Succeeded
NOTE: Running task 2279 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_install)
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_install: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_install: Succeeded
NOTE: Running task 2280 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot)
NOTE: Running task 2281 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_package)
NOTE: Running task 2282 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_populate_sysroot)
NOTE: Running task 2283 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_package)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nghttp2-1.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2284 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_package: Succeeded
NOTE: Running task 2285 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nghttp2/nghttp2_1.52.0.bb:do_packagedata)
NOTE: recipe libtool-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 2286 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_compile)
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_package: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Started
NOTE: Running task 2287 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2288 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2289 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.52.0-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2292 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_install)
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2294 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2295 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Started
NOTE: Running task 2296 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe ofono-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe ofono-2.0-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2299 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speex-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speex_1.2.1.bb:do_configure)
NOTE: recipe speex-1.2.1-r0: task do_configure: Started
NOTE: recipe lame-3.100-r0: task do_configure: Succeeded
NOTE: Running task 2301 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_compile)
NOTE: recipe lame-3.100-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2302 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 2303 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_install)
NOTE: recipe libtool-2.4.7-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_configure: Succeeded
NOTE: Running task 2304 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_compile)
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Started
NOTE: recipe ofono-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2305 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_install)
NOTE: recipe ofono-2.0-r0: task do_install: Started
NOTE: recipe libtool-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 2306 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 2307 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_package)
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Started
NOTE: recipe ofono-2.0-r0: task do_install: Succeeded
NOTE: Running task 2308 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_populate_sysroot)
NOTE: Running task 2309 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_package)
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ofono-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lame-3.100-r0: task do_compile: Succeeded
NOTE: Running task 2310 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_install)
NOTE: recipe lame-3.100-r0: task do_install: Started
NOTE: recipe lame-3.100-r0: task do_install: Succeeded
NOTE: Running task 2311 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_populate_sysroot)
NOTE: Running task 2312 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_package)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Started
NOTE: recipe lame-3.100-r0: task do_package: Started
NOTE: recipe libtool-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 2313 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.7.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.7-r0: task do_packagedata: Succeeded
NOTE: recipe lame-3.100-r0: task do_package: Succeeded
NOTE: Running task 2314 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/lame/lame_3.100.bb:do_packagedata)
NOTE: recipe lame-3.100-r0: task do_packagedata: Started
NOTE: recipe lame-3.100-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_compile: Succeeded
NOTE: Running task 2315 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_install)
NOTE: recipe libpsl-0.21.2-r0: task do_install: Started
NOTE: recipe libpsl-0.21.2-r0: task do_install: Succeeded
NOTE: Running task 2316 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_package)
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpsl-0.21.2-r0: task do_package: Started
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2318 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-2.0-r0: task do_package: Succeeded
NOTE: Running task 2319 of 2360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata)
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-2.0-r0: task do_packagedata: Started
NOTE: recipe ofono-2.0-r0: task do_packagedata: Failed
NOTE: recipe libsoup-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_package: Succeeded
NOTE: recipe speex-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2319 tasks of which 2185 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata
Summary: There were 113 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.22.2-r0 to 0:1.22.0-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.22.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:2.1-r0 to 0:2.0-r0) [version-going-backwards]
ERROR: ofono-2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/ofono/2.0-r0/temp/log.do_packagedata.2626158
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.0.bb:do_packagedata) failed with exit code '1'

--===============4458964067092060066==--

